---
name: video-qa
description: Mandatory pre-delivery quality assurance gate using ffprobe, loudness inspection, and visual contact-sheet frame review.
---

# Pre-Delivery Video QA Gate

Never mark a video project complete or deliver a final render before running this QA pass:

1. **Run Automated Technical & Visual Extraction**
   Run the studio QA inspector on the rendered video:
   ```bash
   bash __STUDIO_SCRIPTS_DIR__/video_qa.sh path/to/render.mp4
   ```
   This prints stream metadata (`ffprobe`), EBU R128 loudness (`LUFS` & `True Peak`), and generates a visual **contact sheet** (`qa_contact_sheet.png`) of evenly sampled keyframes across the timeline.

2. **Technical Stream Verification**
   - **Codec & Compatibility:** `H.264` (`libx264`), pixel format `yuv420p`, `movflags +faststart` for instant web/mobile playback.
   - **Resolution & Aspect Parity:** Exact match to brief (`1920x1080`, `3840x2160`, `1080x1920`, or `1080x1080`).
   - **Audio Health:** `48kHz` stereo AAC (`>= 192 kbps`), integrated loudness between `-13.0` and `-17.0 LUFS`, True Peak `<= -1.0 dBTP` (zero digital clipping).

3. **Visual Frame Audit (Inspect `qa_contact_sheet.png` + Dense Text Frames)**
   - **Safe Zones:** Confirm no headline, subtitle, or logo collides with `9:16` platform overlays (top `150px`, bottom `320px`, right `120px`) or `16:9` edges.
   - **Arabic / RTL Integrity:** Confirm all Arabic glyphs are properly connected (no broken isolated letters), punctuation sits correctly, and embedded English/numbers stay readable.
   - **Legibility & Contrast:** Verify crisp text contrast over footage/backgrounds and zero colliding/overlapping layers.
   - **Timeline Cleanliness:** Confirm motion starts immediately (no blank/black dead intro) and ends cleanly without abrupt audio cutoffs.

4. **Final Social / Delivery Export**
   If encoding or compressing for delivery, use `__STUDIO_SCRIPTS_DIR__/export_social.sh` (`youtube`, `reels`, or `preview` preset) and verify the exported file size and playability.

User request: $ARGUMENTS
