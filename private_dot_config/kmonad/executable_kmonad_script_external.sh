#!/bin/bash

device="usb-SINO_WEALTH_Gaming_KB-event-kbd"
if [[ -e "/dev/input/by-id/${device}" ]]; then
	/usr/local/bin/kmonad /etc/kmonad/kmonadconf-tdagger.kbd
fi
