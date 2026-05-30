#!/usr/bin/bash

# set -xe

# https://your-server,com/rest/getPlaylists?u=<USERNAME>&p=<PASSWORD>&c=my-script&f=json&v=1.15.0
url="http://localhost:4533/rest/getPlaylists?u=admin&p=39AfrWymrD6Fiqwy&c=my-script&f=json&v=1.15.0"
curl -s $url | jq -r '.["subsonic-response"].playlists.playlist[] | .id + " \"" + .name + "\""' | while IFS= read -r id name; do
   # navidrome pls -p $id -o ${name}.m3u
   echo $id - ${name}.m3u
done
