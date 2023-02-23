#!/bin/bash

path=/home/$USER/evemu_Crucible

killall -9 eve-server
killall -9 htop
tmux kill-server
screen -S eve -X quit

echo "Tasks gekillt"

cd ${path}
git pull origin
git checkout staging
cd build
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=dist ..
make -j $(nproc)
make install
cd ../sql
./evedbtool up
cd ../..

./eve.sh
