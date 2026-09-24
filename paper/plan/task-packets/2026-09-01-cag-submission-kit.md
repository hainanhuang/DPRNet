## Task Packet

- Stage: S5 Review / submission preparation.
- Scope: Prepare an upload-ready initial-submission package for Computers & Graphics,
  including verified author metadata and reviewer suggestions, without changing the
  shared manuscript sections, tables, figures, data, or references.
- Files to read:
  - `paper/main_els.tex`
  - `paper/preamble_els.tex`
  - `paper/sections/*.tex`
  - `paper/tables/*.tex`
  - `paper/figures/*.tex`
  - `paper/references.bib`
  - `paper/cover_letter_neurocomputing.txt`
  - `paper/highlights_els.txt`
  - `paper/make_docx.py`
  - `paper/plan/submission-log.md`
  - Computers & Graphics Guide for Authors
- Files allowed to edit or add:
  - `paper/main_cag_anonymous.tex`
  - `paper/preamble_cag.tex`
  - `paper/title_page_cag.tex`
  - `paper/cover_letter_cag.tex`
  - `paper/cover_letter_cag.txt`
  - `paper/highlights_cag.txt`
  - `paper/declaration_of_interest_cag.txt`
  - `paper/generative_ai_declaration_cag.txt`
  - `paper/reviewer_suggestions_cag.txt`
  - `paper/make_cag_submission_kit.py`
  - `paper/make_cag_submission_kit.sh`
  - `paper/submit_cag/*`
  - `paper/plan/progress.md`
  - `paper/plan/submission-log.md`
  - `paper/plan/project-overview.md`
  - `paper/plan/review/cag-submission-readiness-2026-09-23.md`
- Required skills: research-writing-assistant, using-research-writing,
  paper-orchestration, peer-review, latex-output, verification, TRAE-browseruse.
- Evidence/data inputs:
  - Existing paper claims and verified results only.
  - CATANet full reference from `references.bib`.
  - Official C&G Guide for Authors and Elsevier generative-AI policy.
  - Author-confirmed emails, School of Computer Science affiliation, and Future City
    Campus postal address.
  - Official institutional profiles for suggested reviewers.
- Required artifacts:
  - Double-column, line-numbered, fully anonymized manuscript PDF.
  - Separate title-page PDF containing authors, affiliation, correspondence,
    funding, acknowledgements, CRediT, competing interests, and data availability.
  - Anonymous C&G-specific cover letter in PDF and text formats.
  - Three to five highlights, each no more than 85 characters, in DOCX and text.
  - Declaration of Interest in DOCX and text.
  - Generative-AI declaration in DOCX and text, also included immediately before
    the references in the anonymous manuscript.
  - Reviewer-suggestion reference containing institutional emails, expertise, and
    source URLs; it is not an upload unless the portal explicitly requests a file.
  - `submit_cag/README.txt` with exact upload mapping.
- C&G hard requirements:
  - Double-anonymized review.
  - Double-column manuscript with line numbers.
  - Initial submission uploads the manuscript PDF, not LaTeX source files.
  - Typical research papers should not exceed 12 two-column pages excluding references;
    longer papers require justification in the cover letter.
  - Cover letter summarizes contributions, provides the full reference and status of
    the closest prior art, and explains the differences.
- Rejection checks:
  - No author name, email, institution, postal address, acknowledgement, funding source,
    PDF author metadata, or identifying file name in the review manuscript.
  - No fabricated ORCID, phone number, grant, reviewer, publication status, or result.
  - No reviewer from the authors' institution or a known collaborator from the last
    three years; prioritize candidates outside the authors' country/region.
  - No unsupported claim of outperforming CATANet on efficiency.
  - No source ZIP placed in the initial-upload package.
  - All highlights satisfy the 85-character limit.
- Validation commands:
  - Clean `pdflatex`/`bibtex` build of the anonymized manuscript.
  - Build title page and cover letter PDFs.
  - Extract PDF text and metadata to scan for identifying strings.
  - Compare citation keys against `references.bib`.
  - Count body and reference-start pages against the 12-page guidance.
  - Validate DOCX ZIP/XML structure and content.
  - Run `git diff --check`.
