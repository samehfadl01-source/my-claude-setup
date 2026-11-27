# HyperFrames Arabic RTL Starter

A minimal HTML/CSS studio starter demonstrating:
- Proper `dir="rtl"` + `unicode-bidi: isolate` for mixed Arabic/English text and `tabular-nums`
- Word-by-word kinetic animation (keeping Arabic cursive ligatures intact)
- Built-in Safe Zone tokens for `9:16` (`1080×1920`) and `16:9` (`1920×1080`)
- Studio easing tokens (`--ease-enter`, `--ease-exit`, `--ease-snap`)
- Explicit `document.fonts.ready` gate before animation starts

Add `.debug-safe-zones` to `#stage` during layout QA to visualize platform margins.
