#!/bin/bash
# Installs tools in tools/, studio scripts in scripts/, templates in templates/,
# skills in skills/, and global instructions for Claude Code.
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

SCRIPTS_DEST="$HOME/.claude/scripts"
TEMPLATES_DEST="$HOME/.claude/templates"
mkdir -p "$SCRIPTS_DEST" "$TEMPLATES_DEST" "$HOME/.claude/skills"

for sc in "$REPO"/scripts/*.sh; do
  [ -f "$sc" ] || continue
  cp "$sc" "$SCRIPTS_DEST/$(basename "$sc")"
  chmod +x "$SCRIPTS_DEST/$(basename "$sc")"
done

if [ -d "$REPO/templates" ]; then
  rm -rf "$TEMPLATES_DEST"
  cp -R "$REPO/templates" "$TEMPLATES_DEST"
fi

SED_EXPR="s#__OPENMONTAGE_DIR__#$WS/OpenMontage#g; s#__WORKSPACE__#$WS#g; s#__STUDIO_SCRIPTS_DIR__#$SCRIPTS_DEST#g; s#__TEMPLATES_DIR__#$TEMPLATES_DEST#g"

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
    sed "$SED_EXPR" "$dest/SKILL.md" > "$tmp_file"
    mv "$tmp_file" "$dest/SKILL.md"
  fi
  installed_skills="$installed_skills $name"
done

tmp_claude="$(mktemp)"
sed "$SED_EXPR" "$REPO/CLAUDE.global.md" > "$tmp_claude"
if [ -f "$REPO/CLAUDE.local.md" ]; then
  printf '\n' >> "$tmp_claude"
  cat "$REPO/CLAUDE.local.md" >> "$tmp_claude"
fi
mv "$tmp_claude" "$HOME/.claude/CLAUDE.md"

echo "==> Skills installed:${installed_skills:- none}"
echo "==> Studio scripts: $SCRIPTS_DEST"
echo "==> Studio templates: $TEMPLATES_DEST"
