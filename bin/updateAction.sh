#!/bin/bash

# Run wsk action update for a set of zip files
# Add an annotation to keep track of the git revision


GIT_HASH=`git rev-parse HEAD`

status="$(git status --short)"
if [ -n "$status" ] ; then
    GIT_HASH="Local changes from $GIT_HASH"
fi


PACKAGE=$1
shift

if [ -z $PACKAGE ] ; then
    echo "Usage: update.sh {package name} {zip file 1} [{zip file 2}] [{zip file 3}] ..."
fi


for arg
do
    ACTION_FILE=$arg

    ACTION_NAME=${arg%.zip}  # retain the part before the .
    ACTION_NAME=${ACTION_NAME##*/}  # retain the part after the last slash

    wsk action update $PACKAGE/$ACTION_NAME $ACTION_FILE --kind php:7.1 \
      --web true \
      -a web-custom-options true \
      --annotation git_hash "$GIT_HASH"
done
