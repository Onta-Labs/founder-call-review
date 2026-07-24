#!/usr/bin/env bash
# Render a founder-call scorecard to shareable PNGs (light + dark, 2x).
#
# Usage:  ./render.sh <scorecard.json> [outdir]
#
# JSON shape:
# {
#   "eyebrow":     "Founder call review",
#   "callLabel":   "Partnership call, 47 minutes <span class='dim'>(anonymized)</span>",
#   "overall":     6,
#   "shape":       "The Advisor Trap",
#   "shapeNote":   "One sentence on what the shape means and the fix.",
#   "footerLeft":  "<b>Weakest-link scoring.</b> ...",
#   "footerRight": "your handle or url",
#   "dimensions": [
#     { "name": "Agenda execution", "short": "Agenda", "score": 3, "why": "..." }
#   ]
# }
#
# `short` is the radar axis label (keep it to one word). Order of `dimensions`
# is the radar axis order; the bar list is re-sorted worst-first automatically.
set -euo pipefail

DATA="${1:?usage: render.sh <scorecard.json> [outdir]}"
OUT="${2:-.}"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"

[ -f "$DATA" ]   || { echo "no such file: $DATA" >&2; exit 1; }
[ -x "$CHROME" ] || { echo "Chrome not found. Set CHROME=/path/to/chrome" >&2; exit 1; }

mkdir -p "$OUT"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# Inject the data into the template (no fetch: file:// pages cannot fetch).
python3 - "$HERE/scorecard.html" "$DATA" "$TMP/card.html" <<'PY'
import json, sys
tpl, data, out = sys.argv[1], sys.argv[2], sys.argv[3]
html = open(tpl).read()
payload = json.dumps(json.load(open(data)))
assert "/*__DATA__*/ null" in html, "template marker missing"
open(out, "w").write(html.replace("/*__DATA__*/ null", payload))
PY

shot () { # variant theme w h name
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars \
    --force-device-scale-factor=2 --virtual-time-budget=3000 \
    --window-size="$3,$4" --default-background-color=00000000 \
    --screenshot="$OUT/$5.png" \
    "file://$TMP/card.html?variant=$1&theme=$2" >/dev/null 2>&1
  echo "  $OUT/$5.png"
}

echo "rendering:"
shot full  light 1600 900  scorecard-light
shot full  dark  1600 900  scorecard-dark
shot radar light 1200 1200 callshape-light
shot radar dark  1200 1200 callshape-dark
