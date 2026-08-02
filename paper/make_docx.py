#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
make_docx.py — Generate minimal, valid .docx files for Neurocomputing submission
WITHOUT any third-party library (python-docx not required). A .docx is just a ZIP
container of Office Open XML parts; we write the few mandatory parts by hand.

Outputs (in the same folder as this script):
  - highlights.docx                       (Editorial Manager "Highlights" item)
  - declaration_of_competing_interest.docx(Editorial Manager "Declaration" item)

Run:  python3 make_docx.py
"""
import zipfile, os, html

HERE = os.path.dirname(os.path.abspath(__file__))

CONTENT_TYPES = """<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
  <Default Extension="xml" ContentType="application/xml"/>
  <Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
</Types>"""

RELS = """<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
</Relationships>"""


def _para(text, bold=False):
    text = html.escape(text)
    rpr = "<w:rPr><w:b/></w:rPr>" if bold else ""
    return (f'<w:p><w:r>{rpr}<w:t xml:space="preserve">{text}</w:t></w:r></w:p>')


def build_document(paragraphs):
    body = "".join(paragraphs)
    return f"""<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    {body}
    <w:sectPr><w:pgSz w:w="11906" w:h="16838"/>
    <w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440"/></w:sectPr>
  </w:body>
</w:document>"""


def write_docx(path, document_xml):
    with zipfile.ZipFile(path, "w", zipfile.ZIP_DEFLATED) as z:
        z.writestr("[Content_Types].xml", CONTENT_TYPES)
        z.writestr("_rels/.rels", RELS)
        z.writestr("word/document.xml", document_xml)


# ---- 1. Highlights ---------------------------------------------------
highlights = [
    "Dynamic Prototype Routing replaces CATANet's TAB as a drop-in, interface-kept module",
    "Per-image prototypes are built from current tokens, removing cross-batch EMA centers",
    "A learnable query bank decouples prototype generation from confirmation",
    "Assignment confidence drives token ordering, global gating and a soft fallback",
    "A usage-balancing loss prevents prototype-slot collapse and stabilizes routing",
]
paras = [_para("Highlights", bold=True),
         _para("Dynamic Prototype Routing for Lightweight Image Super-Resolution", bold=True)]
paras += [_para("\u2022 " + h) for h in highlights]
write_docx(os.path.join(HERE, "highlights.docx"), build_document(paras))

# ---- 2. Declaration of Competing Interest ---------------------------
decl = [
    _para("Declaration of Competing Interest", bold=True),
    _para("Manuscript: Dynamic Prototype Routing for Lightweight Image Super-Resolution"),
    _para("The authors declare that they have no known competing financial interests or "
          "personal relationships that could have appeared to influence the work reported "
          "in this paper."),
    _para(""),
    _para("Hainan Huang"),
    _para("Xiang Li"),
]
write_docx(os.path.join(HERE, "declaration_of_competing_interest.docx"), build_document(decl))

# ---- 3. Abstract (standalone item required by the new Elsevier flow) --
abstract_text = (
    "Lightweight single image super-resolution (SR) must balance reconstruction quality "
    "with model cost on resource-constrained platforms. Content-aware routing improves this "
    "balance by grouping semantically related tokens, yet the widely used center-based "
    "router - the Token Aggregation Block (TAB) of CATANet - relies on cross-batch "
    "exponential-moving-average centers, hard assignment labels, and a coupled prototype "
    "update/confirmation step, tying routing to a drifting historical state and discarding "
    "assignment confidence. We revisit token routing itself and propose Dynamic Prototype "
    "Routing (DPR), a confidence-aware, drop-in replacement for the TAB routing that keeps "
    "the CATANet backbone and tensor interface unchanged. DPR "
    "builds per-image prototypes directly from the current tokens, decouples prototype "
    "generation from confirmation through a learnable query bank, matches tokens with a "
    "bounded learnable temperature, and carries the resulting assignment confidence into "
    "token ordering, global gating, and a soft fallback, with a usage-balancing regularizer "
    "that discourages prototype-slot collapse. Trained on DIV2K and evaluated on five "
    "standard benchmarks at x2/x3/x4, DPRNet matches CATANet-level accuracy with small gains "
    "on most benchmark cells while staying in the lightweight regime; at x4, for example, it "
    "obtains 26.89 dB on Urban100 with 52.14 G Multi-Adds, fewer than the lightweight "
    "Transformer baselines SwinIR-light and SRFormer-light under the same input convention. "
    "Three-seed ablations isolate each design choice: the dynamic prototypes outperform a "
    "history-center EMA variant under an identical protocol, and the balancing loss makes "
    "prototype usage more balanced and more stable across seeds. DPR thus offers a reusable, "
    "interpretable alternative to center-based token routing rather than a larger backbone."
)
abstract = [
    _para("Abstract", bold=True),
    _para("Dynamic Prototype Routing for Lightweight Image Super-Resolution", bold=True),
    _para(abstract_text),
]
write_docx(os.path.join(HERE, "abstract.docx"), build_document(abstract))

print("Wrote:")
for f in ("highlights.docx", "declaration_of_competing_interest.docx", "abstract.docx"):
    p = os.path.join(HERE, f)
    print(f"  {f}  ({os.path.getsize(p)} bytes)")
