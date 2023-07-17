# BackUpLogs v2

[![N|Solid](https://media.moddb.com/images/members/4/3380/3379652/profile/Discord_button.png)](https://www.jtwp.org)
## [JTWP](https://jtwp.org)


<sub>Script made for the community JTWP (joes toes water park) but open for anyone to use . URL above is a discord redirect </sub>
<hr>

[![N|Solid](https://cdn.discordapp.com/attachments/932110907729920080/1130216713493938187/pvl.jpg)](https://nodesource.com/products/nsolid)

### No more lost logs 
BackUpLogs v2 is made for the game [PavlovVR](https://www.vankrupt.com/) to be used by community servers 



- the game will purge the logs after a few days thats why its important to back them up 

<hr>
### SETTINGS
To change how the script works for you there is variables located on the top of the script it is important to set them b4 you start thhe script the first time 

> **backUpDir**="/home/steam/logs" <br>
    - where to u want the saved files to be placed use full path no ~ <br><br>
**whereIsThisScript**=$(pwd)<br>
    - it will try and get the location on its own if left like this still need to test it but u can just enter where this folder is <br><br>
**webHook**="true"<br>
    - webhook enabled or not (true <> false) <br><br>
**icon**='https://cdn.discordapp.com/attachments/932110907729920080/1130204308315578459/6328646.png'<br>
    - works best if u use a discord url <br><br>
<hr>
### INSTALL

your going to want to go to the DIR where u want the script 

`git clone https://github.com/JTWP-org/backUpLogs2.git`

now we have a clone cd into it with `cd backUpLogs2`

then we need to give it perms to run 

`sudo chmod +x bkUp.sh ; sudo chmod +x discord.sh` 

 The script uses crontab to run on a set timer <br>
-  `crontab -e` <br>
    [this will open a text file where u can input your script and time to wait for help with setting the timer [HERE IS A TOOL](https://crontab.cronhub.io/) <br>
    your going to add your time value the tyype of program it is (bash) then a full path to the script ~ as a sub for /home/steam wont work here <br>
I want mine to run every day at 8 AM so i will use ..
- `echo "0 8 * * * bash /home/steam/code/backupLogs-pub/bkUp.sh`
Now we will need sudo to add some permissions to our scripts 
- `sudo chmod +x `
#### End of script for now 

### CREDIT
<sub>Code i didnt make </sub> 
- [Discord.sh](https://github.com/fieu/discord.sh) 
