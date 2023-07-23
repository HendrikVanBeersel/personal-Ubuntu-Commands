
cd minecraft
echo "starting minecraft server..."
screen -S minecraft -d -m
screen -S minecraft -X stuff $'java -Xms1024M -Xmx3000M -jar paper-1.20.1-95.jar --nogui^M'
sleep 60
echo "minecraft server started"