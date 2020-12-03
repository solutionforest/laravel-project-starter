echo "Start first script"
# clone this file to 00-firstscript.sh
#echo new cron into cron file
#install new cron file

# uncomment below script
if [[ $(crontab -l | egrep -v "^(#|$)" | grep -q 'cd /var/www/html/src && php artisan schedule:run >> /dev/null 2>&1'; echo $?) == 1 ]]
then
    $(crontab -l | { cat; echo "* * * * * cd /var/www/html/src && php artisan schedule:run >> /dev/null 2>&1"; } | crontab -)
fi
#crontab -l | { cat; echo "* * * * * cd /var/www/html && php artisan schedule:run >> /dev/null 2>&1"; } | crontab -
/usr/sbin/crond -l 8
#crond restart
