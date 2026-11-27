---
name: rtl-motion
description: Best practices and checks for Arabic and RTL motion graphics in Remotion, HyperFrames (HTML/CSS/GSAP), and FFmpeg subtitles.
---

# Arabic & RTL Motion Graphics

Apply these rules whenever building Arabic or mixed Arabic/English motion graphics scenes:

1. **Direction & Bidi Isolation**
   - Set `dir="rtl"` and `lang="ar"` on the composition/container root.
   - Wrap embedded English identifiers, numbers, or brands in `<span dir="ltr" style="unicode-bidi: isolate;">...</span>` so punctuation and word order do not flip.
2. **Never Split Connected Arabic Glyphs**
   - Do **not** animate Arabic text by splitting strings into individual characters (`text.split("")`): breaking characters into isolated spans destroys cursive ligatures and letter joining.
   - Animate by **words**, **phrases**, or **lines** (`display: inline-block` per word with preserved spacing), or mask/clip full words cleanly.
3. **Font Loading Before Frame Capture**
   - Ensure Arabic web fonts (e.g., `Cairo`, `Tajawal`, `IBM Plex Sans Arabic`, `Readex Pro`) or local `.woff2`/`.ttf` fonts are fully loaded (`document.fonts.ready` in HyperFrames / `delayRender` + `@remotion/google-fonts` in Remotion) before rendering frame 0.
   - Avoid italic styles on Arabic fonts unless verified; prefer weight contrast (`400` vs `700`/`800`) and subtle scale/opacity/blur transitions.
4. **Numbers & Timing**
   - Keep numerals consistent across the project (Western `0-9` vs Eastern Arabic `٠-٩`) and use `font-variant-numeric: tabular-nums` for animated counters so digits do not jitter horizontally.
5. **FFmpeg Subtitles & Captions**
   - Prefer `libass` (`.ass` subtitles with explicit RTL font and alignment) or rendered React/HTML caption overlays over plain `.srt` when burning Arabic captions with `ffmpeg`, and verify one rendered preview frame visually to confirm glyph shaping.

User request: $ARGUMENTS
