#!/bin/bash

cd /etc/yum.repos.d/
sudo sed -i s/192.168.1.15/192.168.1.199/g *
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exit
