#!/usr/bin/env bash
# Check commit messages against the project's commit rules.
# Usage:
#   check-commit.sh <commit-msg-file>     as a git commit-msg hook (see install-hooks.sh)
#   check-commit.sh --message "<text>"    check a message before committing
#   check-commit.sh --range <a>..<b>      check existing commits, e.g. main..HEAD
# Rules are read from .context/preferences.md ("Enforced by scripts" lines):
#   commit-types, commit-max-subject, commit-max-body-lines
# Exit code: 0 = ok, 1 = a message breaks the rules, 2 = bad usage.
set -uo pipefail

root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
prefs="$root/.context/preferences.md"

setting() {
  local key="$1" default="$2" val=""
  [ -f "$prefs" ] && val=$(grep -m1 -E "^[[:space:]]*-[[:space:]]*$key:" "$prefs" | sed -E "s/^[[:space:]]*-[[:space:]]*$key:[[:space:]]*//; s/[[:space:]]+$//")
  echo "${val:-$default}"
}
types=$(setting commit-types "feat fix chore docs refactor test style perf ci build revert")
max_subject=$(setting commit-max-subject 72)
max_body=$(setting commit-max-body-lines 3)
types_re=$(echo "$types" | tr -s ' ' '|')

check() {
  local msg="$1" errs=() subject body_lines
  # drop git comment lines and trailing blank lines
  msg=$(printf '%s\n' "$msg" | grep -v '^#' | sed -e :a -e '/^\n*$/{$d;N;ba' -e '}')
  subject=$(printf '%s\n' "$msg" | head -n1)

  case "$subject" in
    "Merge "*|"Revert \""*|"fixup! "*|"squash! "*|"amend! "*) return 0 ;;
  esac

  if ! printf '%s' "$subject" | grep -qE "^($types_re)(\([a-z0-9._/-]+\))?!?: [^ ]"; then
    errs+=("subject must start with one of: $types, then ': ' and a description")
  else
    desc=$(printf '%s' "$subject" | sed -E 's/^[^:]+: //')
    printf '%s' "$desc" | grep -qE '^[A-Z][a-z]' && errs+=("start the description lowercase")
  fi
  printf '%s' "$subject" | grep -qE '\.$' && errs+=("no period at the end of the subject")
  [ ${#subject} -gt "$max_subject" ] && errs+=("subject is ${#subject} characters, max $max_subject")

  if [ "$(printf '%s\n' "$msg" | wc -l)" -gt 1 ]; then
    [ -n "$(printf '%s\n' "$msg" | sed -n 2p)" ] && errs+=("leave a blank line after the subject")
    # body lines, not counting blank lines or trailers like Co-Authored-By:
    body_lines=$(printf '%s\n' "$msg" | tail -n +2 | grep -vE '^[[:space:]]*$' | grep -vcE '^[A-Za-z][A-Za-z-]*: ')
    [ "$body_lines" -gt "$max_body" ] && errs+=("body is $body_lines line(s), max $max_body. Say why in a line or two, not a paragraph")
  fi

  if [ ${#errs[@]} -gt 0 ]; then
    echo "commit message rejected: \"$subject\""
    for e in "${errs[@]}"; do echo "  - $e"; done
    echo "  example: fix: keep redirect target after login"
    return 1
  fi
  return 0
}

case "${1:-}" in
  --message) check "${2:-}"; exit $? ;;
  --range)
    [ -n "${2:-}" ] || { echo "--range needs a range like main..HEAD" >&2; exit 2; }
    shas=$(git rev-list --reverse "$2" 2>/dev/null) || { echo "not a valid range: $2" >&2; exit 2; }
    bad=0
    for sha in $shas; do
      out=$(check "$(git log -1 --format=%B "$sha")") || { echo "$(git log -1 --format=%h "$sha"): $out"; bad=1; }
    done
    [ $bad -eq 0 ] && echo "all commits in $2 ok"
    exit $bad ;;
  ""|-h|--help) sed -n '2,10p' "$0"; exit 2 ;;
  *) [ -f "$1" ] || { echo "no such file: $1" >&2; exit 2; }
     check "$(cat "$1")"; exit $? ;;
esac
