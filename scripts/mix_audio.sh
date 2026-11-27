#!/bin/bash
# Studio audio mastering utility: cleans voiceover, ducks background music, and normalizes loudness.
set -euo pipefail

VO=""
MUSIC=""
OUT=""
LUFS="-14"
MUSIC_DB="-15"

usage() {
  cat <<'EOF'
Usage: bash mix_audio.sh --vo <voiceover.wav> [--music <music.mp3>] --out <master.wav> [--lufs -14] [--music-db -15]

Options:
  --vo <path>        Required voiceover audio file (ideally 48kHz .wav)
  --music <path>     Optional background music track (looped/trimmed to VO length + sidechain ducked)
  --out <path>       Required output file (.wav, .m4a, .aac, or .mp3)
  --lufs <number>    Target integrated loudness in LUFS (default: -14)
  --music-db <num>   Base music bed attenuation in dB before ducking (default: -15)
  -h, --help         Show this help
EOF
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --vo) VO="${2:-}"; shift 2 ;;
    --music) MUSIC="${2:-}"; shift 2 ;;
    --out) OUT="${2:-}"; shift 2 ;;
    --lufs) LUFS="${2:-}"; shift 2 ;;
    --music-db) MUSIC_DB="${2:-}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage >&2; exit 1 ;;
  esac
done

if [ -z "$VO" ] || [ -z "$OUT" ]; then
  echo "Error: --vo and --out are required." >&2
  usage >&2
  exit 1
fi

if [ ! -f "$VO" ]; then
  echo "Error: voiceover file not found: $VO" >&2
  exit 1
fi

if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "Error: ffmpeg is required." >&2
  exit 1
fi

mkdir -p "$(dirname "$OUT")"

VO_CHAIN="aformat=sample_rates=48000:channel_layouts=stereo,highpass=f=80,acompressor=threshold=-18dB:ratio=3:attack=10:release=120:makeup=2"
LOUD_CHAIN="loudnorm=I=${LUFS}:TP=-1.5:LRA=11"

if [ -n "$MUSIC" ]; then
  if [ ! -f "$MUSIC" ]; then
    echo "Error: music file not found: $MUSIC" >&2
    exit 1
  fi
  FILTER="[0:a]${VO_CHAIN},asplit=2[vo_mix][vo_sc];[1:a]aformat=sample_rates=48000:channel_layouts=stereo,volume=${MUSIC_DB}dB[bg];[bg][vo_sc]sidechaincompress=threshold=0.025:ratio=4:attack=25:release=300:makeup=1[ducked];[vo_mix][ducked]amix=inputs=2:duration=first:normalize=0,${LOUD_CHAIN}[outa]"
  ffmpeg -y -hide_banner -loglevel error \
    -i "$VO" \
    -stream_loop -1 -i "$MUSIC" \
    -filter_complex "$FILTER" \
    -map "[outa]" -ar 48000 -ac 2 "$OUT"
else
  ffmpeg -y -hide_banner -loglevel error \
    -i "$VO" \
    -af "${VO_CHAIN},${LOUD_CHAIN}" \
    -ar 48000 -ac 2 "$OUT"
fi

echo "==> Mastered audio written to: $OUT (target ${LUFS} LUFS)"
