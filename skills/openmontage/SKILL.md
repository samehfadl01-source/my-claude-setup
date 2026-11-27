---
name: openmontage
description: Start a video production with OpenMontage (agentic video pipelines, Remotion/HyperFrames/FFmpeg). Use for any video request.
---
# OpenMontage
0. Skip this skill for EEHC «المنصة الموحدة لخدمات الكهرباء» service videos: follow that project's approved template, CLAUDE.md and PLAYBOOK.md instead.
1. cd __OPENMONTAGE_DIR__ and read AGENT_GUIDE.md fully before acting; follow its routing rules.
2. If no brief was given, ask for: topic, duration, aspect ratio, tone, voiceover dialect, reference video.
3. Hybrid workflow (no Google API key):
   - Clips: the user makes them in Veo (Gemini/Flow, AI Pro). Write one ready-to-paste Veo prompt per shot.
   - Voiceover: the user makes it in Google AI Studio (Gemini TTS). Write the script per scene with performance directions; ask for WAV.
   - Inputs come in the chat or Drive folder "OpenMontage Inputs" (id 1IbIx5Vmfmzy6yjjAgFG4NUJlSqY0srAC).
   - Use faster-whisper (transcriber) for word-level captions and timing.
4. Send the full render with SendUserFile. Ask before uploading a <3 MB preview to Drive "OpenMontage Renders" (id 1VB3sSm-7RJDP4k4ziW5b-LXDCe96YD-m).
5. Reply in Egyptian Arabic, concisely.

User request: $ARGUMENTS
