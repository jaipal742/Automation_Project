sudo apt update -y
if [ $(sudo dpkg --status apache2 | grep -c "ok installed" ) -eq 0 ];
then
  sudo apt-get install apache2;
else
   echo "apache2 already installed"
fi


if [ $( systemctl status apache2 | grep -c "active (running)" ) -eq 0 ];
then
        sudo systemctl start apache2
else
        echo "apache2 is active running"
fi



if [ $( systemctl is-enabled apache2 | grep -c "enabled" ) -eq 0 ];
then
        sudo systemctl enable apache2
else
        echo "service is enabled apache2"
fi

tar -cf jaipal-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar -C /var/log/apache2 access.log error.log

mv jaipal-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar /tmp

aws s3 cp /tmp/jaipal-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar \
s3://upgrad-jaipal

