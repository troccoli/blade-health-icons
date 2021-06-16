#!/usr/bin/env bash

set -e

DIRECTORY=$(cd `dirname $0` && pwd)
TEMP=$DIRECTORY/../.original-repo
REPO=$TEMP/healthicons
DIST=$REPO/public/icons/svg
RESOURCES=$DIRECTORY/../resources/svg

if [ -d $TEMP ]; then
  rm -rf $TEMP
  mkdir $TEMP
fi

echo "Cloning resolvetosavelives/healthicons repo"

git clone -q https://github.com/resolvetosavelives/healthicons $REPO

echo "Compiling outline icons..."

for FILE in $DIST/outline/*/*; do
  cp $FILE $RESOURCES/o-$(echo ${FILE##*/})
done

echo "Compiling filled icons..."

for FILE in $DIST/filled/*/*; do
  cp $FILE $RESOURCES/f-$(echo ${FILE##*/})
done

echo "Cleaning up"
rm -rf $TEMP

echo "All done!"