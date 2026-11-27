#!/bin/bash
# Pre-delivery QA inspector: reports ffprobe metadata, EBU R128 loudness, and generates a 3x3 contact sheet.
set -euo pipefail

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ] || [ -z "${1:-}" ]; then
  echo "Usage: bash video_qa.sh <video_file> [output_contact_sheet.png]"
  [ -z "${1:-}" ] && exit 1 || exit 0
fi

VIDEO="$1"
if [ ! -f "$VIDEO" ]; then
  echo "Error: video not found: $VIDEO" >&2
  exit 1
fi

for bin in ffmpeg ffprobe; do
  if ! command -v "$bin" >/dev/null 2>&1; then
    echo "Error: $bin is required." >&2
    exit 1
  fi
done

DIR="$(cd "$(dirname "$VIDEO")" && pwd)"
BASE="$(basename "$VIDEO")"
STEM="${BASE%.*}"
SHEET="${2:-$DIR/${STEM}_qa_sheet.png}"
mkdir -p "$(dirname "$SHEET")"

echo "=== STREAM METADATA ==="
ffprobe -v error -show_entries format=duration,size,bit_rate \
  -show_entries stream=codec_type,codec_name,width,height,r_frame_rate,pix_fmt,sample_rate,channels \
  -of default=noprint_wrappers=1 "$VIDEO"

HAS_AUDIO="$(ffprobe -v error -select_streams a -show_entries stream=index -of csv=p=0 "$VIDEO" || true)"
echo ""
echo "=== AUDIO LOUDNESS (EBU R128) ==="
if [ -n "$HAS_AUDIO" ]; then
  ffmpeg -hide_banner -nostats -i "$VIDEO" -af "ebur128=peak=true" -f null - 2>&1 \
    | awk '/Summary:/{flag=1} flag{print}'
else
  echo "Warning: no audio stream found."
fi

DURATION="$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$VIDEO")"
# Sample ~9 evenly spaced frames across the video without relying on system fonts.
SAMPLE_FPS="$(awk -v d="$DURATION" 'BEGIN { if (d <= 0.1) d = 1; printf "%.6f", 9.0 / d }')"

ffmpeg -y -hide_banner -loglevel error \
  -i "$VIDEO" \
  -vf "fps=${SAMPLE_FPS},scale=480:-2,tile=3x3:padding=8:color=0x11151C" \
  -frames:v 1 "$SHEET"

echo ""
echo "==> Visual QA contact sheet saved to: $SHEET"
