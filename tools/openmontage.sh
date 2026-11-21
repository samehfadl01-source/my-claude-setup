#!/bin/bash
# OpenMontage — agentic video production. Run from the workspace dir.
set -e
if [ ! -d OpenMontage ]; then
  git clone --depth 1 https://github.com/OpenMontageInc/OpenMontage.git
fi
cd OpenMontage
git pull --ff-only || true
make setup
.venv/bin/python -m pip install -q faster-whisper scenedetect yt-dlp youtube-transcript-api || true
git checkout -- remotion-composer/package-lock.json 2>/dev/null || true
