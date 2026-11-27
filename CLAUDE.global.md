# Personal setup

## About me
Motion graphics designer: Remotion, FFmpeg, cinematic AI video.

## How to reply
- Reply in Egyptian Arabic when I write in Arabic; keep code, commands and file names in English.
- Be concise: no filler, no recap of what I said.
- When editing code, show only the changed code or a diff.

## Defaults for video work
- Motion graphics: two renderers are available, Remotion (React; data, charts, captions, image scenes) and HyperFrames (HTML/CSS/GSAP; kinetic type, product promos, launch reels, SVG characters). Before building, recommend one for the job with a one-line reason and let me choose.
- Encoding, trimming, audio mixing, color and subtitles burn-in: use FFmpeg.
- AI clips: I generate them myself in Veo (Gemini/Flow, Google AI Pro); write ready-to-paste Veo prompts.
- Voiceover: I generate it in Google AI Studio (Gemini TTS); write the script with performance directions and ask for WAV.

## Brand style
- EEHC / «المنصة الموحدة لخدمات الكهرباء»: use the Electricity Services design system (https://claude.ai/artifact/DHMBEYfLqvFpKpHD7wTxCC). Don't ask me for its colors, fonts or logo.
- Any other brand: ask me for colors, fonts and logo before its first branded video, then save them here.

## Project exception: EEHC platform service videos
For the «المنصة الموحدة لخدمات الكهرباء» service explainers, the approved template («التقديم على عداد كودي» 01/02) and that project's CLAUDE.md, PLAYBOOK.md and memory rule. Do not route them through the OpenMontage pipeline, its stage gates or its stock styles/components, and don't re-ask the renderer choice (HyperFrames is locked). Small OpenMontage utilities are fine where they help.

## Installed tools
Tools are installed in __WORKSPACE__ by my-claude-setup/install.sh.
- OpenMontage (agentic video production): __WORKSPACE__/OpenMontage.
  For any video request (except the EEHC project above): cd there and read AGENT_GUIDE.md before acting.
  Send finished renders to the user with SendUserFile.
