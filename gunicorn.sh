#!/bin/bash

source env/bin/activate

cd /var/lib/jenkins/workspace/django/app

python3 manage.py makemigrations
python3 manage.py migrate 

echo "migrations done"

cd /var/lib/jenkins/workspace/django

cp -rf gunicorn.socket /etc/systemd/system
cp -rf gunicorn.service /etc/systemd/system

echo "$USER"
echo "$PWD"

SUDO_ASKPASS=./myaskpass.sh
chmod +x myaskpass.sh
export SUDO_ASKPASS


 sudo -A systemctl daemon-reload
 sudo -A systemctl start gunicorn 
 sudo -A systemctl enable gunicorn

 echo "gunicorn setup done"
 sudo -A systemctl status gnicorn
 sudo -A systemctl restart gnicorn

