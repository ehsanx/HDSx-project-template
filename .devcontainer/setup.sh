#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# SPPH 381H student-workspace Codespace post-create setup.
#
# Installs the few packages NOT already in the rocker tidyverse image, then
# runs a self-test so you can see at a glance what works. We deliberately do
# NOT use `set -e`: if one optional package fails, the rest of setup should
# still finish and the self-test should still print, so the failure is visible
# instead of silently aborting the whole container build.
# -----------------------------------------------------------------------------
set -uo pipefail

echo "==> Installing extra R packages (Table 1, dashboards, optional demos)..."
Rscript -e '
  pkgs <- c("gt", "gtsummary", "DT", "janitor", "scales", "plotly", "shiny", "reticulate")
  need <- setdiff(pkgs, rownames(installed.packages()))
  if (length(need)) install.packages(need, repos = "https://cloud.r-project.org")
  have <- intersect(pkgs, rownames(installed.packages()))
  cat("R extras present:", paste(have, collapse = ", "), "\n")
'

echo "==> Installing Python packages (Week 5 polyglot / reticulate demo)..."
python3 -m pip install --upgrade pip >/dev/null
python3 -m pip install -r .devcontainer/requirements.txt

echo ""
echo "=================== TOOLCHAIN SELF-TEST ==================="
echo "-- R --";       R --version | head -n 1
echo "-- Quarto --";  quarto --version
echo "-- Python --";  python3 --version
echo "-- pandas --";  python3 -c "import pandas as pd; print('pandas', pd.__version__)" || echo "pandas NOT available"
echo ""
echo "-- quarto check (verifies R + Python + Jupyter integration) --"
quarto check || true
echo "=========================================================="
echo "If every section above printed a version with no error, the"
echo "environment is ready. If something failed, copy this whole log"
echo "and send it to the instructor so it can be fixed."
