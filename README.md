# my-claude-setup — Creative Video Production Studio

An open-source **Claude Code Creative Production Studio** for **Motion Graphics**, **Commercial Ads**, and **Cinematic AI Video** — built around **Remotion**, **HyperFrames**, **OpenMontage**, **FFmpeg**, and **faster-whisper**, with first-class **Arabic / RTL** craftsmanship.

## Studio Skills (`skills/`)

Each skill installs into `~/.claude/skills/` and appears in Claude Code's `/` menu:

| Skill | Focus |
| :--- | :--- |
| **`art-direction`** | Visual hierarchy, 60-30-10 color balance, contrast scrims, lighting depth, and `9:16` / `16:9` safe zones. |
| **`motion-craft`** | Motion principles, non-linear easing curves, `0–2.5s` commercial hooks, stagger caps, and motivated transitions. |
| **`cinema-camera`** | Shot-scale grammar, camera movement motivation, lens/lighting recipes, and 5-part **Veo** shot prompts. |
| **`sound-design`** | Audio-first pacing, 4-layer studio audio stack, **Gemini TTS** Arabic direction, sidechain ducking, and `-14 LUFS` targets. |
| **`rtl-motion`** | Arabic/RTL guardrails (no broken letter splitting, `unicode-bidi: isolate`, font loading gates, `tabular-nums`, `libass`). |
| **`openmontage`** | End-to-end [OpenMontage](https://github.com/OpenMontageInc/OpenMontage) pipeline + hybrid AI/code workflow. |
| **`video-qa`** | Pre-delivery QA gate checking `ffprobe` streams, EBU R128 loudness, safe zones, and a visual 3×3 contact sheet. |

## FFmpeg Production Scripts (`scripts/`)

Installed to `~/.claude/scripts/` automatically by `install.sh`:

- **`mix_audio.sh`** — Cleans dialogue (`80Hz` high-pass + compressor), applies automatic **sidechain ducking** to background music, and normalizes loudness to `-14 LUFS` (`--vo`, `--music`, `--out`, `--lufs`).
- **`export_social.sh`** — Encodes delivery-ready H.264 MP4s (`yuv420p`, `48kHz` AAC, `+faststart`) with `youtube`, `reels` (`1080×1920`), `square` (`1080×1080`), and lightweight `preview` presets.
- **`video_qa.sh`** — Prints stream metadata + EBU R128 loudness (`LUFS` / True Peak) and outputs a 3×3 visual QA contact sheet PNG.

## Templates (`templates/`)

Installed to `~/.claude/templates/`:

- **`shot-sheet-template.md`** — Pre-production brief, hook plan, shot sheet table, and pre-delivery checklist.
- **`hyperframes-rtl-starter/`** — Clean Arabic RTL starter (`index.html`, `styles.css`) featuring word-by-word kinetic reveal without breaking Arabic cursive ligatures, safe-zone overlay debug mode (`.debug-safe-zones`), and studio easing tokens.

## Quick Start

Run from inside your workspace directory (so `OpenMontage` is cloned next to `my-claude-setup`):

```bash
git clone https://github.com/samehfadl01-source/my-claude-setup.git
bash my-claude-setup/install.sh
```

To install only the skills, scripts, templates, and `CLAUDE.md` without running `tools/*.sh`:

```bash
bash my-claude-setup/install.sh --skills-only
```

## Keeping Private Brand & Client Rules Out of Git

- Store client-specific design systems inside that project's own `CLAUDE.md`, **or**
- Create a gitignored `CLAUDE.local.md` inside `my-claude-setup/`; `install.sh` appends it to `~/.claude/CLAUDE.md` locally without publishing it.

## License

Released under the [MIT License](LICENSE).

---

## النسخة العربية — استوديو الإنتاج الإبداعي لـ Claude Code

إعدادات ومهارات وأدوات **Claude Code** مصممة كاستوديو متكامل لصناعة **فيديوهات الموشن جرافيك والإعلانات التجارية والفيديو السينمائي** بالكود والذكاء الاصطناعي (**Remotion** و**HyperFrames** و**OpenMontage** و**FFmpeg** و**faster-whisper**)، مع عناية خاصة باللغة العربية (**RTL**).

- **المهارات (`skills/`):** قواعد الإخراج الفني والبصري (`art-direction`)، قواعد الحركة والـ Easing والإيقاع (`motion-craft`)، قواعد الكاميرا والعدسات وبرومبتات Veo (`cinema-camera`)، هندسة الصوت والمكساج وTTS (`sound-design`)، قواعد الموشن العربي (`rtl-motion`)، مسار العمل المتكامل (`openmontage`)، وبوابة فحص الجودة النهائية (`video-qa`).
- **أدوات FFmpeg جاهزة (`scripts/`):** دمج ومعايرة الصوت وخفض الموسيقى وقت الكلام تلقائياً (`mix_audio.sh`)، التصدير للمنصات (`export_social.sh`)، وفحص الجودة واستخراج شبكة مشاهد للمراجعة (`video_qa.sh`).
- **القوالب (`templates/`):** جدول الـ Shot Sheet قبل التنفيذ + قالب بداية عملي للموشن العربي في HyperFrames بمساحات أمان مضبوطة.
- **الخصوصية:** أي روابط أو قواعد خاصة بعملاء حطها في `CLAUDE.local.md` (مُتجاهَل في git) وهيتثبت محلياً من غير ما يترفع على GitHub.
