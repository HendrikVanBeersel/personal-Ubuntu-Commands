#!/bin/bash
# Checking whether script is being run as root
if [[ ${UID} != 0 ]]; then
    echo "
    This script must be run as root or with sudo permissions.
    Please run using sudo.${normal}
    "
    exit 1
fi
echo "removing windows line endings"
sed -i 's/\r$//' stop-minecraft.sh
sed -i 's/\r$//' start-minecraft.sh
sed -i 's/\r$//' backup-minecraft.sh
sed -i 's/\r$//' update-server-commands.sh

echo "giving execute permissions to scripts"
chmod +x stop-minecraft.sh
chmod +x start-minecraft.sh
chmod +x backup-minecraft.sh
chmod +x update-server-commands.sh

echo "copying files to /usr/local/bin"
cp stop-minecraft.sh /usr/local/bin/stop-minecraft
cp start-minecraft.sh /usr/local/bin/start-minecraft
cp backup-minecraft.sh /usr/local/bin/backup-minecraft
cp update-server-commands.sh /usr/local/bin/update-server-commands

source ~/.bashrc