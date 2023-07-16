#!/bin/bash

##################################

backUpDir="/home/steam/logs"

whereIsThisScript="/home/steam/code/backupLogs/"

webHook="true"

    #works best if u use a discord url 
icon="https://cdn.discordapp.com/attachments/932110907729920080/1130204308315578459/6328646.png"

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
    
     printf '%s\n' """ Starting backup for logs on server: 
      **${name}** 
       *$(date +%x" "%r)*  
     """ | tee -a hook 


    echo ""
    printf '%s\n' " \`logs to copy: $(ls ${server}/Pavlov/Saved/Logs/ | grep Pavlov-backup-* )\` " | tee -a hook 
        #gets all the current log backups in each server dir then move them to dest dir you can change it below 
    ls ${server}/Pavlov/Saved/Logs/ | grep Pavlov-backup* | xargs -I %  mv "${server}/Pavlov/Saved/Logs/%" "${backUpDir}$(echo ${server} | cut -d/ -f 7-)" | tee -a hook 
    echo "Finished with   - ${name}" | tee -a hook 
    echo '..............' | tee -a hook 
done

https://cdn.discordapp.com/attachments/932110907729920080/1130204308315578459/6328646.png

if [ "$webHook" = "true" ]; then
        #WEBHOOK code sourced from here https://github.com/fieu/discord.sh
    bash "${whereIsThisScript}discord.sh" --webhook-url "$webhook" --title "SERVER LOG BACKUP BOT \n Bot by JTWP" --thumbnail "${icon} " --text "this script can be found at [GITHUB](https://github.com/JTWP-org/backUpLogs2) " --url "http://JTWP.org" --description "$(jq -Rs . <hook | cut -c 2- | rev | cut -c 2- | rev)"   | tee -a hook  
fi



echo "" > hook