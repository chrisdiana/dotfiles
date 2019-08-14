#!/bin/sh
df -h | awk '$NF=="/"{printf "Disk:%d/%dGB (%s)\n", $3,$2,$5}'
