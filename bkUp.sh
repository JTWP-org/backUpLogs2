#!/bin/bash

##################################

backUpDir="/home/steam/logs"
whereIsThisScript="/home/steam/backUpLogs2"
webHook="true"
enableUserActionLogWebhook="true"  # Toggle this boolean to enable/disable user action log webhook

# Works best if you use a Discord URL
icon='https://cdn.discordapp.com/attachments/932110907729920080/1130204308315578459/6328646.png'

# Finding all servers installed
servers=( $(ls /home/steam/*/PavlovServer.sh | awk -F "/" '{print "/" $2 "/" $3 "/" $4}') )

# Loading webhook variable from .WEBHOOK FILE
source .WEBHOOK

# Update server
sudo apt-get update
echo "  __ServerStuff__
    Uptime: $(uptime -p)
    server updated " | tee hook
echo '..............' | tee -a hook

# Loop for data formatting and collection
for server in "${servers[@]}"
do
    serverFldr=$(echo ${server} | cut -d/ -f 4-)
    echo ""
    echo ""
    echo 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx START SERVER xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' | tee -a hook
    name=$(cat "${server}/Pavlov/Saved/Config/LinuxServer/Game.ini" | grep 'Name' | awk -F "=" '{print $2}')

    # Check if the log file exists for the server
    if [[ -e "/home/steam/${serverFldr}/Pavlov/Saved/Logs/Pavlov.log" ]]; then
        # If the log file exists, check if 'SERVER BUILD' is found in the log
        if grep -q 'SERVER BUILD' "/home/steam/${serverFldr}/Pavlov/Saved/Logs/Pavlov.log"; then
            # If 'SERVER BUILD' is found in the log file
            vers="SHACK SERVER - "
            echo "the \"${name}\" is located on server in the /home/steam/${server} and is a ${vers}" | tee -a hook
            ~/Steam/steamcmd.sh +force_install_dir "/home/steam/${serverFldr}" +login anonymous +app_update 622970 -beta shack +exit | tee -a hook
        else
            # If 'SERVER BUILD' is not found in the log file
            vers="PCVR SERVER -  "
            echo "${name} is located on server in the /home/steam/${server} and is a ${vers}" | tee -a hook
            ~/Steam/steamcmd.sh +force_install_dir "/home/steam/${serverFldr}" +login anonymous +app_update 622970 -beta default +exit | tee -a hook
        fi
        # Build files if missing
        mkdir -p "${backUpDir}/${serverFldr}/Pavlov/Saved/Logs/"
        mkdir -p "${backUpDir}/${serverFldr}/Pavlov/Saved/Stats/"
        printf " Starting backup for logs on server:
          ${name}
           $(date +%x ' ' %r)
         " | tee -a hook

        echo ""
        printf " \`logs to copy: $(ls ${server}/Pavlov/Saved/Logs/ | grep Pavlov-backup-* )\` " | tee -a hook
        echo "" | tee -a hook
        # Gets all the current log backups in each server dir then move them to dest dir
        ls ${server}/Pavlov/Saved/Logs/ | grep Pavlov-backup* | xargs -I % mv "${server}/Pavlov/Saved/Logs/%" "${backUpDir}$(echo ${server} | cut -d/ -f 7-)" | tee -a hook
        echo ""
        printf " \`logs to copy: $(ls ${server}/Pavlov/Saved/Stats/)\` " | tee -a hook
        echo "" | tee -a hook
        # Gets all the current log backups in each server dir then move them to dest dir
        ls ${server}/Pavlov/Saved/Stats/ | xargs -I % mv "${server}/Pavlov/Saved/Stats/%" "${backUpDir}$(echo ${server} | cut -d/ -f 7-)" | tee -a hook

    else
        # If the log file does not exist for the server
        echo "Error: Log file not found for server ${serverFldr}. Skipping server update." | tee -a hook
    fi

    echo 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx END SERVER xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' | tee -a hook
    echo "" | tee -a hook
    echo "" | tee -a hook
    echo
done

current_date=$(date +%Y-%m-%d)
filename="${current_date}.log"
cp hook $filename
filename0="${current_date}-admin-jb.log"
cp "/home/steam/pavlov-bot2/user_action_log.txt" "${filename0}"
filename1="${current_date}-admin-jtwp.log"
cp "/home/steam/pavlov-bot/user_action_log.txt" "${filename1}"


bash "${whereIsThisScript}/discord.sh" --webhook-url "$webhook" --title "SERVER LOG BACKUP BOT \n Bot by JTWP" --thumbnail "${icon} " --text "this script can be found at [GITHUB](https://github.com/JTWP-org/backUpLogs2) " --url "http://JTWP.org" --description "its a server log / stats backup sscript that will aslo update your pavlov servers shack / pc it will detect what the server is  update the main server  and make your coffee" | tee -a hook
bash "${whereIsThisScript}/discord.sh"  --webhook-url="$webhook"   --file "$filename"   --text "here is a log for daily backups"

if [ "$webHook" = "true" ] && [ "$enableUserActionLogWebhook" = "true" ]; then
    # WEBHOOK code sourced from here https://github.com/fieu/discord.sh
    bash "${whereIsThisScript}/discord.sh"  --webhook-url="$webhook"   --file "$filename0"   --text "Pavlov-bot activity log JB server"
    bash "${whereIsThisScript}/discord.sh"  --webhook-url="$webhook"   --file "$filename1"   --text "Pavlov-bot activity log JTWP server"
fi

echo "" > hook
