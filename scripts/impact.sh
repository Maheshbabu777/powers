#!/usr/bin/env bash
# Show what a change could affect: who imports or calls the code you plan to touch,
# and which concerns (logging, jobs, email...) those files carry.
# Usage: impact.sh [--dir <project-dir>] [--base <git-ref>] [path-or-symbol ...]
#   path     a file you plan to change. Lists files that import it, and concerns in both
#   symbol   a function, class or component name. Lists files that use it
#   --base   also warn about dependencies and env vars added since <git-ref>
#            that .context/project.md doesn't mention yet
# With no paths or symbols and no --base, uses the files changed against HEAD.
# Concern patterns come from the "Concerns" section of .context/project.md:
#   - name: `regex`
# Importer detection is text matching, not a parser. It can miss dynamic imports and
# can list a file that only shares a name. Read what it lists before trusting it.
# Exit code: 0 = done (warnings allowed), 2 = bad usage.
set -uo pipefail

dir="."
base=""
targets=()
while [ $# -gt 0 ]; do
  case "$1" in
    --dir) dir="${2:-}"; shift 2 ;;
    --base) base="${2:-}"; [ -z "$base" ] && { echo "--base needs a git ref" >&2; exit 2; }; shift 2 ;;
    -h|--help) sed -n '2,13p' "$0"; exit 0 ;;
    *) targets+=("$1"); shift ;;
  esac
done
cd "$dir" 2>/dev/null || { echo "not a directory: $dir" >&2; exit 2; }
pm=".context/project.md"
[ -f "$pm" ] || { echo "missing $pm. Run the bootstrap in core/context.md first" >&2; exit 2; }

if [ ${#targets[@]} -eq 0 ] && [ -z "$base" ]; then
  while IFS= read -r f; do [ -n "$f" ] && targets+=("$f"); done < <(git diff --name-only HEAD 2>/dev/null | grep -v '^\.context/')
  [ ${#targets[@]} -eq 0 ] && { echo "nothing to check: pass paths or symbols, or --base <ref>" >&2; exit 2; }
fi

# search helpers: ripgrep if present, grep otherwise. Both skip vendored and build folders.
excl=(node_modules .git dist build .next out coverage vendor .venv venv __pycache__ .context .powers)
if command -v rg >/dev/null 2>&1; then
  rgx=(); for e in "${excl[@]}"; do rgx+=(-g "!$e/"); done
  files_matching() { rg -l --no-messages "${rgx[@]}" -e "$1" . | sed 's#^\./##' | sort -u; }
  word_matching()  { rg -lw --no-messages "${rgx[@]}" -e "$1" . | sed 's#^\./##' | sort -u; }
  file_has()       { rg -q --no-messages -e "$1" "$2"; }
else
  grx=(); for e in "${excl[@]}"; do grx+=(--exclude-dir="$e"); done
  files_matching() { grep -rlE "${grx[@]}" -e "$1" . 2>/dev/null | sed 's#^\./##' | sort -u; }
  word_matching()  { grep -rlwE "${grx[@]}" -e "$1" . 2>/dev/null | sed 's#^\./##' | sort -u; }
  file_has()       { grep -qE -e "$1" "$2" 2>/dev/null; }
fi

# "name<TAB>regex" rows from the Concerns section
concerns=$(awk '
  /^## / { insec = ($0 ~ /^## Concerns/); incomment = 0; next }
  insec && /<!--/ { incomment = 1 }
  insec && incomment { if (/-->/) incomment = 0; next }
  insec && /^[[:space:]]*-[[:space:]]*[^:`]+:[[:space:]]*`/ {
    line = $0; sub(/^[[:space:]]*-[[:space:]]*/, "", line)
    name = line; sub(/:.*/, "", name); gsub(/[[:space:]]+$/, "", name)
    if (match(line, /`[^`]+`/)) print name "\t" substr(line, RSTART + 1, RLENGTH - 2)
  }' "$pm")

concerns_of() {
  local f="$1" out=""
  [ -f "$f" ] || return 0
  while IFS=$'\t' read -r name re; do
    [ -z "$name" ] && continue
    file_has "$re" "$f" && out+="${out:+, }$name"
  done <<< "$concerns"
  printf '%s' "$out"
}

esc() { printf '%s' "$1" | sed 's/[][\.^$*+?(){}|/]/\\&/g'; }

[ -z "$concerns" ] && echo "WARN  no patterns under 'Concerns' in $pm, so side effects can't be detected. Add some (see core/impact.md)"

for t in "${targets[@]}"; do
  echo
  if [ -f "$t" ]; then
    stem=$(basename "$t"); stem="${stem%.*}"
    # index/__init__ files are imported by their folder name
    case "$stem" in index|__init__|mod) stem=$(basename "$(dirname "$t")") ;; esac
    s=$(esc "$stem")
    importers=$(files_matching "(import|from|require\(|use |include).*[\"'/.]$s([\"'./]|$|[[:space:]])" | grep -vxF "$t")
    echo "== $t"
    c=$(concerns_of "$t"); echo "   concerns: ${c:-none}"
    if [ -z "$importers" ]; then
      echo "   imported by: nothing found (entry point, dynamic import, or a name the scan can't see)"
    else
      echo "   imported by $(printf '%s\n' "$importers" | wc -l | tr -d ' ') file(s):"
      while IFS= read -r f; do
        c=$(concerns_of "$f"); echo "     $f${c:+   [$c]}"
      done <<< "$importers"
    fi
  else
    users=$(word_matching "$(esc "$t")")
    echo "== symbol $t"
    if [ -z "$users" ]; then
      echo "   used in: nothing found"
    else
      echo "   used in $(printf '%s\n' "$users" | wc -l | tr -d ' ') file(s):"
      while IFS= read -r f; do
        c=$(concerns_of "$f"); echo "     $f${c:+   [$c]}"
      done <<< "$users"
    fi
  fi
done

# ---- new dependencies and env vars since base ------------------------------
if [ -n "$base" ]; then
  echo
  if ! git rev-parse --verify -q "$base" >/dev/null; then
    echo "WARN  unknown git ref '$base', skipped the new dependency check"
  else
    added=$({ git diff -U0 "$base"...HEAD; git diff -U0 HEAD; } 2>/dev/null)
    deps=$(printf '%s\n' "$added" | awk '
      /^\+\+\+ / { f = $2; next }
      /^\+/ && f ~ /package\.json$/ && match($0, /^\+[[:space:]]*"[@a-zA-Z0-9._\/-]+"[[:space:]]*:[[:space:]]*"[~^<>=]*[0-9*]/) {
        s = substr($0, RSTART, RLENGTH); sub(/^\+[[:space:]]*"/, "", s); sub(/".*/, "", s); print s; next }
      /^\+/ && f ~ /(requirements[^\/]*\.txt)$/ && $0 !~ /^\+[[:space:]]*#/ && match($0, /^\+[[:space:]]*[A-Za-z0-9._-]+/) {
        s = substr($0, RSTART, RLENGTH); sub(/^\+[[:space:]]*/, "", s); print s; next }
      /^\+/ && f ~ /pyproject\.toml$/ && match($0, /^\+[[:space:]]*"[A-Za-z0-9._-]+[[:space:]]*[<>=~!]/) {
        s = substr($0, RSTART, RLENGTH); sub(/^\+[[:space:]]*"/, "", s); sub(/[[:space:]]*[<>=~!].*/, "", s); print s; next }
      /^\+/ && f ~ /go\.mod$/ && match($0, /^\+[[:space:]]*(require[[:space:]]+)?[a-z0-9.-]+\.[a-z]+\/[^[:space:]]+[[:space:]]+v/) {
        s = $0; sub(/^\+[[:space:]]*(require[[:space:]]+)?/, "", s); sub(/[[:space:]].*/, "", s); print s }
    ' | sort -u)
    envs=$(printf '%s\n' "$added" | grep -E '^\+[^+]' | grep -oE "process\.env\.[A-Z_][A-Z0-9_]*|process\.env\[['\"][A-Z_][A-Z0-9_]*|import\.meta\.env\.[A-Z_][A-Z0-9_]*|os\.(getenv|environ\.get)\(['\"][A-Z_][A-Z0-9_]*|os\.environ\[['\"][A-Z_][A-Z0-9_]*" \
      | grep -oE '[A-Z_][A-Z0-9_]*$' | sort -u)
    n=0
    for d in $deps; do
      grep -qiF -- "$d" "$pm" || { echo "WARN  new dependency '$d' isn't mentioned in $pm. Add a Concerns pattern or Connected systems line if it talks to anything outside the code"; n=$((n + 1)); }
    done
    for e in $envs; do
      grep -qF -- "$e" "$pm" || { echo "WARN  new env var '$e' isn't mentioned in $pm. Say what it connects to under Connected systems"; n=$((n + 1)); }
    done
    [ "$n" -eq 0 ] && echo "ok    no unmapped dependencies or env vars added since $base"
  fi
fi
exit 0
