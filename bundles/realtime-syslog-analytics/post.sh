#!/bin/bash

. /usr/share/conjure-up/hooklib/common.sh

zeppelin_address=$(unitAddress spark 0)
zeppelin_status=$(unitStatus spark 0)
debug bigdata "(post) checking for zeppelin $zeppelin_address/$zeppelin_status"
if [ $zeppelin_address != "null" ] && [ $zeppelin_status == "active" ]; then
    juju expose zeppelin
    exposeResult "Zeppelin Web Interface: http://$zeppelin_address:9090" 0 "true"
    exit 0
else
    exposeResult "Waiting for Zeppelin interface to become ready..." 1 "false"
    exit 0
fi
