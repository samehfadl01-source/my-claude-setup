# my-claude-setup

A lightweight, portable Claude Code configuration and skill pack for **motion graphics designers** working with code-driven video pipelines (**Remotion**, **HyperFrames**, **OpenMontage**, **FFmpeg**, and **faster-whisper**), with dedicated support for **Arabic / RTL** workflows.

## What's Included

- **`skills/openmontage/SKILL.md`** — Orchestrates video production via OpenMontage with a hybrid AI-clip + TTS voiceover workflow and word-level captioning (`faster-whisper`).
- **`skills/rtl-motion/SKILL.md`** — Practical guardrails for Arabic & RTL motion graphics in Remotion, HyperFrames, and FFmpeg (glyph joining, bidi isolation, font readiness, and tabular numerals).
- **`tools/openmontage.sh`** — Installs and updates [OpenMontage](https://github.com/OpenMontageInc/OpenMontage) plus Python/Node media utilities (`faster-whisper`, `scenedetect`, `yt-dlp`, `youtube-transcript-api`, `hyperframes`).
- **`CLAUDE.global.md`** — Reusable global instructions installed to `~/.claude/CLAUDE.md` (renderer selection between Remotion and HyperFrames, FFmpeg defaults, RTL best practices, and project-local override rules).
- **`install.sh`** — Cross-platform installer (macOS & Linux) that runs tool installers, copies skills into `~/.claude/skills/`, and expands workspace paths cleanly.

## Quick Start

Run from inside your workspace directory (so `OpenMontage` is cloned next to `my-claude-setup`):

```bash
git clone https://github.com/samehfadl01-source/my-claude-setup.git
bash my-claude-setup/install.sh
```

To install only the skills and `CLAUDE.md` without running `tools/*.sh`:

```bash
bash my-claude-setup/install.sh --skills-only
```

## Keeping Private Brand & Client Rules Out of Git

If you have private project links, folder IDs, or client-specific brand rules:
- Put project-specific rules inside that project's own `CLAUDE.md`, **or**
- Create a `CLAUDE.local.md` file inside `my-claude-setup/` (ignored by `.gitignore`). `install.sh` automatically appends `CLAUDE.local.md` to `~/.claude/CLAUDE.md` during installation without publishing it.

## License

Released under the [MIT License](LICENSE).

---

## النسخة العربية

إعدادات ومهارات **Claude Code** المخصصة لمصممي الموشن جرافيك وصناعة الفيديو بالكود (**Remotion** و**HyperFrames** و**OpenMontage** و**FFmpeg** و**faster-whisper**)، مع دعم عملي لتنسيق النصوص العربية (**RTL**).

- **`skills/<name>/SKILL.md`** — المهارات اللي بتظهر تلقائياً في قائمة `/` (حالياً: `openmontage` و`rtl-motion`).
- **`tools/openmontage.sh`** — سكريبت تثبيت وتحديث أدوات الفيديو من فولدر الـ workspace.
- **`CLAUDE.global.md`** — التعليمات العامة اللي بتتنسخ إلى `~/.claude/CLAUDE.md`.
- **`CLAUDE.local.md`** *(اختياري ومُتجاهَل في git)* — لو عندك روابط خاصة أو تعليمات لعميل معين، حطها في الملف ده وهتتضاف محلياً وقت التثبيت من غير ما تترفع على GitHub.
- **`install.sh`** — سكريبت التثبيت الموحّد على macOS وLinux (وتقدر تمرر `--skills-only` لتثبيت المهارات والتعليمات فقط).
