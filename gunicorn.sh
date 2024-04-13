#!/bin/bash

source env/bin/activate

cd /var/lib/jenkins/workspace/django/app

python3 manage.py makemigrations
python3 manage.py migrate 

echo "migrations done"

cd /var/lib/jenkins/workspace/django

source cp -rf gunicorn.socket /etc/systemd/system
source cp -rf gunicorn.service /etc/systemd/system

echo "$USER"
echo "$PWD"

export SUDO_ASKPASS= ./myaskpass.sh


 echo "Aryan123#" | sudo -S systemctl daemon-reload
 sudo systemctl start gunicorn 
 sudo systemctl enable gunicorn

 echo "gunicorn setup done"
 sudo systemctl status gnicorn
 sudo systemctl restart gnicorn
