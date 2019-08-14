#!/bin/sh
ps -A -o %cpu | awk '{ cpu += $1 } END {print int(cpu/400*100)"%" }'
