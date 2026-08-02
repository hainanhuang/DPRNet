#!/usr/bin/env bash
# =====================================================================
# make_springer_kit.sh
# Assemble a Springer submission kit for the two free-of-charge target
# journals, reusing ONE compiled manuscript (main_springer.*):
#
#   MVAP  = Machine Vision and Applications   (primary,  T4, no APC)
#   TVCJ  = The Visual Computer               (backup,   T3, subscription/no APC)
#
# Springer first-submission policy (verified 2026-08-01):
#   - A single compiled PDF (figures embedded) is accepted for first
#     submission; the exact sn-jnl.cls template is NOT required up front.
#   - Editable LaTeX source is requested at revision/acceptance, so we also
#     ship a self-contained, test-compiled source zip.
#
# Output layout:
#   submit_springer/
#     main_springer.pdf              <- MANUSCRIPT (single PDF, figures inline)
#     manuscript_latex_source.zip    <- editable source (for revision/acceptance)
#     cover_letter_mvap.txt          <- paste when submitting to MVAP  (primary)
#     cover_letter_tvcj.txt          <- paste when submitting to TVCJ  (backup)
#     README.txt                     <- what-to-upload-where cheat sheet
#
# The source zip is test-compiled from scratch to prove it is self-contained.
#
# Usage (TinyTeX example):
#   PATH="$HOME/Library/TinyTeX/bin/universal-darwin:$PATH" bash make_springer_kit.sh
# =====================================================================
set -euo pipefail
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="$SRC/submit_springer"
SRCZIP_DIR="$OUT/_latex_src"
ZIP="$OUT/manuscript_latex_source.zip"

echo "==> Clean submit_springer/ ..."
rm -rf "$OUT"; mkdir -p "$SRCZIP_DIR"

# ---- 1. Assemble the LaTeX-source-only manuscript ------------------
#      (main_springer uses the standard 'article' class + shared sources;
#       no external .cls/.bst files are needed beyond what TeX Live ships.)
cp "$SRC/main_springer.tex" "$SRC/preamble_els.tex" "$SRC/references.bib" "$SRCZIP_DIR/"
# keep a prebuilt .bbl so the editor can typeset even without running bibtex
cp "$SRC/main_springer.bbl" "$SRCZIP_DIR/" 2>/dev/null || true
mkdir -p "$SRCZIP_DIR/sections" "$SRCZIP_DIR/tables" "$SRCZIP_DIR/figures"
cp "$SRC"/sections/*.tex "$SRCZIP_DIR/sections/"
cp "$SRC"/tables/*.tex   "$SRCZIP_DIR/tables/"
cp "$SRC"/figures/*.tex  "$SRCZIP_DIR/figures/"
cp -R "$SRC/figures/fig7_assets"  "$SRCZIP_DIR/figures/fig7_assets"
cp -R "$SRC/figures/fig58_assets" "$SRCZIP_DIR/figures/fig58_assets"

# ---- 2. Test-compile the source-only bundle stand-alone ------------
echo "==> Test-compiling manuscript source..."
pushd "$SRCZIP_DIR" >/dev/null
pdflatex -interaction=nonstopmode -halt-on-error main_springer >b1.log 2>&1
bibtex main_springer >bb.log 2>&1 || true
pdflatex -interaction=nonstopmode -halt-on-error main_springer >b2.log 2>&1
pdflatex -interaction=nonstopmode -halt-on-error main_springer >b3.log 2>&1
if grep -qiE "undefined (citation|reference)" b3.log; then
  echo "!! WARNING: undefined refs remain -- see _latex_src/b3.log"; fi
PAGES=$(grep -oE "main_springer.pdf \([0-9]+ pages" b3.log | grep -oE "[0-9]+ pages" || echo "?")
echo "==> source bundle compiles OK: $PAGES"
# remove build artifacts before zipping (keep .bbl)
rm -f b1.log b2.log b3.log bb.log main_springer.aux main_springer.log \
      main_springer.out main_springer.blg main_springer.pdf main_springer.spl \
      main_springer.brf main_springer.toc
popd >/dev/null

# ---- 3. Zip the source-only manuscript -----------------------------
( cd "$SRCZIP_DIR" && zip -rq "$ZIP" . )
rm -rf "$SRCZIP_DIR"

# ---- 4. Drop the PDF + both cover letters --------------------------
cp "$SRC/main_springer.pdf"     "$OUT/"
cp "$SRC/cover_letter_mvap.txt" "$OUT/"
cp "$SRC/cover_letter_tvcj.txt" "$OUT/"

# ---- 5. What-to-upload cheat sheet ---------------------------------
cat > "$OUT/README.txt" <<'EOF'
DPRNet — Springer submission kit
=================================
Strategy: submit to ONE journal at a time (single-submission rule).
  PRIMARY : Machine Vision and Applications (MVAP)  — T4, no APC
  BACKUP  : The Visual Computer (TVCJ)              — T3, no APC (subscription)
If MVAP rejects, submit the SAME files to TVCJ (swap the cover letter).

Both journals use Springer's Editorial Manager. At FIRST submission upload:

  1. Manuscript .............. main_springer.pdf        (single PDF, figures inline)
  2. Cover letter ............ paste cover_letter_mvap.txt   (MVAP)
                               paste cover_letter_tvcj.txt   (TVCJ, if transferred)
  3. Suggested reviewers ..... lightweight/efficient SR; vision Transformers for
                               restoration; content-aware token routing/clustering
  4. (keep ready) editable source .. manuscript_latex_source.zip
                               Springer requests this at REVISION/ACCEPTANCE, not
                               necessarily at first submission. Upload if asked.

Notes
-----
- main_springer.tex uses the standard 'article' class (single column, 12pt). This
  is a valid editable-source first submission; Springer does not force sn-jnl.cls
  up front. If accepted, re-typeset into sn-jnl.cls ([iicol]) for production.
- Declarations (author contributions, competing interests, data availability) are
  already in the manuscript back matter — no separate files needed for Springer.
- Do NOT change the manuscript title/authors between MVAP and TVCJ; only the cover
  letter differs.
EOF

echo ""
echo "==================================================================="
echo " Springer submission kit ready in: $OUT"
ls -1 "$OUT" | sed 's/^/   - /'
echo "==================================================================="
