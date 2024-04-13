#!/bin/bash

source env/bin/activate

cd /var/lib/jenkins/workspace/django/app

python3 manage.py makemigrations
python3 manage.py migrate 

echo "migrations done"

cd /var/lib/jenkins/workspace/django

SUDO_ASKPASS=./myaskpass.sh
chmod +x myaskpass.sh
export SUDO_ASKPASS

sudo -S cp -rf gunicorn.socket /etc/systemd/system
sudo -S cp -rf gunicorn.service /etc/systemd/system

echo "$USER"
echo "$PWD"

 sudo -S systemctl daemon-reload
 sudo -S systemctl start gunicorn 
 sudo -S systemctl enable gunicorn

 echo "gunicorn setup done"
 sudo -S systemctl status gnicorn
 sudo -S systemctl restart gnicorn

