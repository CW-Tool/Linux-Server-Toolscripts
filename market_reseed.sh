#!/bin/bash

killall -9 eve-server
killall -9 htop
tmux-killserver
screen -S eve -X quit

echo "Tasks gekillt"

mysql -u user -p'pw' eve < delete_market.sql

echo "Markt geleert"

cd evemu_Crucible/sql/
./evedbtool seed

cd ../..
