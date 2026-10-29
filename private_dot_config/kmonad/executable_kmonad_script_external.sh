#!/bin/bash

device="usb-SINO_WEALTH_Gaming_KB-event-kbd"
if [[ -e "/dev/input/by-id/${device}" ]]; then
	kmonad ~/.config/kmonad/kmonadconf-tdagger.kbd
fi
