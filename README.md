# backUpLogs2
updated 


making the crontab 

this is what will trigger the script as often as u set it 
/etc/cron.d/schedule to set it to go off every day at 8 am run the following cmd 
`crontab -e` 
and add the following at the end of the fle 
`echo "0 8 * * * bash $(pwd)/bkUp.sh`


there are notes in the bash script 
