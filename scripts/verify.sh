#!/usr/bin/env bash
# Run the project's checks from the Commands table in .context/project.md and
# print an evidence block to paste into the spec or hand-off.
# Usage: verify.sh [--dir <project-dir>] [--out <file>] [check ...]
#   check   names from the Task column, case-insensitive. Default: "All tests" "Lint" "Type check"
#   --out   also write the evidence block to <file>
# Exit code: 0 = every check that ran passed, 1 = a check failed, 2 = setup problem.
set -uo pipefail

dir="."
out=""
checks=()
while [ $# -gt 0 ]; do
  case "$1" in
    --dir) dir="${2:-}"; shift 2 ;;
    --out) out="${2:-}"; shift 2 ;;
    -h|--help) sed -n '2,7p' "$0"; exit 0 ;;
    *) checks+=("$1"); shift ;;
  esac
done
[ ${#checks[@]} -eq 0 ] && checks=("All tests" "Lint" "Type check")

cd "$dir" 2>/dev/null || { echo "not a directory: $dir" >&2; exit 2; }
pm=".context/project.md"
[ -f "$pm" ] || { echo "missing $pm. Run the bootstrap in core/context.md first" >&2; exit 2; }

# task<TAB>command rows from the Commands table
table=$(awk -F'|' '
  /^## / { insec = ($0 ~ /^## Commands/); next }
  insec && NF >= 4 {
    t = $2; c = $3
    gsub(/^[ \t]+|[ \t]+$/, "", t); gsub(/^[ \t]+|[ \t]+$/, "", c); gsub(/`/, "", c)
    if (t == "Task" || t ~ /^-+$/) next
    print tolower(t) "\t" c
  }' "$pm")

logdir="${TMPDIR:-/tmp}/powers-verify"
mkdir -p "$logdir"
commit=$(git rev-parse --short HEAD 2>/dev/null || echo "not a git repo")
branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "-")
dirty=$([ -n "$(git status --porcelain 2>/dev/null)" ] && echo " (uncommitted changes)" || echo "")

rows=""
details=""
failed=0
for name in "${checks[@]}"; do
  key=$(echo "$name" | tr 'A-Z' 'a-z')
  cmd=$(printf '%s\n' "$table" | awk -F'\t' -v k="$key" '$1 == k { print $2; exit }')
  if [ -z "$cmd" ]; then
    rows+="| $name | - | not run: no command in project.md |"$'\n'
    continue
  fi
  log="$logdir/$(printf '%s' "$key" | tr -c 'a-z0-9' '-').log"
  echo ">> $name: $cmd" >&2
  start=$SECONDS
  bash -c "$cmd" > "$log" 2>&1
  code=$?
  took=$((SECONDS - start))
  if [ "$code" -eq 0 ]; then
    result="pass (exit 0, ${took}s)"
  else
    result="FAIL (exit $code, ${took}s)"
    failed=1
  fi
  rows+="| $name | \`$cmd\` | $result |"$'\n'
  details+=$'\n'"$name, last 20 lines (full log: $log):"$'\n''```text'$'\n'"$(tail -n 20 "$log")"$'\n''```'$'\n'
done

report="## Verification

Commit: $commit on $branch$dirty
Date: $(date '+%Y-%m-%d %H:%M')

| Check | Command | Result |
|---|---|---|
$rows$details"

echo "$report"
[ -n "$out" ] && printf '%s\n' "$report" > "$out"
exit $failed
