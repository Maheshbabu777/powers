#!/usr/bin/env bash
# Install the powers git hooks in a project. Never overwrites an existing hook.
# Usage: install-hooks.sh [project-dir] [powers-path-from-project-root]   (default powers path: .powers)
set -euo pipefail

project="${1:-.}"
powers_path="${2:-.powers}"
cd "$project"
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "not a git repo: $project" >&2; exit 1; }

hooks=$(git rev-parse --git-path hooks)
custom=$(git config --get core.hooksPath || true)
[ -n "$custom" ] && hooks="$custom"
mkdir -p "$hooks"

hook="$hooks/commit-msg"
line="\"\$(git rev-parse --show-toplevel)/$powers_path/scripts/check-commit.sh\" \"\$1\""
if [ -e "$hook" ]; then
  echo "$hook already exists, left alone. Add this line to it:"
  echo "  $line"
  exit 0
fi
printf '#!/usr/bin/env bash\n# installed by powers: checks commit messages against .context/preferences.md\nexec %s\n' "$line" > "$hook"
chmod +x "$hook"
echo "installed $hook"
