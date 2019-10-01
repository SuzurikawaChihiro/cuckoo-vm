#!/bin/sh

# debug cuckoo
cuckoo -d

# copy agent.py
cp ~/.cuckoo/agent/agent.py .

# Install vagrant
sudo apt install vagrant -y
# ubuntuが最小構成だった場合はrubyがないので要インストール
sudo apt install ruby -y
# Requirements
sudo gem install winrm
sudo gem install winrm-elevated

# Download Python2.7.msi
wget -O "py27.msi" "https://www.python.org/ftp/python/2.7.16/python-2.7.16.msi"

#set-up
vagrant up

#snapshot
vagrant snapshot save origin-win7

# change hierarchy
cd ..

# cp conf
cp -f cuckoo-vm/reporting.conf ~/.cuckoo/conf
cp -f cuckoo-vm/virtualbox.conf ~/.cuckoo/conf
