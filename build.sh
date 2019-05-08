#!/bin/sh

mkdir -p dist

for FILE in logo-full.svg logo-round.svg; do
	FILENAME=$(basename "$FILE" .svg)

	inkscape --export-plain-svg="dist/$FILE" "$FILE"
	inkscape --export-png="dist/$FILENAME.png" --export-dpi=700 "$FILE"
	inkscape --export-png="dist/$FILENAME-128.png" --export-height=128 "$FILE"

	inkscape --export-plain-svg=dist/$FILENAME-white.svg "$FILE"
	sed -i 's/stroke:\s*#000000/stroke:#ffffff/g' "dist/$FILENAME-white.svg"
	sed -i 's/fill:\s*#000000/fill:#ffffff/g' "dist/$FILENAME-white.svg"

	inkscape --export-png="dist/$FILENAME-white.png" --export-dpi=700 "dist/$FILENAME-white.svg"
	inkscape --export-png="dist/$FILENAME-white-128.png" --export-height=128 "dist/$FILENAME-white.svg"

done

# Colored logo & icon
FILE=logo-round-colored.svg
FILENAME=$(basename "$FILE" .svg)
inkscape --export-plain-svg="dist/$FILE" "$FILE"
inkscape --export-png="dist/$FILENAME.png" --export-dpi=700 "$FILE"
inkscape --export-png="dist/$FILENAME-icon-32.png" --export-height=32 "$FILE"
inkscape --export-png="dist/$FILENAME-256.png" --export-height=256 "$FILE"
convert "dist/$FILENAME-256.png" -background transparent -define icon:auto-resize=16,32,48,64,128,256 dist/favicon.ico
