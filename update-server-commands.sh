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
sed -i 's/\r$//' start-minecraft.sh
sed -i 's/\r$//' stop-minecraft.sh

sed -i 's/\r$//' update.sh

echo "giving execute permissions to scripts"
chmod +x start-minecraft.sh
chmod +x stop-minecraft.sh
chmod +x update.sh

echo "copying files to /usr/local/bin"
cp start-minecraft.sh /usr/local/bin/start-minecraft
cp stop-minecraft.sh /usr/local/bin/stop-minecraft
cp update.sh /usr/local/bin/update

source ~/.bashrc