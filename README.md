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
To change how the script works for you there is variables located in the file Settings.sh it is important to set them b4 you start thhe script the first time 

> **backUpDir**="/home/steam/logs" <br>
    - where to u want the saved files to be placed use full path no ~ <br><br>
**whereIsThisScript**=$(pwd)<br>
    - it will try and get the location on its own if left like this still need to test it but u can just enter where this folder is <br><br>
**webHook**="true"<br>
    - webhook enabled or not (true <> false) <br><br>
**icon**='https://cdn.discordapp.com/attachments/932110907729920080/1130204308315578459/6328646.png'<br>
    - works best if u use a discord url <br><br>
<hr>
Sure, I can help clarify and fix the installation instructions for your script. Here's a revised version:
INSTALLATION INSTRUCTIONS
Step 1: Clone the Repository

First, navigate to the directory where you want the script to be located. Then, use the following command to clone the repository:

bash

git clone https://github.com/JTWP-org/backUpLogs2.git

Step 2: Change Directory

After cloning, change into the new directory:

bash

cd backUpLogs2

Step 3: Set Permissions

Set execute permissions for the scripts:

bash

sudo chmod +x bkUp.sh discord.sh

Step 4: Schedule with Crontab

The script is designed to run at a set interval using crontab. To edit your crontab configuration:

bash

crontab -e

This opens a text editor where you can input your script and the timing for execution. Note: For help with setting the timer, you can use an online crontab tool. The ~ shortcut for the home directory does not work in the crontab file, so you need to use absolute paths.

For example, to run the script every day at 8 AM, add the following line to your crontab:

bash

0 8 * * * bash /absolute/path/to/backUpLogs2/bkUp.sh

Replace /absolute/path/to/backUpLogs2/ with the full path to where bkUp.sh is located on your system.
Credits and Acknowledgments

Credit for parts of this code goes to external sources, especially for the discord.sh script.
