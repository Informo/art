#!/bin/sh

mkdir -p dist

for FILE in *.svg; do
	FILENAME=$(basename "$FILE" .svg)

	inkscape --export-plain-svg="dist/$FILE" "$FILE"
	inkscape --export-png="dist/$FILENAME.png" --export-dpi=1000 "$FILE"

	inkscape --export-plain-svg=dist/$FILENAME-white.svg "$FILE"
	sed -i 's/stroke:\s*#000000/stroke:#ffffff/g' "dist/$FILENAME-white.svg"
	sed -i 's/fill:\s*#000000/fill:#ffffff/g' "dist/$FILENAME-white.svg"

	inkscape --export-png="dist/$FILENAME-white.png" --export-dpi=1000 "dist/$FILENAME-white.svg"

done
