---
name: openmontage
description: Orchestrate end-to-end video production with OpenMontage, Studio Direction skills, Remotion, HyperFrames, and FFmpeg.
---

# OpenMontage Studio Pipeline

1. **Project-Local Rules First:** Check the active project's `CLAUDE.md` / `PLAYBOOK.md` first. If the project locks a renderer, design system, or opts out of the OpenMontage pipeline, follow project-local rules.
2. **Pre-Production Direction:** Before writing scene code or prompts, establish a clear brief & Shot Sheet (`__TEMPLATES_DIR__/shot-sheet-template.md`):
   - Topic, target audience, and **2.5-second opening hook**
   - Duration and aspect ratio (`16:9`, `9:16`, `1:1`)
   - Visual tone / style and any reference video
   - Voiceover language / dialect (e.g., Egyptian Arabic, MSA, English)
   - Load the studio direction skills as needed: `/art-direction`, `/motion-craft`, `/cinema-camera`, `/sound-design`, and `/rtl-motion` (for Arabic/RTL).
3. **OpenMontage Routing:** For pipeline projects, `cd __OPENMONTAGE_DIR__` and read `AGENT_GUIDE.md` fully before acting; follow its routing rules.
4. **Hybrid AI & Motion Workflow (No External Video/TTS API Key Required):**
   - **AI Video Shots:** Write consistent ready-to-paste Veo prompts following `/cinema-camera` (clean compositions without garbled AI text).
   - **Voiceover:** Write the script per scene with performance/pacing cues and Arabic diacritics where helpful, requesting `.wav` (`48kHz`) audio.
   - **Timing & Captions:** Align cuts and kinetic captions to audio using `faster-whisper` word-level timestamps.
   - **Audio Mix & Export:** Use `__STUDIO_SCRIPTS_DIR__/mix_audio.sh` (voice clarity + music sidechain ducking + `-14 LUFS` normalization) and `__STUDIO_SCRIPTS_DIR__/export_social.sh`.
5. **Pre-Delivery QA Gate:** Run `/video-qa` (`__STUDIO_SCRIPTS_DIR__/video_qa.sh`) on every finished render and inspect the contact sheet before delivering.
6. **Delivery:** Deliver the verified full-resolution render cleanly and reply concisely in the user's language (Egyptian Arabic when prompted in Arabic).

User request: $ARGUMENTS
