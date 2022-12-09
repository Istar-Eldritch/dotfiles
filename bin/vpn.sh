#!/bin/bash

set -e

if [[ $# -ne 3 ]]
then
  echo "Usage: vpn [network] [username] [password]";
  exit 1;
fi

osascript -e "tell application \"/Applications/Tunnelblick.app\"" \
          -e "delete all credentials for \"$1\"" \
          -e "save username \"$2\" for \"$1\"" \
          -e "save password \"$3\" for \"$1\"" \
          -e "connect \"$1\"" \
          -e "end tell" > /dev/null

state=$(osascript -e "tell application \"/Applications/Tunnelblick.app\"" -e "get state of first configuration where name = \"$1\"" -e "end tell")

while [ "$state" = "GET_CONFIG" ] || [ "$state" = "WAIT" ] || [ "$state" = "AUTH" ]
do
  state=$(osascript -e "tell application \"/Applications/Tunnelblick.app\"" -e "get state of first configuration where name = \"$1\"" -e "end tell")
  sleep 1
done

osascript -e "tell application \"/Applications/Tunnelblick.app\"" \
          -e "delete all credentials for \"$1\"" \
          -e "end tell" > /dev/null
echo $state
