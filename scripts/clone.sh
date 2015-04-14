#!/bin/bash

# Import our repo variables
. ./scripts/repos.sh

mkdir -p src

# Define our clone function
function clone {
    DIR=src/$2
    REPO=git@github.com:astromo/$1.git

    if [ ! -d "$DIR" ]; then
        git clone --recursive $REPO $DIR
    else
        echo "$1 is already cloned in $DIR"
    fi
}

# Clone all our repos
for repo in "${repos[@]}"; do
    KEY="${repo%%:*}"
    VALUE="${repo##*:}"

    clone "$KEY" "$VALUE"
done
