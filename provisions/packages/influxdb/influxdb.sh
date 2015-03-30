#!/usr/bin/env bash

wget http://get.influxdb.org/influxdb_0.9.0-rc17_amd64.deb
dpkg -i influxdb_0.9.0-rc17_amd64.deb
service influxdb restart