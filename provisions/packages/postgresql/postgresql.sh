#!/usr/bin/env bash

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

sudo apt-get install -y wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo apt-get update
sudo apt-get install -y postgresql-9.4 postgresql-contrib-9.4

# Own our data folder
chown -R postgres /etc/postgresql/9.4/main/

# Listen on all interfaces
sed -ri "s/^#(listen_addresses\s*=\s*)\S+/\1'*'/" /etc/postgresql/9.4/main/postgresql.conf

sudo service postgresql restart

# Initial database setup
sudo -u postgres psql <<EOF
  \x
  CREATE EXTENSION pgcrypto;
  ALTER USER postgres WITH SUPERUSER PASSWORD 'postgres';
  CREATE USER astromo WITH SUPERUSER PASSWORD 'astromo';
  CREATE DATABASE astromo WITH OWNER astromo TEMPLATE template0 ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
EOF

# Allow login from anywhere
echo "local all all           trust" > /etc/postgresql/9.4/main/pg_hba.conf
echo "host  all all 0.0.0.0/0 md5"  >> /etc/postgresql/9.4/main/pg_hba.conf

sudo service postgresql restart

# Import our seed data
psql -f /vagrant/provisions/packages/postgresql/seed/astromo.sql -d astromo -U postgres
