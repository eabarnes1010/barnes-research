#!/bin/bash
#
# Regenerate the "EDS" mark (white Environmental Data Science initials on a BU
# scarlet square) at any size. Writes two shapes:
#
#   eds-round-<size>.png    rounded corners, transparent outside — the site favicon form
#   eds-square-<size>.png   square, red to the edges — for Slack and anything else
#                           that applies its own rounded crop, which would
#                           otherwise round already-rounded corners and cut into
#                           the red
#
# Proportions were measured from the original 256px assets/img/favicon.png so
# regenerating at any size reproduces it:
#
#   red        #CC0000 (same as --bu-red in _sass/_custom.scss), white text
#   corner r   34/256  = 13.281% of the side
#   text ink   227x87  = 88.67% wide, 33.98% tall, centered
#   face       Arial Bold, identified by scoring candidate fonts against the
#              original letterforms (MAE 0.036; next best was 0.128)
#
# Regenerating at 256 reproduces the original to within 1.4% mean error, the
# difference being antialiasing.
#
# Usage:  bin/build_eds.sh [size] [output-dir]
#         bin/build_eds.sh 512 assets/img/brand
#
# Requires ImageMagick (`magick`) and the Arial Bold font.
set -euo pipefail

FONT="/System/Library/Fonts/Supplemental/Arial Bold.ttf"
RED="#CC0000"
SIZE="${1:-512}"
OUT_DIR="${2:-.}"

if ! command -v magick >/dev/null 2>&1; then
    echo "error: ImageMagick not found. brew install imagemagick" >&2
    exit 1
fi
if [ ! -e "$FONT" ]; then
    echo "error: font not found: $FONT" >&2
    echo "       Set FONT to an Arial Bold (or metrically identical) file." >&2
    exit 1
fi
mkdir -p "$OUT_DIR"

RADIUS=$(python3 -c "print(round($SIZE * 34/256))")
INK_H=$(python3 -c "print(round($SIZE * 87/256))")
INK_W=$(python3 -c "print(round($SIZE * 227/256))")

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# Render the letters large, trim to the ink, then scale to the measured ink box.
# Scaling rendered glyphs rather than guessing a point size means the ink lands
# on exactly the proportions measured from the original, at every size.
magick -background none -fill white -font "$FONT" -pointsize 600 \
    label:EDS -trim +repage "$tmp/text.png"
magick "$tmp/text.png" -resize "${INK_W}x${INK_H}!" "$tmp/text_scaled.png"

magick -size "${SIZE}x${SIZE}" xc:none \
    -fill "$RED" -draw "roundrectangle 0,0 $((SIZE - 1)),$((SIZE - 1)) $RADIUS,$RADIUS" \
    "$tmp/plate_round.png"
magick -size "${SIZE}x${SIZE}" "xc:$RED" "$tmp/plate_square.png"

for shape in round square; do
    magick "$tmp/plate_$shape.png" "$tmp/text_scaled.png" \
        -gravity center -composite "$OUT_DIR/eds-$shape-$SIZE.png"
    echo "wrote $OUT_DIR/eds-$shape-$SIZE.png"
done
