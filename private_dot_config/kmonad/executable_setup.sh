#!/bin/bash

mkdir -p /etc/kmonad
cp ./kmonad_script_external.sh /etc/kmonad/kmonad_script_external.sh
cp ./kmonadconf-tdagger.kbd /etc/kmonad/kmonadconf-tdagger.kbd
cp ./kmonad.service  /etc/systemd/system/kmonad.service

cp ./kmonad_script_laptop.sh /etc/kmonad/kmonad_script_laptop.sh
cp ./kmonadconf-laptop.kbd /etc/kmonad/kmonadconf-laptop.kbd
cp ./kmonadLaptop.service /etc/systemd/system/kmonadLaptop.service

# cp ./kmonad /usr/local/bin/kmonad
