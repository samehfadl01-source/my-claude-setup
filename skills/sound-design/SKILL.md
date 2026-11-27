---
name: sound-design
description: Studio sound design, 4-layer audio mixing, Gemini TTS voiceover direction, and FFmpeg loudness normalization (-14 LUFS) for commercials and motion graphics.
---

# Sound Design, Voiceover & Mixing

Great visuals look twice as expensive when the audio mix is broadcast-ready. Follow this pipeline:

1. **Audio-First Timeline**
   - Generate or lock the **voiceover `.wav`** and extract word-level timestamps with `faster-whisper` **before** finalizing visual cut timing.
   - Land visual impacts and kinetic text peaks on or `1–2 frames` (`33–66ms`) after SFX transients so cuts feel razor-sharp.

2. **The 4-Layer Studio Audio Stack**
   1. **Voiceover / Dialogue (Hero Layer):** Centered mono, clean high-pass filter (`80Hz`), gentle compression (`~3:1`), clear `2–5 kHz` vocal presence.
   2. **SFX & Motion Foley:**
      - Subtle risers (`0.3s–0.8s`) leading into scene reveals.
      - Directional whooshes/swishes (`-14 dB` to `-18 dB` below VO) matching transition speed.
      - Crisp micro-clicks/ticks on UI or data callouts. Never let SFX mask consonants in dialogue.
   3. **Music Bed:** Match BPM to cut cadence; choose instrumental stems without vocals competing against voiceover. Apply **automatic sidechain ducking** (`-12 dB` to `-18 dB` reduction while voiceover is active, smooth release `250–400ms` during pauses).
   4. **Ambience / Room Tone:** Low-level atmospheric bed (`-32 dB` to `-40 dB`) in cinematic edits so silent beats never sound abruptly cut off.

3. **Voiceover Script & Gemini TTS Direction**
   - Pace copy realistically: **`130–145 words/min`** in Arabic, **`140–160 words/min`** in English (leave `0.3s–0.6s` breathing room between major beats).
   - **Arabic clarity:** Add diacritics (**تشكيل**) on ambiguous words, write tricky numbers in full Arabic words where pronunciation matters, and insert explicit pacing/performance cues (e.g., `[warm, confident, medium pace]`, `[pause 0.4s]`).
   - Always ask for uncompressed **`.wav`** (`48kHz`) output rather than compressed MP3 for clean mixing.

4. **Broadcast Loudness & FFmpeg Mastering**
   - Target integrated loudness: **`-14 LUFS`** (True Peak `<= -1.5 dBTP`) for YouTube/Web/Commercial ads, or **`-16 LUFS`** for mobile-first Reels/Shorts explainers.
   - Never ship un-normalized audio or raw clipping peaks. Use `__STUDIO_SCRIPTS_DIR__/mix_audio.sh` to clean dialogue, sidechain-duck music, and normalize loudness automatically.

User request: $ARGUMENTS
