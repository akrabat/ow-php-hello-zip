#!/bin/bash

# Run wsk action delete for a set of zip files


PACKAGE=$1
shift

if [ -z $PACKAGE ] ; then
    echo "Usage: deleteActions.sh {package name} {action name 1} [{action name 2}] [{action name 3}] ..."
fi


for arg
do
    ACTION_NAME=$arg

    wsk action delete $PACKAGE/$ACTION_NAME
done
