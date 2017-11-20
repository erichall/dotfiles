#!/usr/bin/env bash

# increase notify users
sudo /usr/bin/sysctl -p --system

# restart watchman server
watchman shutdown-server
dunstify  'just shut down server' ''

# start android emulator
i3-msg workspace 5 && sleep 1 && /home/erkan/Android/Sdk/tools/emulator -avd Nexus_5X_API_25

# open atom in react project folder
i3-msg workspace 7 && sleep 1 && atom Desktop/react-native-projects/

