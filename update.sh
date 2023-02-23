#!/bin/bash
apt update;
update=$?;
apt upgrade -y;
upgrade=$?;
apt dist-upgrade -y;
dist-upgrade=$?;
apt autoremove -y;
remove=$?;
apt autoclean -y;
clean=$?;
updatedb;
search=$?;

rm /root/upgrade.result
echo "last run: " >>/root/upgrade.result
date >>/root/upgrade.result
echo "Results:"  >>/root/upgrade.result
echo "updating the patch list: "  >>/root/upgrade.result
echo $update >>/root/upgrade.result
echo "run the patches: "  >>/root/upgrade.result
echo $upgrade >>/root/upgrade.result
echo "distribution patches: "  >>/root/upgrade.result
echo $dist-upgrade >>/root/upgrade.result
echo "Housekeeping: "  >>/root/upgrade.result
echo "remove old updates: "  >>/root/upgrade.result
echo $remove >>/root/upgrade.result
echo "clean the logs and results: "  >>/root/upgrade.result
echo $clean>>/root/upgrade.result
echo "updating the database: " >>/root/upgrade.result
echo $search >>/root/upgrade.result