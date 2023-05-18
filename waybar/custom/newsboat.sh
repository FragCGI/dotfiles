#!/bin/sh

for (( ; ; ))
do
  newsboat -x print-unread | cut -c 1-2
  sleep 1
done
