#!/bin/bash

source env/bin/activate

cd /var/lib/jenkins/workspace/django/app

python3 manage.py makemigrations
python3 manage.py migrate 

echo "migrations done"

cd /var/lib/jenkins/workspace/django

#SUDO_ASKPASS=./myaskpass.sh
#chmod +x myaskpass.sh
#export SUDO_ASKPASS

sudo cp -rf gunicorn.socket /etc/systemd/system
sudo cp -rf gunicorn.service /etc/systemd/system

echo "$USER"
echo "$PWD"

 #sudo apt update -y
 sudo apt install gunicorn -y 
 sudo systemctl daemon-reload
 sudo systemctl start gunicorn 
 sudo systemctl enable gunicorn

 echo "gunicorn setup done"
 sudo systemctl status gunicorn
 sudo systemctl restart gunicorn
 echo "gunicorn Done"

