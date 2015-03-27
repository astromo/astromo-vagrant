#!/usr/bin/env bash

# Set our environment to UTF-8
echo "LC_ALL='en_US.UTF-8'" >> /etc/environment

# Grab updated packages and update them
apt-get update
sudo apt-get upgrade

# Trust GitHub
sh /vagrant/provisions/known_hosts.sh

# Install PostgreSQL server
sh /vagrant/provisions/packages/postgresql/postgresql.sh
