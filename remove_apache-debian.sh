sudo apt purge apache
sudo apt autoremove
sudo apt purge libapache2-mod-php5 libapache2-mod-php7.0
sudo find /etc -name "*apache*" | xargs rm -rf
sudo rm -rf /var/www 
echo "All Done!"
