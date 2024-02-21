# BackUpLogs v2

[![JTWP](https://media.moddb.com/images/members/4/3380/3379652/profile/Discord_button.png)](https://www.jtwp.org)

*Script made for the community JTWP (Joes Toes Water Park) but open for anyone to use. The URL above is a Discord redirect.*

---

[![PavlovVR](https://cdn.discordapp.com/attachments/932110907729920080/1130216713493938187/pvl.jpg)](https://nodesource.com/products/nsolid)

### No More Lost Logs

BackUpLogs v2 is designed for the game [PavlovVR](https://www.vankrupt.com/) and is used by community servers.

- The game purges logs after a few days, making it important to back them up.

---

### SETTINGS

To tailor the script to your needs, modify the variables in the `Settings.sh` file. It's important to set these before running the script for the first time:

- **backUpDir**="/home/steam/logs"  
  Where you want the saved files to be placed (use full path, no `~`).

- **whereIsThisScript**=""  
  The installation location of this script.

- **webHook**="true"  
  Enable or disable the webhook (true or false).

- **icon**='https://cdn.discordapp.com/attachments/932110907729920080/1130204308315578459/6328646.png'  
  Ideally, use a Discord URL.

---
I see the issue now. Let's format the installation instructions correctly for the README.md file on GitHub. When you write it on GitHub, you need to ensure that the code blocks are correctly formatted with triple backticks (```). Here's how you should format it:

markdown

## INSTALLATION INSTRUCTIONS

### Step 1: Clone the Repository
First, navigate to the directory where you want the script to be located. Then, use the following command to clone the repository:

git clone https://github.com/JTWP-org/backUpLogs2.git

csharp


### Step 2: Change Directory
After cloning, change into the new directory:

cd backUpLogs2

mathematica


### Step 3: Set Permissions
Set execute permissions for the scripts:

sudo chmod +x bkUp.sh discord.sh

vbnet


### Step 4: Schedule with Crontab
The script is designed to run at a set interval using crontab. To edit your crontab configuration:

crontab -e

vbnet

This opens a text editor where you can input your script and the timing for execution. For help with setting the timer, you can use an online crontab tool. The `~` shortcut for the home directory does not work in the crontab file, so you need to use absolute paths.

For example, to run the script every day at 8 AM, add the following line to your crontab:

0 8 * * * bash /absolute/path/to/backUpLogs2/bkUp.sh

vbnet

Replace `/absolute/path/to/backUpLogs2/` with the full path to where `bkUp.sh` is locate
