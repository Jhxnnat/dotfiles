#!/bin/bash

mkdir -p /etc/kmonad
cp ./kmonad_script_external.sh /etc/kmonad/kmonad_script_external.sh
cp ./kmonadconf-tdagger.kbd /etc/kmonad/kmonadconf-tdagger.kbd
cp ./kmonad.service  /etc/systemd/system/kmonad.service
cp ./kmonad /usr/local/bin/kmonad

