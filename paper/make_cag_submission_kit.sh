#!/usr/bin/env bash
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="$SRC/submit_cag"
TEX_BIN="${TEX_BIN:-$HOME/Library/TinyTeX/bin/universal-darwin}"

export PATH="$TEX_BIN:$PATH"

cd "$SRC"

latexmk -pdf -bibtex -interaction=nonstopmode -halt-on-error \
  main_cag_anonymous.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error title_page_cag.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error cover_letter_cag.tex

for log in main_cag_anonymous.log title_page_cag.log cover_letter_cag.log; do
  if rg -q \
    'LaTeX Error|Undefined control sequence|Citation .* undefined|Reference .* undefined|There were undefined|Overfull \\[hv]box' \
    "$log"; then
    printf 'Build validation failed; inspect %s\n' "$log" >&2
    exit 1
  fi
done

mkdir -p "$OUT"
rm -f \
  "$OUT/main_cag_anonymous.pdf" \
  "$OUT/title_page_cag.pdf" \
  "$OUT/title_page_cag.docx" \
  "$OUT/cover_letter_cag.pdf" \
  "$OUT/cover_letter_cag.txt" \
  "$OUT/highlights_cag.docx" \
  "$OUT/highlights_cag.txt" \
  "$OUT/declaration_of_interest_cag.docx" \
  "$OUT/declaration_of_interest_cag.txt" \
  "$OUT/generative_ai_declaration_cag.docx" \
  "$OUT/generative_ai_declaration_cag.txt" \
  "$OUT/reviewer_suggestions_cag.txt" \
  "$OUT/README.txt"

python3 make_cag_submission_kit.py --output "$OUT"

cp main_cag_anonymous.pdf "$OUT/"
cp title_page_cag.pdf "$OUT/"
cp cover_letter_cag.pdf "$OUT/"
cp cover_letter_cag.txt "$OUT/"
cp highlights_cag.txt "$OUT/"
cp declaration_of_interest_cag.txt "$OUT/"
cp generative_ai_declaration_cag.txt "$OUT/"
cp reviewer_suggestions_cag.txt "$OUT/"
cp cag_submission_README.txt "$OUT/README.txt"

rm -f \
  main_cag_anonymous.{aux,bbl,blg,fdb_latexmk,fls,log,out,pdf,spl} \
  title_page_cag.{aux,fdb_latexmk,fls,log,out,pdf} \
  cover_letter_cag.{aux,fdb_latexmk,fls,log,out,pdf}

printf '%s\n' "C&G initial-submission package created at:"
printf '  %s\n' "$OUT"
printf '%s\n' "Upload the files individually as mapped in README.txt."
