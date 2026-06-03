#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-only

PORT="${GLIDE_VIEW_PORT:-5600}"
CODEC=$(printf "%s" "${GLIDE_VIEW_CODEC:-${GLIDE_CODEC:-h264}}" | tr '[:upper:]' '[:lower:]')
WIDTH="${GLIDE_WIDTH:-1920}"
HEIGHT="${GLIDE_HEIGHT:-1080}"
FLOW_FPS="${GLIDE_FLOW_FPS:-30}"
DISPLAY_HZ="${GLIDE_DISPLAY_HZ:-60}"
UI_WIDTH="${GLIDE_UI_WIDTH:-760}"
UI_HEIGHT="${GLIDE_UI_HEIGHT:-${HEIGHT}}"
UI_COLOR="${GLIDE_UI_COLOR:-0xCC0B1722}"
UI_BUFFER="${GLIDE_UI_BUFFER:-/tmp/openhd-glide-ui.argb}"

case "${CODEC}" in
  h264|avc)
    CODEC="h264"
    ;;
  h265|hevc)
    CODEC="h265"
    ;;
  *)
    echo "unsupported codec '${CODEC}'; use h264 or h265" >&2
    exit 2
    ;;
esac

rm -f "${UI_BUFFER}"

/usr/bin/glide-ui \
  --buffer \
  --width "${UI_WIDTH}" \
  --height "${UI_HEIGHT}" \
  --buffer-path "${UI_BUFFER}" &
UI_PID=$!

cleanup() {
  kill "${UI_PID}" 2>/dev/null || true
  wait "${UI_PID}" 2>/dev/null || true
}
trap cleanup EXIT INT TERM

/usr/bin/openhd-glide \
  --kms-video-preview \
  --native-rkmpp-video \
  --view-udp-port "${PORT}" \
  --view-udp-codec "${CODEC}" \
  --preview-width "${WIDTH}" \
  --flow-height "${HEIGHT}" \
  --flow-fps "${FLOW_FPS}" \
  --display-refresh-hz "${DISPLAY_HZ}" \
  --ui-overlay \
  --ui-width "${UI_WIDTH}" \
  --ui-height "${UI_HEIGHT}" \
  --ui-buffer-path "${UI_BUFFER}" \
  --ui-debug-color "${UI_COLOR}"
STATUS=$?

cleanup
exit ${STATUS}
