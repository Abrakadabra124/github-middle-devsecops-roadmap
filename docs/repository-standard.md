# Repository Delivery Standard

## Required Files

Every active project repository must contain:

- issue and pull-request templates;
- `CODEOWNERS`, `CONTRIBUTING.md`, `SECURITY.md` and a changelog;
- a least-privilege CI workflow with third-party actions pinned to commit SHAs;
- README sections for purpose, architecture, run, security, troubleshooting and evidence.

Placeholder repositories receive the full standard when their implementation phase begins. They are not pinned or presented as completed projects before then.

## Branch Protection Model

For every active repository `main`:

- require the repository's quality job to pass before merge;
- require branches to be up to date when practical;
- block force pushes and branch deletion;
- resolve review conversations before merge;
- use pull requests for feature and security changes.

A solo public portfolio may not require an external approving reviewer because that would make legitimate delivery impossible. CI remains mandatory, and the PR documents risk, validation and rollback.

## Commit and Release Model

- Use Conventional Commits and short-lived branches.
- Keep commits meaningful rather than manufacturing daily activity.
- Create a GitHub release only after live verification, a green default branch and documented limitations.
- Attach or link non-sensitive demo and before/after evidence.
