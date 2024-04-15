#!/bin/bash 

sudo cp -rf app.conf /etc/nginx/conf.d 
chmod 710 /var/lib/jenkins/workspace/django

sudo nginx -t

#sudo apt update -y
#sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "NGINX READY"
sudo systemctl restart nginx  
sudo systemctl status nginx
echo "Done"
