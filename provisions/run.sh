#!/usr/bin/env bash

PROVISIONS=/vagrant/provisions
ASTROMO=$PROVISIONS/astromo

# Trust GitHub
. $PROVISIONS/known_hosts.sh

# kill running pm2 processes
pm2 kill

# Run all Astromo repo code
for file in $ASTROMO/*.sh; do
  echo "Executing $file"
  . $file
done

pm2 save
sudo pm2 startup linux -u vagrant
