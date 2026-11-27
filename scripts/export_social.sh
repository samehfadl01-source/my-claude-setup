#!/bin/bash
# Multi-platform final video encoder (H.264 yuv420p, 48kHz AAC, faststart).
set -euo pipefail

IN=""
OUT=""
PRESET="youtube"

usage() {
  cat <<'EOF'
Usage: bash export_social.sh --in <input.mp4> --out <output.mp4> [--preset youtube|reels|square|preview]

Presets:
  youtube   Keep source framing (even dims), CRF 17, AAC 256k (default)
  reels     Fit/pad to 1080x1920 (9:16), CRF 18, AAC 192k
  square    Fit/pad to 1080x1080 (1:1), CRF 18, AAC 192k
  preview   Fast lightweight 720p review encode (CRF 26, AAC 128k)
EOF
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --in) IN="${2:-}"; shift 2 ;;
    --out) OUT="${2:-}"; shift 2 ;;
    --preset) PRESET="${2:-}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage >&2; exit 1 ;;
  esac
done

if [ -z "$IN" ] || [ -z "$OUT" ]; then
  echo "Error: --in and --out are required." >&2
  usage >&2
  exit 1
fi

if [ ! -f "$IN" ]; then
  echo "Error: input video not found: $IN" >&2
  exit 1
fi

if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "Error: ffmpeg is required." >&2
  exit 1
fi

mkdir -p "$(dirname "$OUT")"

case "$PRESET" in
  youtube)
    VF="scale=trunc(iw/2)*2:trunc(ih/2)*2"
    CRF="17"
    ABIT="256k"
    ;;
  reels)
    VF="scale=1080:1920:force_original_aspect_ratio=decrease,pad=1080:1920:(ow-iw)/2:(oh-ih)/2:color=#0B0E14"
    CRF="18"
    ABIT="192k"
    ;;
  square)
    VF="scale=1080:1080:force_original_aspect_ratio=decrease,pad=1080:1080:(ow-iw)/2:(oh-ih)/2:color=#0B0E14"
    CRF="18"
    ABIT="192k"
    ;;
  preview)
    VF="scale=if(gte(iw\,ih)\,min(1280\,iw)\,-2):if(gte(iw\,ih)\,-2\,min(1280\,ih)),scale=trunc(iw/2)*2:trunc(ih/2)*2"
    CRF="26"
    ABIT="128k"
    ;;
  *)
    echo "Error: unknown preset '$PRESET'" >&2
    usage >&2
    exit 1
    ;;
esac

ffmpeg -y -hide_banner -loglevel error \
  -i "$IN" \
  -vf "$VF" \
  -c:v libx264 -preset medium -crf "$CRF" -pix_fmt yuv420p \
  -c:a aac -b:a "$ABIT" -ar 48000 -ac 2 \
  -movflags +faststart \
  "$OUT"

SIZE_BYTES="$(wc -c < "$OUT" | tr -d ' ')"
echo "==> Exported ($PRESET): $OUT (${SIZE_BYTES} bytes)"
