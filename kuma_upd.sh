#!/bin/bash

read -p "Version angeben: " version

cd /root/uptime-kuma

# Update from git
git fetch --all
git checkout ${version} --force

# Install dependenies and prebuilt
npm ci --production
npm run download-dist
npm audit fix --force
npm install -g npm


# Restart
#pm2 restart uptime-kuma
systemctl restart pm2-root.service
