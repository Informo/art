#!/bin/sh

mkdir -p dist

for FILE in *.svg; do
	FILENAME=$(basename "$FILE" .svg)

	inkscape --export-plain-svg="dist/$FILE" "$FILE"
	inkscape --export-png="dist/$FILENAME.png" --export-dpi=700 "$FILE"
	inkscape --export-png="dist/$FILENAME-128.png" --export-height=128 "$FILE"
	inkscape --export-png="dist/$FILENAME-256.png" --export-height=256 "$FILE"
done

