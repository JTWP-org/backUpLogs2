#!/bin/bash

backUpDir="/home/steam/logs"

    #finding all servers installed 
servers=( $(ls /home/steam/*/PavlovServer.sh | awk -F "\/" '{print "/" $2 "/" $3 "/" $4}' ) )

    #loading webhook variable from .WEBHOOK FILE 
source .WEBHOOK

    #update server
sudo apt-get update

echo """  __ServerStuff__ 
    Uptime: $(uptime -p)
    server updated """ | tee hook
    echo '..............' | tee -a hook 


    #loop for data formating and colection 
for server in "${servers[@]}"
do
        #build files if missing 
    serverFldr=$(echo  ${server} | cut -d/ -f 4-  ) 
    mkdir -p "${backUpDir}/${serverFldr}/Pavlov/Saved/Logs/"

        #gets name for server from Game.ini
    name=$( cat "${server}/Pavlov/Saved/Config/LinuxServer/Game.ini" | grep 'Name' | awk -F "=" '{print $2}' )
    
    echo " Starting backup for logs on server: - ${name} $(date +%x" "%r)" | tee -a hook 


    echo ""
    echo " logs to copy: $(ls ${server}/Pavlov/Saved/Logs/ | grep Pavlov-backup-*.log ) " | tee -a hook 
        #gets all the current log backups in each server dir then move them to dest dir you can change it below 
    ls ${server}/Pavlov/Saved/Logs/ | grep Pavlov-backup-*.log | xargs -I %  mv "${server}/Pavlov/Saved/Logs/%" "${backUpDir}$(echo ${server} | cut -d/ -f 7-)" | tee -a hook 
    echo "Finished with   - ${name}" | tee -a hook 
    echo '..............' | tee -a hook 
done

    #WEBHOOK code sourced from here https://github.com/fieu/discord.sh
./discord.sh --webhook-url "$webhook" --text "$(jq -Rs . <hook | cut -c 2- | rev | cut -c 2- | rev)"   | tee -a hook  