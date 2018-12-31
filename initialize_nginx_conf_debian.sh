echo "Enter conf name you want generate"
read name
sudo touch /etc/nginx/sites-enabled/$name
echo "Enter the domain or IP your want your conf use"
read ip
echo "Enter the html root dir you want your conf use (usually /var/www/your_domain_name"
read dir
sudo echo "server {
    listen 80;

    root /var/www/$dir;
    index index.nginx-debian.html index.php index.html index.htm;

    server_name $ip;

    location / {
        try_files $uri $uri/ =404;
    }
}" > /etc/nginx/sites-enabled/$name
sudo service nginx restart
echo "All Done!"
