#!/bin/bash
# Checking whether script is being run as root
if [[ ${UID} != 0 ]]; then
    echo "
    This script must be run as root or with sudo permissions.
    Please run using sudo.${normal}
    "
    exit 1
fi

echo "copying files to /usr/local/bin"
cp stop-minecraft.sh /usr/local/bin/stop-minecraft
cp start-minecraft.sh /usr/local/bin/start-minecraft
cp backup-minecraft.sh /usr/local/bin/backup-minecraft

cp update-server-commands.sh /usr/local/bin/update-server-commands

