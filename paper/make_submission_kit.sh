#!/usr/bin/env bash
# =====================================================================
# make_submission_kit.sh
# Assemble a Neurocomputing (Editorial Manager) submission kit with items
# separated the way EM expects them:
#
#   submissions/01_neurocomputing_2026-07-29/
#     manuscript_latex_source.zip   <- MAIN MANUSCRIPT (LaTeX source only;
#                                        EM compiles it online). No PDF/cover/
#                                        highlights inside.
#     main_els.pdf                  <- compiled PDF (for the "first submission
#                                        as PDF" route, or your own reference)
#     highlights.docx               <- EM "Highlights" item
#     declaration_of_competing_interest.docx  <- EM "Declaration" item
#     cover_letter_neurocomputing.txt          <- paste into EM cover-letter box
#
# The manuscript zip is test-compiled from scratch to prove it is self-contained.
#
# Usage (TinyTeX example):
#   PATH="$HOME/Library/TinyTeX/bin/universal-darwin:$PATH" bash make_submission_kit.sh
# =====================================================================
set -euo pipefail
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="$SRC/submissions/01_neurocomputing_2026-07-29"
SRCZIP_DIR="$OUT/_latex_src"
ZIP="$OUT/manuscript_latex_source.zip"

echo "==> Rebuilding docx items..."
python3 "$SRC/make_docx.py"

echo "==> Refresh Neurocomputing package ..."
mkdir -p "$OUT"
rm -rf "$SRCZIP_DIR"
rm -f "$ZIP" "$OUT/main_els.pdf" "$OUT/abstract.docx" \
  "$OUT/highlights.docx" "$OUT/declaration_of_competing_interest.docx" \
  "$OUT/cover_letter_neurocomputing.txt"
mkdir -p "$SRCZIP_DIR"

# ---- 1. Assemble the LaTeX-source-only manuscript ------------------
cp "$SRC/main_els.tex" "$SRC/preamble_els.tex" "$SRC/references.bib" \
   "$SRC/elsarticle.cls" "$SRC/elsarticle-num.bst" "$SRCZIP_DIR/"
# keep a prebuilt .bbl so EM can typeset even if it does not run bibtex
cp "$SRC/main_els.bbl" "$SRCZIP_DIR/" 2>/dev/null || true
mkdir -p "$SRCZIP_DIR/sections" "$SRCZIP_DIR/tables" "$SRCZIP_DIR/figures"
cp "$SRC"/sections/*.tex "$SRCZIP_DIR/sections/"
cp "$SRC"/tables/*.tex   "$SRCZIP_DIR/tables/"
cp "$SRC"/figures/*.tex  "$SRCZIP_DIR/figures/"
cp -R "$SRC/figures/fig7_assets"  "$SRCZIP_DIR/figures/fig7_assets"
cp -R "$SRC/figures/fig58_assets" "$SRCZIP_DIR/figures/fig58_assets"

# ---- 2. Test-compile the source-only bundle stand-alone ------------
echo "==> Test-compiling manuscript source..."
pushd "$SRCZIP_DIR" >/dev/null
pdflatex -interaction=nonstopmode -halt-on-error main_els >b1.log 2>&1
bibtex main_els >bb.log 2>&1 || true
pdflatex -interaction=nonstopmode -halt-on-error main_els >b2.log 2>&1
pdflatex -interaction=nonstopmode -halt-on-error main_els >b3.log 2>&1
if grep -qiE "undefined (citation|reference)" b3.log; then
  echo "!! WARNING: undefined refs remain -- see _latex_src/b3.log"; fi
PAGES=$(grep -oE "main_els.pdf \([0-9]+ pages" b3.log | grep -oE "[0-9]+ pages" || echo "?")
echo "==> source bundle compiles OK: $PAGES"
# remove build artifacts before zipping (keep .bbl)
rm -f b1.log b2.log b3.log bb.log main_els.aux main_els.log main_els.out \
      main_els.blg main_els.pdf main_els.spl main_els.brf main_els.toc
popd >/dev/null

# ---- 3. Zip the source-only manuscript -----------------------------
( cd "$SRCZIP_DIR" && zip -rq "$ZIP" . )
rm -rf "$SRCZIP_DIR"

# ---- 4. Drop the other EM items next to it -------------------------
cp "$SRC/main_els.pdf"                         "$OUT/"
cp "$SRC/abstract.docx"                        "$OUT/"
cp "$SRC/highlights.docx"                      "$OUT/"
cp "$SRC/declaration_of_competing_interest.docx" "$OUT/"
cp "$SRC/cover_letter_neurocomputing.txt"      "$OUT/"

echo ""
echo "==================================================================="
echo " Submission kit ready in: $OUT"
ls -1 "$OUT" | sed 's/^/   - /'
echo "==================================================================="
