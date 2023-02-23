#!/bin/bash

screen -S eve \
tmux new-session \; \
send-keys 'htop' C-m \; \
split-window -v \; \
send-keys 'cd /home/$USER/evemu_Crucible/build/dist/bin && ./eve-server' C-m \; \
split-window -h \;
