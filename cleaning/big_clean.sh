#!/usr/bin/env bash

#CONSTANTS
ARCHIVE_VALUE=$1
SCRATCH=$(mktemp -d)
base=$(basename -s .tgz "$ARCHIVE_VALUE")
here=$(pwd)

#MAIN

#Extract files.
tar -zxf "$ARCHIVE_VALUE" -C "$SCRATCH"

#Goes to this directory.
cd "$SCRATCH" || exit

#Delete files
grep -Rl "DELETE ME!" . | xargs rm

#Archive file
tar -zcf cleaned_"$ARCHIVE_VALUE" "$base"

#Move archived file
mv cleaned_"$ARCHIVE_VALUE" "$here"

cd "$here" || exit
rm -rf "$SCRATCH"
