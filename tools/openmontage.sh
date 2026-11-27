#!/bin/bash
# OpenMontage — agentic video production. Run from the workspace dir.
set -euo pipefail

if [ ! -d OpenMontage ]; then
  git clone --depth 1 https://github.com/OpenMontageInc/OpenMontage.git
fi

cd OpenMontage
git pull --ff-only || true
make setup

if [ -x .venv/bin/python ]; then
  .venv/bin/python -m pip install -q faster-whisper scenedetect yt-dlp youtube-transcript-api || true
fi

if command -v npx >/dev/null 2>&1; then
  npx --yes hyperframes skills update || true
fi

git checkout -- remotion-composer/package-lock.json 2>/dev/null || true
