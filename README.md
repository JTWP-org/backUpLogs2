# BackUpLogs v2
## [JTWP](https://jtwp.org)
<hr>

[![N|Solid](https://cdn.discordapp.com/attachments/932110907729920080/1130216713493938187/pvl.jpg)](https://nodesource.com/products/nsolid)


BackUpLogs v2 is made for the game [PavlovVR](https://www.vankrupt.com/) to be used by community servers 

# backUpLogs2
updated 


making the crontab 

this is what will trigger the script as often as u set it 
/etc/cron.d/schedule to set it to go off every day at 8 am run the following cmd <br><hr><br>
`crontab -e` 
<br><hr><br>
and add the following at the end of the fle 
<br><hr><br>`echo "0 8 * * * bash $(pwd)/bkUp.sh`<br><hr><br>


there are notes in the bash script 
