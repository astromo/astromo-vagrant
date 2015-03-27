#!/usr/bin/env bash

POSTGRES_MAJOR_VERSION=9.4
POSTGRES_DATA=/etc/postgresql/$POSTGRES_MAJOR_VERSION/main
POSTGRES_CONFIG=$POSTGRES_DATA/postgresql.conf
POSTGRES_AUTH=$POSTGRES_DATA/pg_hba.conf

POSTGRES_USER=postgres

ASTROMO_USER=astromo
ASTROMO_DB=astromo

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

sudo apt-get install -y wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo apt-get update
sudo apt-get install -y postgresql-$POSTGRES_MAJOR_VERSION postgresql-contrib-$POSTGRES_MAJOR_VERSION

# Own our data folder
chown -R $POSTGRES_USER $POSTGRES_DATA

# Listen on all interfaces
sed -ri "s/^#(listen_addresses\s*=\s*)\S+/\1'*'/" $POSTGRES_CONFIG

sudo service postgresql restart

# Initial database setup
sudo -u postgres psql <<EOF
  \x
  CREATE EXTENSION pgcrypto;
  ALTER USER $POSTGRES_USER WITH SUPERUSER PASSWORD '$POSTGRES_USER';
  CREATE USER $ASTROMO_USER WITH SUPERUSER PASSWORD '$ASTROMO_USER';
  CREATE DATABASE $ASTROMO_DB WITH OWNER $ASTROMO_USER TEMPLATE template0 ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
EOF

# Allow login from anywhere
echo "local all all           trust" > $POSTGRES_AUTH
echo "host  all all 0.0.0.0/0 md5"  >> $POSTGRES_AUTH

sudo service postgresql restart

# Import our seed data
psql -f /vagrant/provisions/packages/postgresql/seed/astromo.sql -d $ASTROMO_DB -U $POSTGRES_USER
