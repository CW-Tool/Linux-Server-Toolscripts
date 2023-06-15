#!/bin/bash

apt list '?narrow(?installed, ?not(?origin(Debian)))'
apt-forktracer | sort
