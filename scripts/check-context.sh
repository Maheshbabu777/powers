#!/usr/bin/env bash
# Check a project's .context/ folder for missing, stale or messy context.
# Usage: check-context.sh [project-dir] [--base <git-ref>]
#   --base  also report what changed in .context/ since <git-ref> (e.g. main),
#           and flag new notes written outside .context/.
# Exit code: 0 = no failures (warnings allowed), 1 = failures, 2 = bad usage.
set -uo pipefail

project="."
base=""
while [ $# -gt 0 ]; do
  case "$1" in
    --base) base="${2:-}"; [ -z "$base" ] && { echo "--base needs a git ref" >&2; exit 2; }; shift 2 ;;
    -h|--help) sed -n '2,6p' "$0"; exit 0 ;;
    *) project="$1"; shift ;;
  esac
done
cd "$project" 2>/dev/null || { echo "not a directory: $project" >&2; exit 2; }

ctx=".context"
pm="$ctx/project.md"
fails=0
warns=0
fail() { echo "FAIL  $*"; fails=$((fails + 1)); }
warn() { echo "WARN  $*"; warns=$((warns + 1)); }
ok()   { echo "ok    $*"; }
finish() {
  echo
  echo "$fails failed, $warns warnings"
  [ "$fails" -eq 0 ]
  exit $?
}

# ---- project.md -----------------------------------------------------------
if [ ! -f "$pm" ]; then
  fail "missing $pm. Run the bootstrap in core/context.md"
  finish
fi

lines=$(wc -l < "$pm" | tr -d ' ')
if [ "$lines" -gt 200 ]; then
  fail "project.md is $lines lines (limit 200). Condense before adding more"
else
  ok "project.md is $lines lines"
fi

verified=$(grep -m1 -i '^Last verified:' "$pm" | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' | head -1)
if [ -z "$verified" ]; then
  warn "project.md 'Last verified' date is not filled in"
else
  then_s=$(date -d "$verified" +%s 2>/dev/null || date -j -f %Y-%m-%d "$verified" +%s 2>/dev/null || echo "")
  if [ -n "$then_s" ]; then
    age=$(( ($(date +%s) - then_s) / 86400 ))
    if [ "$age" -gt 30 ]; then
      warn "project.md last verified $age days ago. Re-run its commands and update the date"
    else
      ok "project.md last verified $age days ago"
    fi
  fi
fi

# Sections with no real content (only comments, empty bullets, or blank lines)
while IFS= read -r sec; do
  [ -n "$sec" ] && warn "project.md section '$sec' is empty"
done < <(awk '
  function report() { if (name != "" && !content && name != "Ask the human") print name }
  /^## / { report(); name = substr($0, 4); content = 0; incomment = 0; next }
  name == "" { next }
  /<!--/ { incomment = 1 }
  incomment { if (/-->/) incomment = 0; next }
  /^[[:space:]]*$/ || /^[[:space:]]*-[[:space:]]*$/ { next }
  /^\|[[:space:]]*Task[[:space:]]*\|/ || /^\|[-| ]+\|$/ { next }
  /^\|/ { split($0, c, "|"); gsub(/[[:space:]`]/, "", c[3]); if (c[3] == "") next }
  { content = 1 }
  END { report() }
' "$pm")

# Commands table rows with no command
missing_cmds=$(awk -F'|' '
  /^## / { insec = ($0 ~ /^## Commands/); next }
  insec && NF >= 4 {
    t = $2; c = $3; gsub(/^[ \t]+|[ \t]+$/, "", t); gsub(/[ \t`]/, "", c)
    if (t == "Task" || t ~ /^-+$/) next
    if (c == "") printf "%s%s", sep, t; sep = ", "
  }' "$pm")
[ -n "$missing_cmds" ] && warn "Commands with no command set: $missing_cmds"

# Open questions left under "Ask the human"
open_q=$(awk '
  /^## / { insec = ($0 ~ /^## Ask the human/); next }
  insec && /^[[:space:]]*-[[:space:]]*[^[:space:]]/ { n++ }
  END { print n + 0 }' "$pm")
[ "$open_q" -gt 0 ] && warn "$open_q unanswered question(s) under 'Ask the human'"

# Stale paths: backticked paths in Layout and Gotchas that no longer exist
stale=0
while IFS= read -r p; do
  [ -z "$p" ] && continue
  clean="${p%%:*}"          # drop :line suffixes like file.ts:42
  if [ ! -e "$clean" ]; then
    fail "project.md points to '$clean', which doesn't exist. Fix or remove that line"
    stale=$((stale + 1))
  fi
done < <(awk '
  /^## / { insec = ($0 ~ /^## (Layout|Gotchas)/); next }
  insec && !/<!--/ {
    line = $0
    while (match(line, /`[^`]+`/)) {
      tok = substr(line, RSTART + 1, RLENGTH - 2)
      line = substr(line, RSTART + RLENGTH)
      if (tok ~ /[[:space:]*<>$]/ || tok ~ /^https?:/) continue
      if (tok ~ /\// || tok ~ /\.[A-Za-z0-9]+(:[0-9]+)?$/) print tok
    }
  }' "$pm")
[ "$stale" -eq 0 ] && ok "all paths in Layout and Gotchas exist"

[ -f "$ctx/preferences.md" ] || warn "missing $ctx/preferences.md. Copy it from templates/context/preferences.md in powers, then fill in your preferences"

# ---- decisions.md ---------------------------------------------------------
if [ -f "$ctx/decisions.md" ]; then
  bad=$(grep -E '^[0-9]{4}-' "$ctx/decisions.md" | awk -F'|' 'NF < 4' | wc -l | tr -d ' ')
  [ "$bad" -gt 0 ] && warn "decisions.md has $bad line(s) not in 'date | decision | why | spec' format"
else
  warn "missing $ctx/decisions.md"
fi

# ---- specs ----------------------------------------------------------------
nspecs=0
for f in "$ctx"/specs/*.md; do
  [ -e "$f" ] || continue
  nspecs=$((nspecs + 1))
  status=$(grep -m1 -iE '^Status:' "$f" | sed -E 's/^[Ss]tatus:[[:space:]]*//; s/[[:space:]]+$//' | tr 'A-Z' 'a-z')
  case "$status" in
    draft|approved|"in progress"|done|dropped) ;;
    "") fail "$f has no 'Status:' line"; continue ;;
    *) fail "$f has unknown status '$status' (use draft, approved, in progress, done, dropped)"; continue ;;
  esac
  open=$(grep -cE '^[[:space:]]*- \[ \][[:space:]]*[^[:space:]]' "$f")
  closed=$(grep -cE '^[[:space:]]*- \[[xX]\]' "$f")
  if [ "$status" = "done" ] && [ "$open" -gt 0 ]; then
    warn "$f is 'done' but has $open unticked progress item(s)"
  fi
  if { [ "$status" = "approved" ] || [ "$status" = "in progress" ]; } && [ "$open" -eq 0 ] && [ "$closed" -gt 0 ]; then
    warn "$f has every progress item ticked but status is '$status'. Is it done?"
  fi
done
ok "$nspecs spec(s) checked"

# ---- notes written outside .context --------------------------------------
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  while IFS= read -r f; do
    [ -n "$f" ] && warn "new markdown file outside .context/: $f. Project notes and specs belong in .context/"
  done < <({
      [ -n "$base" ] && git diff --name-only --diff-filter=A "$base"...HEAD 2>/dev/null
      git ls-files --others --exclude-standard 2>/dev/null
    } | sort -u | grep -E '\.md$' \
      | grep -vE '^(\.context/|\.powers/)' \
      | grep -vE '(^|/)(README|CHANGELOG|AGENTS|CLAUDE|LICENSE|CONTRIBUTING)\.md$' \
      | grep -vE '^\.kiro/steering/powers\.md$')

  # ---- what changed in .context on this branch ---------------------------
  if [ -n "$base" ]; then
    if ! git rev-parse --verify -q "$base" >/dev/null; then
      fail "unknown git ref '$base'"
    else
      changed=$({
        git diff --name-only "$base"...HEAD -- "$ctx"
        git diff --name-only HEAD -- "$ctx"
        git ls-files --others --exclude-standard -- "$ctx"
      } 2>/dev/null | sort -u)
      code=$({
        git diff --name-only "$base"...HEAD
        git diff --name-only HEAD
      } 2>/dev/null | grep -vE '^\.context/' | sort -u | wc -l | tr -d ' ')
      echo
      if [ -n "$changed" ]; then
        echo "Context changed since $base:"
        echo "$changed" | sed 's/^/  /'
      else
        echo "Context changed since $base: none"
        [ "$code" -gt 0 ] && echo "  $code code file(s) changed. The hand-off must say 'Context updated: none, because <reason>'"
      fi
    fi
  fi
fi

finish
