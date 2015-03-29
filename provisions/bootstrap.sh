#!/usr/bin/env bash

PROVISIONS=/vagrant/provisions
PACKAGES=$PROVISIONS/packages

# Set our environment to UTF-8
echo "LC_ALL='en_US.UTF-8'" >> /etc/environment

# Grab updated packages and update them
apt-get update
sudo apt-get upgrade -y

# Trust GitHub
sh $PROVISIONS/known_hosts.sh

# Install PostgreSQL server
sh $PACKAGES/postgresql/postgresql.sh

# Install InfluxDB, a Time Series Database
sh $PACKAGES/influxdb/influxdb.sh