#!/bin/bash
# Installs tools in tools/ and skills in skills/ for Claude Code.
# Pass --skills-only (or set SKIP_TOOLS=1) to skip running tools/*.sh.
set -euo pipefail

SKIP_TOOLS="${SKIP_TOOLS:-0}"
for arg in "$@"; do
  case "$arg" in
    --skills-only) SKIP_TOOLS=1 ;;
    -h|--help)
      echo "Usage: bash install.sh [--skills-only]"
      exit 0
      ;;
    *)
      echo "Unknown option: $arg" >&2
      exit 1
      ;;
  esac
done

REPO="$(cd "$(dirname "$0")" && pwd)"
WS="$(dirname "$REPO")"
cd "$WS"

if [ "$SKIP_TOOLS" != "1" ]; then
  for t in "$REPO"/tools/*.sh; do
    [ -f "$t" ] || continue
    echo "==> $(basename "$t")"
    (cd "$WS" && bash "$t") || echo "  [warn] $(basename "$t") failed"
  done
else
  echo "==> Skipping tools installation (--skills-only)"
fi

mkdir -p "$HOME/.claude/skills"
installed_skills=""
for s in "$REPO"/skills/*/; do
  [ -d "$s" ] || continue
  s="${s%/}"
  name="$(basename "$s")"
  dest="$HOME/.claude/skills/$name"
  rm -rf "$dest"
  cp -R "$s" "$dest"
  if [ -f "$dest/SKILL.md" ]; then
    tmp_file="$(mktemp)"
    sed "s#__OPENMONTAGE_DIR__#$WS/OpenMontage#g; s#__WORKSPACE__#$WS#g" "$dest/SKILL.md" > "$tmp_file"
    mv "$tmp_file" "$dest/SKILL.md"
  fi
  installed_skills="$installed_skills $name"
done

tmp_claude="$(mktemp)"
sed "s#__WORKSPACE__#$WS#g" "$REPO/CLAUDE.global.md" > "$tmp_claude"
if [ -f "$REPO/CLAUDE.local.md" ]; then
  printf '\n' >> "$tmp_claude"
  cat "$REPO/CLAUDE.local.md" >> "$tmp_claude"
fi
mv "$tmp_claude" "$HOME/.claude/CLAUDE.md"

echo "==> Skills installed:${installed_skills:- none}"
