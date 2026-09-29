## Task Packet

- Stage: S5 submission archive maintenance.
- Scope: Consolidate every journal submission package under one directory,
  keep one self-contained subdirectory per submission, and update generators
  and documentation so future rebuilds preserve the new layout.
- Existing package directories:
  - `paper/submit/`
  - `paper/submit_springer/`
  - `paper/submit_cag/`
  - `paper/submit_tvcj/`
  - `paper/dist/DPRNet_Neurocomputing_submission/`
  - `paper/dist/DPRNet_Neurocomputing_submission.zip`
- Target directory:
  - `paper/submissions/01_neurocomputing_2026-07-29/`
  - `paper/submissions/02_machine_vision_and_applications_2026-08-02/`
  - `paper/submissions/03_computers_and_graphics_2026-09-23/`
  - `paper/submissions/04_the_visual_computer_2026-09-29/`
- Files allowed to edit:
  - `paper/submissions/**`
  - `paper/make_submission_kit.sh`
  - `paper/make_springer_kit.sh`
  - `paper/make_cag_submission_kit.sh`
  - `paper/make_cag_submission_kit.py`
  - `paper/make_tvcj_submission_kit.sh`
  - `paper/package_neurocomputing.sh`
  - active planning/review documents that reference old package paths
- Required skills:
  - research-writing-assistant
  - using-research-writing
  - paper-orchestration
  - verification
- Required artifacts:
  - One parent archive directory with a status/index README.
  - Four clearly named, self-contained submission-package directories.
  - Journal-specific README in every package.
  - Build scripts targeting the new package directories.
  - No remaining legacy package directories at `paper/submit*`.
- Rejection checks:
  - Do not mix TVCJ files into the historical MVAP package.
  - Do not alter manuscript, result, or declaration contents during the move.
  - Do not overwrite unrelated user changes in planning documents.
  - Preserve all existing package files unless they are confirmed duplicates
    belonging to another journal.
- Validation:
  - Compare pre/post package file inventories and SHA-256 hashes.
  - Test ZIP/DOCX integrity and PDF readability/page counts.
  - Run shell/Python syntax checks for changed generators.
  - Search active files for legacy package paths.
  - Run `git diff --check`.
