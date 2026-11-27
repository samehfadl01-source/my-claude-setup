# Pre-Production Creative Brief & Shot Sheet

## 1. Project Brief
- **Title / Brand:**
- **Format & Deliverable:** `16:9` (1920×1080) | `9:16` (1080×1920) | `1:1` (1080×1080)
- **Target Duration & FPS:** e.g., `30s @ 30fps` (or `60fps` for UI/kinetic promos)
- **Primary Renderer:** `HyperFrames` (kinetic/promo/SVG) | `Remotion` (data/captions/composite) | `Hybrid Veo + Code`
- **Opening Hook (`0.0s–2.5s`):** What stops the scroll immediately?
- **Visual Direction:** Palette (`60/30/10`), Display & Body fonts, lighting mood.
- **Voiceover Language & Tone:** e.g., Egyptian Arabic, warm & confident (`~135 wpm`, `.wav`).

---

## 2. Shot Sheet

| Beat | Timecode | Shot Scale & Camera Move | Visual / Veo Prompt or Coded Scene | On-Screen Text (Max 6–8 words) | Voiceover Cue | SFX & Music Layer |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 01 (Hook) | `00:00–00:02.5` | e.g., `CU` fast push-in | | | | Riser + impact hit |
| 02 | `00:02.5–00:07` | | | | | Whoosh + beat drop |
| 03 | `00:07–00:13` | | | | | Subtle UI clicks |
| ... | | | | | | |
| Final (CTA) | `00:26–00:30` | `MS` settle + logo lockup | | | | Music tail + chime |

---

## 3. Pre-Delivery Checklist
- [ ] Voiceover `.wav` aligned with `faster-whisper` timestamps before locking cuts.
- [ ] Audio mastered via `scripts/mix_audio.sh` (`-14 LUFS`, music ducked under dialogue).
- [ ] Safe zones respected (`9:16`: top `150px`, bottom `320px`, right `120px` clear).
- [ ] Arabic RTL glyphs joined cleanly; English/numbers isolated with `dir="ltr"`.
- [ ] `scripts/video_qa.sh` run and `qa_sheet.png` visually inspected.
