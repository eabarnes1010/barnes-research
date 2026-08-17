#!/bin/bash
#
# Generate the icon files browsers fetch from the SITE ROOT by convention,
# without being told to in markup:
#
#   /favicon.ico          16/32/48/64 in one file. Probed directly for bookmarks,
#                         history entries and older browsers, which do not always
#                         read the page's <link rel="icon">.
#   /apple-touch-icon.png 180px, used for iOS home-screen shortcuts.
#
# Why these exist as files rather than <link> tags: al_folio_core's head.liquid
# emits exactly ONE <link rel="shortcut icon">, built from `icon:` in _config.yml.
# Adding more links would mean overriding the whole gem template for two lines.
# Root-path probing needs no markup at all, so the files do the job instead.
#
# apple-touch-icon uses the SQUARE mark: iOS applies its own rounded mask, and
# feeding it already-rounded corners rounds them twice and bites into the red.
# favicon.ico uses the rounded mark, matching the in-page favicon.
#
# Usage:  bin/build_favicons.sh [letters]
#         bin/build_favicons.sh BR
#
# Requires ImageMagick (`magick`); delegates the drawing to bin/build_mark.sh.
set -euo pipefail

TEXT="${1:-BR}"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$HERE/.." && pwd)"
slug=$(echo "$TEXT" | tr '[:upper:]' '[:lower:]')

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# One rendering per rung. The mark's proportions are ratios of the canvas, so
# each size is drawn at its own resolution rather than downscaled from one big
# image — the letters stay crisp at 16px instead of turning to grey mush.
for s in 16 32 48 64; do
    "$HERE/build_mark.sh" "$TEXT" "$s" "$tmp" >/dev/null
done
magick "$tmp/$slug-round-16.png" "$tmp/$slug-round-32.png" \
    "$tmp/$slug-round-48.png" "$tmp/$slug-round-64.png" \
    "$ROOT/favicon.ico"
echo "wrote favicon.ico (16/32/48/64)"

"$HERE/build_mark.sh" "$TEXT" 180 "$tmp" >/dev/null
cp "$tmp/$slug-square-180.png" "$ROOT/apple-touch-icon.png"
echo "wrote apple-touch-icon.png (180, square — iOS adds its own rounding)"
