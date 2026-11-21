#!/bin/bash
# Installs every tool in tools/ and every skill in skills/ for Claude Code.
set -e
REPO="$(cd "$(dirname "$0")" && pwd)"
WS="$(dirname "$REPO")"
cd "$WS"
for t in "$REPO"/tools/*.sh; do
  echo "==> $(basename "$t")"
  (cd "$WS" && bash "$t") || echo "  [warn] $(basename "$t") failed"
done
mkdir -p "$HOME/.claude/skills"
for s in "$REPO"/skills/*/; do
  name="$(basename "$s")"
  rm -rf "$HOME/.claude/skills/$name"
  cp -r "$s" "$HOME/.claude/skills/$name"
done
sed -i "s#__OPENMONTAGE_DIR__#$WS/OpenMontage#g" "$HOME"/.claude/skills/*/SKILL.md
sed "s#__WORKSPACE__#$WS#g" "$REPO/CLAUDE.global.md" > "$HOME/.claude/CLAUDE.md"
echo "==> Skills installed: $(ls "$HOME/.claude/skills" | tr '\n' ' ')"
