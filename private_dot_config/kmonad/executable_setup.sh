#!/bin/bash

set -ex

cp ./kmonad.service  ~/.config/systemd/user/kmonad.service
cp ./kmonadExternal.service ~/.config/systemd/user/kmonadExternal.service

