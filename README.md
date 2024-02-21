
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

## INSTALLATION INSTRUCTIONS

### Step 1: Clone the Repository

Navigate to the directory where you want the script to be located and clone the repository:

```bash
git clone https://github.com/JTWP-org/backUpLogs2.git
```

### Step 2: Change Directory

Change into the newly cloned directory:

```bash
cd backUpLogs2
```

### Step 3: Set Permissions

Give execute permissions to the scripts:

```bash
sudo chmod +x bkUp.sh discord.sh
```

### Step 4: Schedule with Crontab

The script is set to run at specified intervals using crontab. To edit your crontab configuration:

```bash
crontab -e
```

This command opens a text editor for the crontab file. Note: Use absolute paths as the `~` shortcut does not work here.

To run the script every day at 8 AM, for example, add the following line:

```bash
0 8 * * * bash /absolute/path/to/backUpLogs2/bkUp.sh
```

Replace `/absolute/path/to/backUpLogs2/` with the full path to where `bkUp.sh` is located.

---

### Credits and Acknowledgments

Credit for portions of this code, including the `discord.sh` script, goes to [external sources.](https://github.com/fieu/discord.sh)https://github.com/fieu/discord.sh
