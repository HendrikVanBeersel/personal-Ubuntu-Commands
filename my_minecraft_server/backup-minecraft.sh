screen -S minecraft -X stuff $'say Server will backup in 1 hour.^M'
sleep 30m
screen -S minecraft -X stuff $'say Server will backup in 30 minutes.^M'
sleep 15m
screen -S minecraft -X stuff $'say Server will backup in 15 minutes.^M'
sleep 10m
screen -S minecraft -X stuff $'say Server will backup in 5 minutes.^M'
sleep 4m
screen -S minecraft -X stuff $'say Server will backup in 1 minute.^M'
sleep 30
screen -S minecraft -X stuff $'say Server will backup in 30 seconds.^M'
sleep 30
screen -S minecraft -X stuff $'stop^M'

backupTime=$(date +%Y-%m-%d)

BackupPathworld="backup/minecraft/$backupTime/world.tar.gz"
BackupPathworldNether="backup/minecraft/$backupTime/world_nether.tar.gz"
BackupPathworldTheEnd="backup/minecraft/$backupTime/world_the_end.tar.gz"

mkdir -p /minecraft/backup/$backupTime

sourcePathWorld="minecraft/world"
sourcePathWorldNether="minecraft/world_nether"
sourcePathWorldTheEnd="minecraft/world_the_end"

sleep 60

tar -cvpzf $BackupPathworld $sourcePathWorld 
tar -cvpzf $BackupPathworldNether $sourcePathWorldNether
tar -cvpzf $BackupPathworldTheEnd $sourcePathWorldTheEnd

screen -S minecraft -X stuff $'java -Xms1024M -Xmx3000M -jar paper-1.20.1-83.jar --nogui^M'