#!/bin/bash
#
# Build the 1200x630 link preview card — the image shown when someone pastes a
# link to the site into Slack, LinkedIn, iMessage, Bluesky and so on.
#
# Layout: a BU scarlet panel on the left carrying the group name and institution,
# the group photo filling the rest. The photo is 1.278:1 and the card is 1.905:1,
# so about a third of the frame is spare either way; the panel puts that space to
# work instead of leaving white bars.
#
# Re-run this whenever the group photo changes:
#   bin/build_og_card.sh
#   bin/build_og_card.sh assets/img/people/group_photo_FA26.png
#
# Requires ImageMagick (`magick`) and the Arial Bold font, same as bin/build_eds.sh.
set -euo pipefail

SRC="${1:-assets/img/people/group_photo_SP26.png}"
OUT="${2:-assets/img/brand/og-card-1200x630.jpg}"

FONT="/System/Library/Fonts/Supplemental/Arial Bold.ttf"
RED="#CC0000"
CARD_W=1200
CARD_H=630
PANEL=430 # width of the red panel; the photo takes the remaining 770px

if ! command -v magick >/dev/null 2>&1; then
    echo "error: ImageMagick not found. brew install imagemagick" >&2
    exit 1
fi
if [ ! -e "$FONT" ]; then
    echo "error: font not found: $FONT" >&2
    exit 1
fi
if [ ! -e "$SRC" ]; then
    echo "error: source photo not found: $SRC" >&2
    exit 1
fi

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# The group photo is a composite that ships with white margins baked in. Trim
# them first, otherwise the crop below spends its budget on empty white.
magick "$SRC" -fuzz 2% -trim +repage "$tmp/photo.png"

# `^` resizes to cover rather than fit, then extent crops the overflow, so the
# photo fills its side with no white showing. This does trim the outer edges of
# the group — check nobody important is lost when the photo changes.
magick "$tmp/photo.png" \
    -resize "$((CARD_W - PANEL))x${CARD_H}^" \
    -gravity center -extent "$((CARD_W - PANEL))x${CARD_H}" \
    "$tmp/photo_cropped.png"

magick -size "${PANEL}x${CARD_H}" "xc:$RED" \
    -font "$FONT" -fill white -gravity center \
    -pointsize 60 -annotate "+0-30" "Barnes\nResearch\nGroup" \
    -pointsize 26 -annotate "+0+110" "BOSTON UNIVERSITY" \
    "$tmp/panel.png"

mkdir -p "$(dirname "$OUT")"
magick "$tmp/panel.png" "$tmp/photo_cropped.png" +append \
    -strip -quality 92 "$OUT"

magick "$OUT" -format "wrote $OUT (%[fx:w]x%[fx:h])\n" info:
