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

# Validate, then inject the data into the template (no fetch: file:// pages cannot fetch).
# Validation is not ceremony: a bad key renders a BLANK card and Chrome still exits 0, so
# without this the only symptom of a typo is a silently empty PNG.
python3 - "$HERE/scorecard.html" "$DATA" "$TMP/card.html" <<'PY'
import json, sys
tpl, data, out = sys.argv[1], sys.argv[2], sys.argv[3]

def die(msg):
    sys.exit("scorecard JSON: " + msg)

try:
    d = json.load(open(data))
except json.JSONDecodeError as e:
    die("not valid JSON (%s)" % e)
if not isinstance(d, dict):
    die("top level must be an object")
for key in ("callLabel", "overall", "dimensions"):
    if key not in d:
        die("missing required key %r" % key)
dims = d["dimensions"]
if not isinstance(dims, list) or not dims:
    die("'dimensions' must be a non-empty list")
if not 3 <= len(dims) <= 8:
    die("expected 3 to 8 dimensions, got %d (the card layout is fixed height)" % len(dims))
for i, dim in enumerate(dims):
    if not isinstance(dim, dict):
        die("dimensions[%d] must be an object" % i)
    for key in ("name", "score", "why"):
        if key not in dim:
            die("dimensions[%d] missing %r" % (i, key))
    if not isinstance(dim["score"], (int, float)) or isinstance(dim["score"], bool):
        die("dimensions[%d].score must be a number" % i)
    if not 0 <= dim["score"] <= 10:
        die("dimensions[%d].score is %r, expected 0 to 10" % (i, dim["score"]))

html = open(tpl).read()
if "/*__DATA__*/ null" not in html:
    die("template marker missing from scorecard.html")
# json.dumps escapes neither '<' nor '/', so a literal </script> inside any string field
# would close the <script> block early and render a blank card.
payload = json.dumps(d).replace("</", "<\\/")
open(out, "w").write(html.replace("/*__DATA__*/ null", payload))
PY

shot () { # variant theme w h name
  local log="$TMP/$5.log"
  if ! "$CHROME" --headless=new --disable-gpu --hide-scrollbars \
    --force-device-scale-factor=2 --virtual-time-budget=3000 \
    --window-size="$3,$4" --default-background-color=00000000 \
    --screenshot="$OUT/$5.png" \
    "file://$TMP/card.html?variant=$1&theme=$2" >"$log" 2>&1
  then
    echo "chrome failed rendering $5:" >&2; cat "$log" >&2; exit 1
  fi
  [ -s "$OUT/$5.png" ] || { echo "chrome produced no output for $5" >&2; exit 1; }
  echo "  $OUT/$5.png"
}

echo "rendering:"
shot full  light 1600 900  scorecard-light
shot full  dark  1600 900  scorecard-dark
shot radar light 1200 1200 callshape-light
shot radar dark  1200 1200 callshape-dark
