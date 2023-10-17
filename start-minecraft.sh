#!/bin/bash
cd  /home/main/Documents/main/Minecraft
echo "starting minecraft server..."
screen -S minecraft  -d -m java -Xms1024M -Xmx4000M -jar paper-1.20.1-95.jar --nogui 
