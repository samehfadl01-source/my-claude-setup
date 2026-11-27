# Motion Graphics & Video Setup

## Profile
Motion graphics designer working with code-driven video pipelines: Remotion, HyperFrames, FFmpeg, and hybrid AI video/voice workflows.

## Communication
- Match the user's language (reply in Egyptian Arabic when prompted in Arabic; keep code, CLI commands, and file names in English).
- Be concise: avoid filler or repeating the prompt back.
- When editing code, show only the changed snippet or a concise diff.

## Defaults for Video Work
- **Motion graphics renderers:** Two renderers are available:
  - **Remotion** (React): best for data-driven scenes, charts, timed captions, and image/composited sequences.
  - **HyperFrames** (HTML/CSS/GSAP): best for kinetic typography, product promos, launch reels, and animated SVG illustrations.
  - Before building a new project, recommend the better fit in one line and confirm with the user unless the project's local config locks one.
- **Post-processing & utilities:** Use **FFmpeg** for encoding, trimming, audio mixing, color adjustments, and subtitle burn-in.
- **Hybrid AI clips & voiceover:**
  - Generate ready-to-paste shot prompts for AI video clips (e.g., Veo) rather than assuming an API key is configured.
  - Write voiceover scripts per scene with pacing/delivery directions and request lossless `.wav` audio.
- **Arabic / RTL motion graphics:** Keep Arabic shaping intact (`dir="rtl"`), animate by words/lines rather than splitting connected glyphs per character, and load explicit web/local Arabic fonts before rendering.

## Project & Brand Overrides
- Always check the active project's own `CLAUDE.md`, `PLAYBOOK.md`, or design system tokens before applying generic defaults.
- If a project specifies a locked renderer, brand palette, typography, or template, follow the project's local configuration instead of overriding it.
- For any new branded video without saved guidelines, ask for brand colors, fonts, and logo first, and keep client-specific rules inside that project's own `CLAUDE.md` (or a gitignored `CLAUDE.local.md`).

## Installed Tools
Tools are installed in `__WORKSPACE__` by `my-claude-setup/install.sh`.
- **OpenMontage** (agentic video production): `__WORKSPACE__/OpenMontage`
  - For OpenMontage pipeline tasks, `cd` there and read `AGENT_GUIDE.md` before acting (unless the active project explicitly exempts itself in its local `CLAUDE.md`).
- Deliver finished renders cleanly as user-accessible output files.
