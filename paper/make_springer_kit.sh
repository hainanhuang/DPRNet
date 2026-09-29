#!/usr/bin/env bash
# =====================================================================
# make_springer_kit.sh
# Rebuild the historical Machine Vision and Applications submission package
# from the current Springer manuscript sources.
#
# Output layout:
#   submissions/02_machine_vision_and_applications_2026-08-02/
#     main_springer.pdf              <- MANUSCRIPT (single PDF, figures inline)
#     manuscript_latex_source.zip    <- editable source
#     cover_letter_mvap.pdf          <- submitted cover letter
#     cover_letter_mvap.txt          <- cover-letter source
#     README.txt                     <- archive record
#
# The source zip is test-compiled from scratch to prove it is self-contained.
#
# Usage (TinyTeX example):
#   PATH="$HOME/Library/TinyTeX/bin/universal-darwin:$PATH" bash make_springer_kit.sh
# =====================================================================
set -euo pipefail
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="$SRC/submissions/02_machine_vision_and_applications_2026-08-02"
SRCZIP_DIR="$OUT/_latex_src"
ZIP="$OUT/manuscript_latex_source.zip"

echo "==> Refresh MVAP package ..."
mkdir -p "$OUT"
rm -rf "$SRCZIP_DIR"
rm -f "$ZIP" "$OUT/main_springer.pdf" "$OUT/cover_letter_mvap.pdf" \
  "$OUT/cover_letter_mvap.txt"
mkdir -p "$SRCZIP_DIR"

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

# ---- 4. Drop the PDF + MVAP cover letter ---------------------------
cp "$SRC/main_springer.pdf"     "$OUT/"
cp "$SRC/cover_letter_mvap.pdf" "$OUT/"
cp "$SRC/cover_letter_mvap.txt" "$OUT/"

# ---- 5. What-to-upload cheat sheet ---------------------------------
cat > "$OUT/README.txt" <<'EOF'
DPRNet - Machine Vision and Applications submission archive
============================================================

Journal: Machine Vision and Applications (Springer)
Article type: Research
Submitted: August 2, 2026
Outcome: Withdrawn by the author on September 1, 2026
Status before withdrawal: With editor

Archived materials:
  manuscript_latex_source.zip
  main_springer.pdf
  cover_letter_mvap.pdf
  cover_letter_mvap.txt

The preliminary TVCJ cover letter is archived separately under:
  ../04_the_visual_computer_2026-09-29/archive/2026-08-01-cover-letter-draft/

This was an author withdrawal driven by the graduation timeline, not an
editorial rejection. Do not upload this historical package to another journal.
EOF

echo ""
echo "==================================================================="
echo " MVAP submission archive refreshed in: $OUT"
ls -1 "$OUT" | sed 's/^/   - /'
echo "==================================================================="
