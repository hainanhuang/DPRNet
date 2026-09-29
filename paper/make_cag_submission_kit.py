#!/usr/bin/env python3
"""Generate DOCX companion files for the Computers & Graphics submission."""

from __future__ import annotations

import argparse
import html
from pathlib import Path
import zipfile


TITLE = "Dynamic Prototype Routing for Lightweight Image Super-Resolution"
SUBMISSION_DATE = "September 23, 2026"

HIGHLIGHTS = [
    "Dynamic prototypes replace history-dependent centers for token routing",
    "Per-image token grouping adapts directly to current visual content",
    "Assignment confidence guides token ordering, gating, and soft fallback",
    "A balancing loss yields more even and stable prototype usage across seeds",
    "The model remains lightweight across five super-resolution benchmarks",
]

INTEREST_STATEMENT = (
    "The authors declare that they have no known competing financial interests "
    "or personal relationships that could have appeared to influence the work "
    "reported in this paper."
)

AI_STATEMENT = (
    "During the preparation of this work, the authors used generative "
    "AI-assisted technologies to improve the language and readability of the "
    "manuscript and to assist with its organization. After using these "
    "technologies, the authors reviewed and edited the content as needed and "
    "take full responsibility for the content of the article."
)

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


def paragraph(text: str, *, bold: bool = False) -> str:
    escaped = html.escape(text)
    properties = "<w:rPr><w:b/></w:rPr>" if bold else ""
    return (
        f'<w:p><w:r>{properties}<w:t xml:space="preserve">'
        f"{escaped}</w:t></w:r></w:p>"
    )


def document(paragraphs: list[str]) -> str:
    body = "".join(paragraphs)
    return f"""<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    {body}
    <w:sectPr>
      <w:pgSz w:w="11906" w:h="16838"/>
      <w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440"/>
    </w:sectPr>
  </w:body>
</w:document>"""


def write_docx(path: Path, paragraphs: list[str]) -> None:
    with zipfile.ZipFile(path, "w", zipfile.ZIP_DEFLATED) as archive:
        archive.writestr("[Content_Types].xml", CONTENT_TYPES)
        archive.writestr("_rels/.rels", RELS)
        archive.writestr("word/document.xml", document(paragraphs))


def build_files(output_dir: Path) -> None:
    if not 3 <= len(HIGHLIGHTS) <= 5:
        raise ValueError("Elsevier highlights must contain three to five items")
    too_long = [(item, len(item)) for item in HIGHLIGHTS if len(item) > 85]
    if too_long:
        raise ValueError(f"Highlights exceed 85 characters: {too_long}")

    output_dir.mkdir(parents=True, exist_ok=True)

    title_page = [
        paragraph(TITLE, bold=True),
        paragraph("Article type: Research paper"),
        paragraph("Authors", bold=True),
        paragraph("Hainan Huang (corresponding author)"),
        paragraph("Xiang Li"),
        paragraph("Affiliation", bold=True),
        paragraph(
            "School of Computer Science, China University of Geosciences "
            "(Wuhan), Future City Campus, No. 68 Jincheng Street, East Lake "
            "High-tech Development Zone, Wuhan, Hubei 430078, China"
        ),
        paragraph("Author email addresses", bold=True),
        paragraph("Hainan Huang: huanghainan.7@cug.edu.cn"),
        paragraph("Xiang Li: lixiang@cug.edu.cn"),
        paragraph("Corresponding author", bold=True),
        paragraph("Hainan Huang"),
        paragraph(
            "School of Computer Science, China University of Geosciences "
            "(Wuhan), Future City Campus, No. 68 Jincheng Street, East Lake "
            "High-tech Development Zone, Wuhan, Hubei 430078, China"
        ),
        paragraph("Email: huanghainan.7@cug.edu.cn"),
        paragraph("CRediT authorship contribution statement", bold=True),
        paragraph(
            "Hainan Huang: Conceptualization, Methodology, Software, Validation, "
            "Formal analysis, Investigation, Data curation, Writing - original "
            "draft, Visualization."
        ),
        paragraph(
            "Xiang Li: Conceptualization, Supervision, Funding acquisition, "
            "Resources, Writing - review and editing, Project administration."
        ),
        paragraph("All authors have read and approved the submitted manuscript."),
        paragraph("Funding", bold=True),
        paragraph("This research received no external funding."),
        paragraph("Acknowledgements", bold=True),
        paragraph("None."),
        paragraph("Declaration of competing interest", bold=True),
        paragraph("Declarations of interest: none."),
        paragraph("Data availability", bold=True),
        paragraph(
            "The datasets used in this study are all publicly available: the "
            "DIV2K training set and the Set5, Set14, BSD100, Urban100, and "
            "Manga109 benchmarks. No new data were generated. The code and "
            "trained models are not publicly available due to institutional "
            "restrictions."
        ),
    ]
    write_docx(output_dir / "title_page_cag.docx", title_page)

    highlights = [paragraph("Highlights", bold=True)]
    highlights.extend(paragraph("- " + item) for item in HIGHLIGHTS)
    write_docx(output_dir / "highlights_cag.docx", highlights)

    declaration = [
        paragraph("Declaration of Interest Statement", bold=True),
        paragraph(f"Manuscript: {TITLE}"),
        paragraph("[X] " + INTEREST_STATEMENT),
        paragraph(
            "[ ] The authors declare financial interests or personal "
            "relationships that may be considered potential competing interests."
        ),
        paragraph("Authors: Hainan Huang; Xiang Li"),
        paragraph(f"Date: {SUBMISSION_DATE}"),
    ]
    write_docx(output_dir / "declaration_of_interest_cag.docx", declaration)

    ai_declaration = [
        paragraph(
            "Declaration of generative AI and AI-assisted technologies in the "
            "manuscript preparation process",
            bold=True,
        ),
        paragraph(AI_STATEMENT),
    ]
    write_docx(
        output_dir / "generative_ai_declaration_cag.docx", ai_declaration
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--output",
        type=Path,
        default=(
            Path(__file__).resolve().parent
            / "submissions"
            / "03_computers_and_graphics_2026-09-23"
        ),
    )
    args = parser.parse_args()
    build_files(args.output.resolve())


if __name__ == "__main__":
    main()
