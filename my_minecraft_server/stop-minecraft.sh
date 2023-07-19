screen -S minecraft -X stuff $'stop^M'
echo "stopping minecraft server..."
sleep 60
screen -X -S minecraft quit
echo "minecraft server stopped"
