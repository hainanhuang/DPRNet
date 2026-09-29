## Task Packet

- Stage: S5 Review / submission-risk revalidation.
- Scope: Revalidate the post-C&G journal and conference recommendations after
  the first-ranked venue issued a scope desk rejection, and replace the
  single-paper-precedent rule with a stricter, auditable scope gate.
- Files to read:
  - `DPRNet_投稿推荐.csv`
  - `paper/plan/submission-log.md`
  - `paper/plan/progress.md`
  - `paper/plan/review/venue-search-audit-2026-08-30.md`
  - `paper/plan/review/venue-search-audit-2026-09-24.md`
  - `计算机科学与技术.xlsx`
- Files allowed to edit:
  - `DPRNet_投稿推荐.csv`
  - `paper/plan/submission-log.md`
  - `paper/plan/progress.md`
  - `paper/plan/review/venue-search-audit-2026-09-24.md`
- Required skills:
  - research-writing-assistant
  - using-research-writing
  - paper-orchestration
  - peer-review
  - verification
- Evidence/data inputs:
  - C&G scope desk-rejection record.
  - Official aims and scope pages for TVCJ, IJPRAI, and Algorithms.
  - Crossref and official article records for directly comparable 2024--2026
    image super-resolution papers.
  - Official CVPR 2027 call for papers and the local T1--T4 school list.
- Required artifacts:
  - A stricter venue gate requiring explicit official scope coverage and at
    least three recent directly comparable papers.
  - Separate ratings for scope risk and novelty/quality risk.
  - Updated journal order and conference-window assessment.
  - A capability-use audit in `paper/plan/progress.md`.
- Rejection checks:
  - Do not treat one prior SR paper as sufficient evidence of stable scope.
  - Do not state or imply that any venue is guaranteed to send the paper for
    review or accept it.
  - Do not confuse a low scope risk with a low novelty or quality risk.
  - Match the exact school-list title or document the official/JCR title
    variant explicitly.
  - Do not recommend a conference that is absent from the school T4+ list or
    conflicts with the one-submission rule and the graduation timeline.
- Validation:
  - Resolve every cited DOI through Crossref.
  - Confirm each active venue's official scope and fee/indexing facts.
  - Confirm conference names and levels against `计算机科学与技术.xlsx`.
  - Check active documents for a consistent venue order.
  - Parse the CSV and run `git diff --check`.
