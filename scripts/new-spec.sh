#!/usr/bin/env bash
# Create .context/specs/<slug>.md from the template, after checking for related specs.
# Usage: new-spec.sh <slug> [project-dir] [--title "Feature name"]
# Exit code: 0 = created, 1 = bad input, 3 = spec already exists (continue it instead).
set -uo pipefail

slug=""
project="."
title=""
while [ $# -gt 0 ]; do
  case "$1" in
    --title) title="${2:-}"; shift 2 ;;
    -h|--help) sed -n '2,4p' "$0"; exit 0 ;;
    *) if [ -z "$slug" ]; then slug="$1"; else project="$1"; fi; shift ;;
  esac
done

if ! printf '%s' "$slug" | grep -qE '^[a-z0-9]+(-[a-z0-9]+)*$'; then
  echo "slug must be short kebab-case, like search-filter or fix-login-redirect" >&2
  exit 1
fi

here="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
specs="$project/.context/specs"
[ -d "$project/.context" ] || { echo "no .context/ in $project. Run init-project.sh first" >&2; exit 1; }
mkdir -p "$specs"
target="$specs/$slug.md"

if [ -e "$target" ]; then
  echo "$target already exists ($(grep -m1 -i '^Status:' "$target")). Continue it instead of starting a new one."
  exit 3
fi

# Specs sharing a meaningful word with the new slug
related=""
for f in "$specs"/*.md; do
  [ -e "$f" ] || continue
  other=$(basename "$f" .md)
  for w in $(echo "$slug" | tr '-' ' '); do
    [ ${#w} -lt 4 ] && continue
    case "-$other-" in
      *"$w"*) related+="  $f ($(grep -m1 -i '^Status:' "$f"))"$'\n'; break ;;
    esac
  done
done

[ -z "$title" ] && title="$(echo "$slug" | tr '-' ' ' | awk '{ print toupper(substr($0,1,1)) substr($0,2) }')"
sed "s#<Feature name>#${title}#" "$here/templates/context/spec.md" > "$target"
echo "created $target"
if [ -n "$related" ]; then
  echo "Possibly related specs. Check these aren't the same work:"
  printf '%s' "$related"
fi
