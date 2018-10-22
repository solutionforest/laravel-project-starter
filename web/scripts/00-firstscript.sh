echo "Start first script"
# clone this file to 00-firstscript.sh
#echo new cron into cron file
#install new cron file

# uncomment below script
crontab -l | { cat; echo "* * * * * cd /var/www/html/src && php artisan schedule:run >> /dev/null 2>&1"; } | crontab -