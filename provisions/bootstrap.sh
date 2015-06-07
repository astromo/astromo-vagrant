#!/usr/bin/env bash

PROVISIONS=/vagrant/provisions
PACKAGES=$PROVISIONS/packages

# Set our environment to UTF-8
echo "LC_ALL='en_US.UTF-8'" >> /etc/environment

# Grab updated packages and update them
apt-get update
sudo apt-get upgrade -y

# Install build essentials and git
sudo apt-get -y install build-essential git

# Install PostgreSQL server
if ! type "psql" > /dev/null; then
  . $PACKAGES/postgresql/postgresql.sh
fi

# Install InfluxDB, a Time Series Database
if ! type "/etc/init.d/influxdb" > /dev/null; then
  . $PACKAGES/influxdb/influxdb.sh
fi

# Install io.js
if ! type "iojs" > /dev/null; then
  . $PACKAGES/iojs/iojs.sh
fi

# Install RethinkDB
if ! type "rethinkdb" > /dev/null; then
  . $PACKAGES/rethinkdb/rethinkdb.sh
fi
