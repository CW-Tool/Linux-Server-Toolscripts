#!/bin/bash

day=$(date --rfc-3339 date)
host=$(hostname)

mount -t nfs ip:/dir /mnt
mkdir -p /mnt/srv_backup/${host}/${day}
mysqldump -u user -p'pw' auth > /mnt/srv_backup/${host}/${day}/auth.sql
cp -r /etc /mnt/srv_backup/${host}/${day}/
find /mnt/srv_backup/${host} -mtime +15 -type d -exec rm -rf {} \;
umount /mnt
