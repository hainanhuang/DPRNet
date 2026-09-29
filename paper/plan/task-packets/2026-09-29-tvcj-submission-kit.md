## Task Packet

- Stage: S5 Review / submission preparation.
- Scope: Generate a dedicated first-submission package for The Visual Computer
  from the existing Springer manuscript without changing the reported method,
  experiments, or conclusions.
- Files to read:
  - `paper/main_springer.tex`
  - `paper/cover_letter_tvcj.tex`
  - `paper/cover_letter_tvcj.txt`
  - `paper/title_page_cag.tex`
  - `paper/make_springer_kit.sh`
  - `paper/plan/submission-log.md`
  - `paper/plan/review/venue-search-audit-2026-09-24.md`
- Files allowed to edit:
  - `paper/main_springer.tex`
  - `paper/cover_letter_tvcj.tex`
  - `paper/cover_letter_tvcj.txt`
  - `paper/figures/fig5_xscore_hist.tex`
  - `paper/make_tvcj_submission_kit.sh`
  - `paper/author_biographies_tvcj.txt`
  - `paper/plan/progress.md`
  - `paper/plan/submission-log.md`
  - `paper/submissions/04_the_visual_computer_2026-09-29/**`
- Required skills:
  - research-writing-assistant
  - using-research-writing
  - paper-orchestration
  - latex-output
  - peer-review
  - verification
- Evidence/data inputs:
  - The Visual Computer official aims and scope, submission guidelines, and
    publishing-options pages.
  - Existing author metadata confirmed for the C&G submission.
  - Existing Springer manuscript, bibliography, figures, and tables.
- Required artifacts:
  - Updated author-visible manuscript with complete affiliation and declarations.
  - Current TVCJ cover letter in TXT and PDF.
  - Two 50--100 word factual author biographies.
  - Self-contained editable LaTeX source ZIP that compiles independently.
  - Dedicated `paper/submissions/04_the_visual_computer_2026-09-29/` directory
    with an upload checklist.
- Rejection checks:
  - Do not use the anonymous C&G manuscript; TVCJ uses single-blind review.
  - Do not fabricate ORCID, degrees, job titles, grants, or author photographs.
  - Do not imply an efficiency advantage over CATANet.
  - Do not alter experimental values or manuscript claims.
  - Do not state that editable source is only needed after first submission.
- Validation:
  - Compile the manuscript and cover letter with halt-on-error.
  - Test-compile the unpacked source bundle from scratch.
  - Check for LaTeX errors, undefined references/citations, and overfull boxes.
  - Confirm abstract length, keyword count, declarations, author metadata, and
    absence of placeholders.
  - Validate ZIP integrity, PDF page counts/metadata, upload inventory, and
    `git diff --check`.
