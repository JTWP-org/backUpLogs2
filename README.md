<!DOCTYPE html>
<html>
<head>
    <title>BackUpLogs v2</title>
</head>
<body>

    <h1>BackUpLogs v2</h1>

    <a href="https://www.jtwp.org">
        <img src="https://media.moddb.com/images/members/4/3380/3379652/profile/Discord_button.png" alt="N|Solid">
    </a>
    <h2><a href="https://jtwp.org">JTWP</a></h2>

    <sub>Script made for the community JTWP (joes toes water park) but open for anyone to use. URL above is a discord redirect</sub>
    <hr>

    <a href="https://nodesource.com/products/nsolid">
        <img src="https://cdn.discordapp.com/attachments/932110907729920080/1130216713493938187/pvl.jpg" alt="N|Solid">
    </a>

    <h3>No more lost logs</h3>
    <p>BackUpLogs v2 is made for the game <a href="https://www.vankrupt.com/">PavlovVR</a> to be used by community servers</p>

    <ul>
        <li>the game will purge the logs after a few days that's why it's important to back them up</li>
    </ul>

    <hr>
    <h3>SETTINGS</h3>
    <p>To change how the script works for you there are variables located in the file Settings.sh. It is important to set them before you start the script the first time.</p>

    <blockquote>
        <strong>backUpDir</strong>="/home/steam/logs" <br>
        - where to you want the saved files to be placed use full path no ~ <br><br>
        <strong>whereIsThisScript</strong>=""<br>
        - WHERE IS THIS SCRIPT INSTALLED  <br><br>
        <strong>webHook</strong>="true"<br>
        - webhook enabled or not (true <> false) <br><br>
        <strong>icon</strong>='https://cdn.discordapp.com/attachments/932110907729920080/1130204308315578459/6328646.png'<br>
        - works best if you use a discord url <br><br>
    </blockquote>

    <hr>
    <h2>INSTALLATION INSTRUCTIONS</h2>
    <hr>

    <p>
        <strong>Step 1:</strong> Clone the Repository<br>
        First, navigate to the directory where you want the script to be located. Then, use the following command to clone the repository:
        <pre><code>git clone https://github.com/JTWP-org/backUpLogs2.git</code></pre>
    </p>

    <p>
        <strong>Step 2:</strong> Change Directory<br>
        After cloning, change into the new directory:
        <pre><code>cd backUpLogs2</code></pre>
    </p>

    <p>
        <strong>Step 3:</strong> Set Permissions<br>
        Set execute permissions for the scripts:
        <pre><code>sudo chmod +x bkUp.sh discord.sh</code></pre>
    </p>

    <p>
        <strong>Step 4:</strong> Schedule with Crontab<br>
        The script is designed to run at a set interval using crontab. To edit your crontab configuration:
        <pre><code>crontab -e</code></pre>
        This opens a text editor where you can input your script and the timing for execution. For help with setting the timer, you can use an online crontab tool. The ~ shortcut for the home directory does not work in the crontab file, so you need to use absolute paths.
        For example, to run the script every day at 8 AM, add the following line to your crontab:
        <pre><code>0 8 * * * bash /absolute/path/to/backUpLogs2/bkUp.sh</code></pre>
        Replace /absolute/path/to/backUpLogs2/ with the full path to where bkUp.sh is located on your system.
    </p>

    <hr>
    <p>
        <strong>Credits and Acknowledgments</strong><br>
        Credit for parts of this code goes to external sources, especially for the discord.sh script.
    </p>

</body>
</html>
