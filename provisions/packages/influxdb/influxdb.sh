#!/usr/bin/env bash

wget http://get.influxdb.org/influxdb_0.9.0-rc17_amd64.deb
dpkg -i influxdb_0.9.0-rc17_amd64.deb
service influxdb restart

sleep 2
echo "creating database"
curl -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE test"