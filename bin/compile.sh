#!/usr/bin/env bash

set -e

DIRECTORY=$(cd $(dirname $0) && pwd)
TEMP=$DIRECTORY/../.original-repo
REPO=$TEMP/healthicons
DIST=$REPO/public/icons/svg
RESOURCES=$DIRECTORY/../resources/svg

echo "Removing temporary directory"
if [ -d $TEMP ]; then
  rm -rf $TEMP
  mkdir $TEMP
fi

echo "Removing existing icons"
rm $RESOURCES/*

echo "Cloning resolvetosavelives/healthicons repo"
git clone -q https://github.com/resolvetosavelives/healthicons $REPO

echo "Compiling outline icons..."
for FILE in $DIST/outline/*/*; do
  # Remove path
  SANITIZEDFILE=${FILE##*/}
  # Replace _ with -
  SANITIZEDFILE=${SANITIZEDFILE//_/-}
  cp $FILE $RESOURCES/o-$(echo $SANITIZEDFILE)
done

echo "Compiling filled icons..."
for FILE in $DIST/filled/*/*; do
  # Remove path
  SANITIZEDFILE=${FILE##*/}
  # Replace _ with -
  SANITIZEDFILE=${SANITIZEDFILE//_/-}
  cp $FILE $RESOURCES/f-$(echo $SANITIZEDFILE)
done

echo "Cleaning up"
rm -rf $TEMP

echo "All done!"
