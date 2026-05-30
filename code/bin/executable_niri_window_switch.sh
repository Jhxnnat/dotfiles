#!/bin/sh

# selected=$(niri msg --json windows | jq '.[].title' | fuzzel --dmenu)
# notify-send "$selected" -t 5000
# niri msg action focus-window "$selected"

window_list=$(niri msg --json windows)
name=$(echo $window_list | jq -r '.[] | ."title"' | fuzzel --dmenu)
id=$(echo $window_list | jq -r '.[] | ."title", ."id"' | grep "$name" -x -A 1 | grep "$name" -vx)

echo $id
echo $name

niri msg action focus-window --id $id

