---
name: cinema-camera
description: Cinematography grammar, shot scales, motivated camera moves, lighting setups, and structured Veo prompt direction for commercial and cinematic videos.
---

# Cinematography, Camera & AI Shot Direction

Use this guide when planning storyboards, shot sheets, or generating AI video prompts (e.g., Veo):

1. **Shot Scale Grammar (Every Cut Needs a Purpose)**
   - **`EWS / WS` (Extreme Wide / Wide):** Establish world, scale, architecture, or environmental mood.
   - **`MS / MCU` (Medium / Medium Close-Up):** Core storytelling, human action, and relatable product usage.
   - **`CU / ECU` (Close-Up / Extreme Close-Up):** Emotional peak, tactile surface detail, luxury product hero, and dramatic tension.
   - **`OTS / POV` (Over-the-Shoulder / Point-of-View):** Put the viewer directly inside the character's or user's perspective.
   - **Cut Rule:** Change both **shot scale** and **angle** noticeably between consecutive cuts (`>= 30°` angle shift or clear scale jump) to avoid awkward jump cuts.

2. **Motivated Camera Movement**
   - **Slow Dolly In:** Builds intimacy, reveals detail, raises emotional stakes.
   - **Pull Back / Dolly Out:** Reveals broader context, surprise scale, or isolation.
   - **Lateral Tracking / Truck:** Drives forward momentum and commercial energy.
   - **Crane / Jib Rise:** Reveals grandeur, finale payoff, or hero transition.
   - **Subtle Handheld Drift:** Adds documentary authenticity and human warmth.
   - **Whip Pan / Speed Ramp:** High-energy commercial bridge between scenes (pair with whoosh SFX).

3. **Lens & Lighting Recipes**
   - **`24mm` wide:** Environmental drama, dynamic perspective, architectural sweep.
   - **`35mm` classic:** Balanced cinematic storytelling and natural movement.
   - **`50mm / 85mm`:** Flattering shallow depth of field (`f/1.8–f/2.8`) isolating subject/product from soft bokeh.
   - **Lighting Structure:** Define **Key Light** (direction + softness/hardness), **Rim/Hair Light** (subject separation from background), and **Color Contrast** (e.g., warm practical tungsten vs cool ambient twilight, or crisp diffused commercial softbox).

4. **5-Part Veo Shot Prompt Formula**
   Write each ready-to-paste AI shot prompt using this exact structure:
   1. **Camera & Lens:** Shot scale, lens look, exact single camera move and pace (`Slow dolly-in on an 85mm lens...`).
   2. **Subject & Action:** One clear, continuous physical action doable inside 4–8 seconds.
   3. **Environment & Lighting:** Physical setting, time of day, key/rim light quality, surface reflections.
   4. **Color & Texture:** Palette, contrast, subtle organic film grain, atmospheric depth (haze/dust/rain).
   5. **Guardrails:** Keep composition clean with negative space for post-added typography; explicitly avoid rendered text, warped logos, or crowded multi-character actions inside AI video shots (add all titles/UI in Remotion or HyperFrames).

5. **Pre-Production Shot Sheet**
   Before producing clips or writing scene code, align the edit in a Shot Sheet (`__TEMPLATES_DIR__/shot-sheet-template.md`) mapping Timecode, Shot/Camera, VO Line, SFX, and Motion Overlay.

User request: $ARGUMENTS
