#!/usr/bin/env bash
# Set up .context/ and agent entry files in a project. Never overwrites existing files.
# Usage: init-project.sh <project-dir> [powers-path-as-seen-from-project]
# The powers path defaults to .powers (for a git submodule or copy at <project>/.powers).
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "usage: $0 <project-dir> [powers-path]" >&2
  exit 1
fi

project="$1"
powers_path="${2:-.powers}"
here="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tpl="$here/templates"

[ -d "$project" ] || { echo "not a directory: $project" >&2; exit 1; }

created=()
skipped=()

place() {
  local src="$1" dest="$2"
  if [ -e "$dest" ]; then
    skipped+=("$dest")
    return
  fi
  mkdir -p "$(dirname "$dest")"
  sed "s#POWERS_PATH#${powers_path}#g; s#PROJECT_NAME#$(basename "$(cd "$project" && pwd)")#g" "$src" > "$dest"
  created+=("$dest")
}

mkdir -p "$project/.context/specs"
place "$tpl/context/project.md"   "$project/.context/project.md"
place "$tpl/context/decisions.md" "$project/.context/decisions.md"
place "$tpl/context/preferences.md" "$project/.context/preferences.md"
place "$tpl/project/AGENTS.md"    "$project/AGENTS.md"
place "$tpl/project/CLAUDE.md"    "$project/CLAUDE.md"

if [ -d "$project/.kiro" ]; then
  place "$tpl/project/.kiro/steering/powers.md" "$project/.kiro/steering/powers.md"
fi

echo "Created:"
for f in "${created[@]:-}"; do [ -n "$f" ] && echo "  $f"; done
if [ ${#skipped[@]} -gt 0 ]; then
  echo "Already existed, left alone (add the powers block by hand if missing):"
  for f in "${skipped[@]}"; do echo "  $f"; done
fi
if git -C "$project" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  "$here/scripts/install-hooks.sh" "$project" "$powers_path"
fi
if [ ! -e "$project/$powers_path/SKILL.md" ]; then
  echo "Warning: $project/$powers_path/SKILL.md not found. Add powers there, e.g.:"
  echo "  git -C \"$project\" submodule add <powers-repo-url> $powers_path"
fi
