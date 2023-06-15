#!/bin/bash

#zurückgehaltene pakete anzeigen und freigeben.
#apt-mark showhold
#apt-mark unhold paket
#alt: apt-mark showhold | xargs apt-mark unhold
dpkg --get-selections | grep hold | awk '{ print $1, "install" }' | dpkg --set-selections

apt update && apt full-upgrade
apt --purge autoremove
cp -v /etc/apt/sources.list /opt/sources.list.bak
sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list
apt update
apt upgrade --without-new-pkgs
apt full-upgrade
apt --purge autoremove
cat /etc/debian_version
cat /etc/os-release
lsb_release -a
