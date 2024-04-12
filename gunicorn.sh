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

 systemctl daemon-reload 
 systemctl start gunicorn 
 systemctl enable gunicorn

echo "gunicorn setup done"
 systemctl status gnicorn
 systemctl restart gnicorn
