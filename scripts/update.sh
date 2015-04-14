#!/bin/bash

# Import our repo variables
. ./scripts/repos.sh

# Remember our current working directory
CURRENT_DIR=`pwd`

function update {
    DIR=src/$2

    if [ -d "$DIR" ]; then
        cd $DIR
        git pull --rebase origin master
        cd $CURRENT_DIR
    else
        echo "$1 does not exist in $DIR"
    fi
}

# Clone all our repos
for repo in "${repos[@]}"; do
    KEY="${repo%%:*}"
    VALUE="${repo##*:}"

    update "$KEY" "$VALUE"
done
