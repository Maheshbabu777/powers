# Working on the powers repo

This repo is the powers playbook itself. If you're here to use it on a project, start at [SKILL.md](SKILL.md).

When editing powers:

- `SKILL.md` holds the whole workflow. Keep it under about 120 lines. Detail goes in `core/`, linked from the step that needs it.
- One concern per file. Every file in `core/`, `frontend/` and `on-demand/` must be linked from `SKILL.md` or from another power. An unlinked file is never read.
- Use relative markdown links, never bare paths. Agents open powers from different working directories.
- Nothing project-specific in powers. That belongs in the project's `.context/`.
- Don't state the same rule in two files. Link to the one place it lives.
- Shell scripts must stay LF. `.gitattributes` enforces it.
- Scripts are bash, run from the project root, never overwrite user files, and exit non-zero on failure. Link each one from the step that uses it.
- After changing files, check that every relative link resolves.
