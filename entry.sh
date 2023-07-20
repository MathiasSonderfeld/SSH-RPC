#!/bin/sh
chmod 700 /root/.ssh
chmod 600 /root/.ssh/*
chmod +x /root/connectToServer.sh
screen -dmS sshconnect /root/connectToServer.sh
tail -f /dev/null