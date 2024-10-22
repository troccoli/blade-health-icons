#!/usr/bin/env bash

# Run this from the project directory making sure to include the
# version of the Healthicons.org NPM package you want
# e.g. ./bin/compile.sh 1.0.0

set -eux

if [ -z $1 ]; then
  echo "Version is missing."
  echo "Usage:"
  echo "  $0 1.0.0"
  exit 1
fi

DIRECTORY=$(cd $(dirname $0) && pwd)
VERSION=$1
TEMP=$DIRECTORY/../.healthicons
DIST=$TEMP/node_modules/healthicons/public/icons/svg
RESOURCES=$DIRECTORY/../resources/svg

echo "Create temporary directory"
if [ -d $TEMP ]; then
  rm -rf $TEMP
fi
mkdir $TEMP

echo "Removing existing icons"
rm $RESOURCES/*

echo "Install healthicons package"
cd $TEMP
npm i healthicons@$VERSION

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

echo "Adding icons to GIT"
git add $RESOURCES

echo "All done!"
