#!/bin/bash
#
# Draw the group's letter mark — white initials on a BU scarlet square — at any
# size. Writes two shapes:
#
#   <letters>-round-<size>.png   rounded corners, transparent outside — the favicon form
#   <letters>-square-<size>.png  square, red to the edges — for Slack and anything else
#                                that applies its own rounded crop, which would
#                                otherwise round already-rounded corners and cut
#                                into the red
#
# Proportions come from the original 256px favicon this replaces:
#
#   red        #CC0000 (same as --bu-red in _sass/_custom.scss), white letters
#   corner r   34/256 = 13.281% of the side
#   cap height 87/256 = 33.98% of the side
#   face       Arial Bold
#
# Sizing is by CAP HEIGHT only; the width falls where the letterforms put it.
# The earlier version of this script hardcoded a measured ink WIDTH as well,
# which only made sense for the three letters it was built for — two letters
# forced into that width would have been stretched.
#
# Letter count matters more than it looks. At a 16px tab strip each glyph gets
# about 5 pixels of stem, so two letters read and three turn to mush:
#   BR  -> ink 65% of the square    three-letter marks land at ~90%+
#
# Usage:  bin/build_mark.sh [letters] [size] [output-dir]
#         bin/build_mark.sh BR 512 assets/img/brand
#
# Requires ImageMagick (`magick`) and the Arial Bold font.
set -euo pipefail

TEXT="${1:-BR}"
SIZE="${2:-512}"
OUT_DIR="${3:-.}"

FONT="/System/Library/Fonts/Supplemental/Arial Bold.ttf"
RED="#CC0000"

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

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# Render the letters large, trim to the ink, then scale to the target cap height
# preserving aspect. Scaling rendered glyphs rather than guessing a point size
# means the ink lands on the same proportions at every size.
magick -background none -fill white -font "$FONT" -pointsize 600 \
    label:"$TEXT" -trim +repage "$tmp/text.png"
magick "$tmp/text.png" -resize "x${INK_H}" "$tmp/text_scaled.png"

magick -size "${SIZE}x${SIZE}" xc:none \
    -fill "$RED" -draw "roundrectangle 0,0 $((SIZE - 1)),$((SIZE - 1)) $RADIUS,$RADIUS" \
    "$tmp/plate_round.png"
magick -size "${SIZE}x${SIZE}" "xc:$RED" "$tmp/plate_square.png"

slug=$(echo "$TEXT" | tr '[:upper:]' '[:lower:]')
for shape in round square; do
    magick "$tmp/plate_$shape.png" "$tmp/text_scaled.png" \
        -gravity center -composite "$OUT_DIR/$slug-$shape-$SIZE.png"
    echo "wrote $OUT_DIR/$slug-$shape-$SIZE.png"
done

ink_w=$(magick "$tmp/text_scaled.png" -format "%[fx:w]" info:)
echo "  ink ${ink_w}x${INK_H} — $(python3 -c "print(round(100*$ink_w/$SIZE))")% of the square wide"
