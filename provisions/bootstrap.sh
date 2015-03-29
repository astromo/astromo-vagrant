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
. $PACKAGES/postgresql/postgresql.sh

# Install InfluxDB, a Time Series Database
. $PACKAGES/influxdb/influxdb.sh