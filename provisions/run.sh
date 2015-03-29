#!/usr/bin/env bash

PROVISIONS=/vagrant/provisions
ASTROMO=$PROVISIONS/astromo

# Trust GitHub
. $PROVISIONS/known_hosts.sh

# Run all Astromo repo code
for file in $ASTROMO/*.sh; do
  echo "Executing $file"
  . $file
done