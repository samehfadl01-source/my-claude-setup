---
name: motion-craft
description: Professional motion graphics principles, easing curves, pacing, stagger cadence, and motivated transitions for Remotion and HyperFrames.
---

# Motion Craft & Pacing

Apply these rules whenever animating components, kinetic typography, or scene transitions:

1. **Core Motion Principles**
   - **No flat `linear` UI motion:** Never use `linear` easing for entrances, exits, scales, or camera slides. Reserve `linear` strictly for continuous ambient textures, infinite marquees, or steady rotation loops.
   - **Anticipation & Follow-Through:** Major hero entrances or scene shifts benefit from subtle overshoot (`2%–5%` in playful/ad work; zero bounce in luxury/corporate work) or a subtle secondary layer lagging by `60–120ms`.
   - **Staging:** Dim, blur, or scale down background layers slightly (`opacity: 0.35–0.6` or subtle `blur(4px)`) when a foreground callout takes focus.

2. **Easing Curve Recipes**
   - **Enter / Reveal (fast out, smooth settle):** `cubic-bezier(0.16, 1, 0.3, 1)` or overdamped spring (`damping: 22–28`, `stiffness: 170–220`).
   - **Exit / Clear (smooth wind-up, fast out):** `cubic-bezier(0.7, 0, 0.84, 0)` — exits should run **60%–75% as long** as entrances.
   - **UI Snap / Energetic Ad Pop:** `cubic-bezier(0.34, 1.35, 0.64, 1)`.
   - **Smooth Morph / Camera Drift:** `cubic-bezier(0.45, 0, 0.55, 1)`.

3. **Pacing, Timing & Hook Discipline**
   - **First 2.5 Seconds (The Hook):** Motion and visual intrigue must begin on frames `0–3`. Never open an ad or reel with a slow fade from black or empty pause.
   - **Beat Rhythm:** Target **`1.5s–3.5s` per visual idea** in commercial ads, and **`3.0s–6.0s`** in narrative explainers.
   - **Micro-Stagger Cap:** Stagger list items or words by **`40ms–90ms`**, capping total stagger delay under `400ms` so the viewer never waits passively to read.
   - **Timing Ranges:** Micro-interactions/text pops `180ms–320ms`; major scene transitions `450ms–700ms`.

4. **Motivated Transitions & Render Performance**
   - Connect adjacent scenes using **motivated transitions** (match-cut on shared shape/color, directional push following subject velocity, Z-depth zoom through, or mask wipe aligned with an SFX transient) — avoid random unrelated dissolves.
   - Animate GPU-composited properties only (`transform`, `opacity`, `clip-path`). Never animate layout-thrashing properties (`width`, `height`, `top`, `left`, `margin`).
   - Use **`60fps`** for crisp UI demos and fast kinetic ads; **`30fps`** (or `24fps` for cinematic AI edits) for standard explainers.

User request: $ARGUMENTS
