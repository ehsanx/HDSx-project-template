#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# SPPH 381H student-workspace Codespace post-create setup.
#
# Checks the course packages via install-packages.sh (the course image already
# has them, so this takes seconds), then runs a self-test so you can see at a
# glance what works. We deliberately do NOT use `set -e`: if one optional
# package fails, the rest of setup should still finish and the self-test should
# still print, so the failure is visible instead of silently cutting setup
# short.
# -----------------------------------------------------------------------------
set -uo pipefail

# 🤖 AI edit (Claude), 2026-10-20: this block and the SETUP COMPLETE lines.
# "waitFor" in devcontainer.json keeps the editor closed until this script
# ends, and the script always reaches its end (no `set -e`), so the marker file
# only survives a setup that was killed part way. ~/.Rprofile then warns in
# every interactive R, so that incomplete Codespace does not fail silently.
SETUP_MARKER="$HOME/.codespace-setup-running"
touch "$SETUP_MARKER"
if ! grep -q 'codespace-setup-running' "$HOME/.Rprofile" 2>/dev/null; then
  cat >> "$HOME/.Rprofile" <<'EOF'
# Added by .devcontainer/setup.sh: warn if the Codespace setup did not finish.
if (interactive() && file.exists("~/.codespace-setup-running")) {
  message("\n⚠️  This Codespace's setup did not finish, so some packages may be missing.\n",
          "   Rebuild it (Command Palette > Codespaces: Rebuild Container), or ask\n",
          "   the instructor for help.\n")
}
EOF
fi
echo "=========================================================="
echo "⏳ SETUP IN PROGRESS: checking the course packages (seconds)."
echo "=========================================================="

# 🤖 AI edit (Claude), 2026-10-20: the installs moved to install-packages.sh,
# which the image build also runs; here it finds them done in seconds.
bash .devcontainer/install-packages.sh

# 🤖 AI edit (Claude), 2026-10-20: keep .r-plots/ (see install-packages.sh) out
# of commits without touching the student's .gitignore.
if [ -d .git ] && ! grep -qx '/.r-plots/' .git/info/exclude 2>/dev/null; then
  echo '/.r-plots/' >> .git/info/exclude
fi

echo ""
echo "=================== TOOLCHAIN SELF-TEST ==================="
echo "-- R --";       R --version | head -n 1
echo "-- Quarto --";  quarto --version
echo "-- Python --";  python3 --version
echo "-- pandas --";  python3 -c "import pandas as pd; print('pandas', pd.__version__)" || echo "pandas NOT available"
echo "-- sess --";    Rscript -e 'cat("sess", format(packageVersion("sess")), packageDescription("sess", fields = "Config/vscode-R/source-revision"), "\n")' 2>/dev/null || echo "sess NOT available (plots will not show in VS Code)"
echo ""
echo "-- quarto check (verifies R + Python + Jupyter integration) --"
quarto check || true
echo "=========================================================="
rm -f "$SETUP_MARKER"
echo "✅ SETUP COMPLETE. If every section above printed a version with"
echo "no error, the environment is ready. If something failed, copy this"
echo "whole log (Codespaces: View Creation Log) and send it to the"
echo "instructor so it can be fixed."
