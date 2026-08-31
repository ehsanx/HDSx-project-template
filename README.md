# SPPH 381H — Group Project Template

This is the starting point for your **team project** in **SPPH 381H: Health Data
Science (AI and Knowledge Translation)**. One group member creates a repository
from this template, adds teammates, and the group does all project work here.

This is **separate** from your personal workspace (where the weekly assignments
live) and from the course book (read-only reference). This repository is your
group's project.

## Getting started (Milestone 0)

1. **One member:** click **Use this template → Create a new repository** on
   GitHub. Name it for your group. Keep it **private** for now.
2. **Add your teammates** as collaborators (Settings → Collaborators) and add
   the teaching team as instructed on Canvas.
3. **Everyone:** open the new repository in a **Codespace** (Code → Codespaces →
   Create). The environment (R, Quarto, Python) sets up automatically.
4. Complete the **M0: Group Formation** deliverables in
   `milestones/m0-group-formation/submission/` and submit your repository link
   on Canvas.

> Create the repository from this template — do **not** start from a blank
> repository. Using the template gives you the milestone structure, the
> devcontainer, and the project configuration already in place.

## Project map

```text
.
├── .devcontainer/        <- Codespace setup (R + Quarto + Python); do not edit unless asked
├── _quarto.yml           <- Quarto project configuration
├── data/                 <- Data-access materials (see data/README.md)
├── report/               <- Final report source + rendered output
├── dashboard/            <- Dashboard-style KT product
├── milestones/           <- One folder per milestone; put work in each submission/
│   ├── m0-group-formation/
│   ├── m1-proposal/
│   ├── m2-preliminary-analysis/
│   ├── m3-project-update/
│   ├── m4-peer-review/
│   ├── m5-presentation/  <- narrated deck, submitted with the Final Portfolio
│   └── final-portfolio/
└── references.bib        <- Project references (BibTeX)
```

## How milestones work

Each `milestones/<milestone>/README.md` lists the exact files that milestone
expects and links to its full brief in the course book. Put your work in that
milestone's `submission/` folder using the exact filenames, then submit your
repository link on Canvas with the latest commit hash.

The milestone schedule, point values, and full instructions live in the course
book: <https://ehsanx.github.io/HDSx/milestones/>.

## Working rules

- **Work from the repository root** so relative paths resolve.
- **Commit required rendered outputs** (for example `report.html`) together with
  their source. Do not add global `*.html` or `*.pdf` rules to `.gitignore`.
- **Use relative paths only** — no machine-specific paths.
- **Keep it reproducible:** the project should render in a fresh Codespace with
  no manual steps. The Final Portfolio is graded against the course
  Reproducibility Contract.
- **Do not commit** raw restricted, private, identifiable, or culturally
  sensitive data. See `data/README.md`.
- **Disclose AI use:** every milestone includes an `ai-use-note.md` (a single
  sentence if AI was not used).
