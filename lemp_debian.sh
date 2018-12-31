echo "LEMP Debian One-click Script v1.0"
sudo apt update
sudo apt install -y nginx php php-fpm php-mysql mysql-server
echo "Essentials of LEMP Installation Finished, Creating Initial Configuration File for NGINX"
sudo rm /etc/nginx/sites-enabled/default
sudo touch /etc/nginx/sites-enabled/default
sudo echo "server {
    listen 80;

    root /var/www/html;
    index index.nginx-debian.html index.php index.html index.htm;

    server_name _;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }
}
" > /etc/nginx/sites-enabled/default
echo "Creating Test PHP File"
sudo rm /var/www/html/index.nginx-debian.html
sudo touch /var/www/html/index.php
sudo echo "<php? phpinfo(); ?>" >  /var/www/html/index.php
echo "MYSQL INSTALLATION BEGIN"
echo "Please Follow The Instructions Of MySQL Installation"
sudo mysql_secure_installation
echo "Refresh Services"
sudo service nginx restart
sudo service php7.0-fpm restart
echo "Server Status"
sudo systemctl status nginx
sudo systemctl status php7.0-fpm
echo "All Done. Thanks For Using"

