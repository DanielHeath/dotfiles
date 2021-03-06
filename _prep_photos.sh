#!/usr/bin/env bash
set -euo pipefail

USAGE="Usage: $0 <from> <to>"
FROMDIR="${1:?$USAGE}"

if ! [ -d "$FROMDIR" ] ; then
  echo "$USAGE"
  echo "<from> must be a directory"
  exit 1
fi

TODIR="${2:?Usage: $0 <from> <to>}"
if ! [ -d "$TODIR" ] ; then
  echo "$USAGE"
  echo "<to> must be a directory"
  exit 1
fi

shopt -s globstar nullglob
for ext in JPG JPEG jpg jpeg ; do
  for file in $FROMDIR/**/*.$ext
  do
    base=$(basename "$file" "$ext")
    convert "$file" "$TODIR/$base.webp"
  done
done

for ext in MOV mov ; do
  for file in $FROMDIR/**/*.$ext
  do
    base=$(basename "$file" "$ext")
    ffmpeg \
      -i "$file" \
      -vcodec libx264 \
      -strict -2 \
      "$TODIR/$base.webp"
  done
done
