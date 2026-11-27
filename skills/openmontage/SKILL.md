---
name: openmontage
description: Start a video production workflow with OpenMontage (Remotion, HyperFrames, FFmpeg). Use for video and motion-graphics production requests.
---

# OpenMontage

1. Check the active project's `CLAUDE.md` / `PLAYBOOK.md` first: if the project defines its own locked renderer, design system, or opts out of the OpenMontage pipeline, follow the project-local rules.
2. Otherwise, `cd __OPENMONTAGE_DIR__` and read `AGENT_GUIDE.md` fully before acting; follow its routing rules.
3. If no creative brief was provided, ask concisely for:
   - Topic / core message
   - Target duration and aspect ratio (`16:9`, `9:16`, `1:1`)
   - Visual tone / style and any reference video
   - Voiceover language / dialect (e.g., Egyptian Arabic, MSA, English)
4. Hybrid workflow (no external video/TTS API key required):
   - **AI video shots:** Write one ready-to-paste visual prompt per shot so the user can generate clips externally.
   - **Voiceover:** Write the script per scene with performance/pacing cues and ask for `.wav` audio.
   - **Inputs & previews:** Accept assets directly in the chat or from the user's configured input folder (if any), and ask before uploading preview renders externally.
   - **Captions & timing:** Use `faster-whisper` for word-level transcription and timing alignment.
5. Deliver the final full-resolution render cleanly and reply concisely in the user's language (Egyptian Arabic when prompted in Arabic).

User request: $ARGUMENTS
