#!/bin/bash

# Activate the virtual environment
source env/bin/activate

# Navigate to the Django app directory
cd /var/lib/jenkins/workspace/django/app

# Apply Django migrations
python3 manage.py makemigrations
python3 manage.py migrate 

echo "Migrations done"

# Copy gunicorn socket and service files to systemd directory
cp -rf gunicorn.socket /etc/systemd/system
cp -rf gunicorn.service /etc/systemd/system

echo "$USER"
echo "$PWD"

# Set SUDO_ASKPASS environment variable
SUDO_ASKPASS=./myaskpass.sh
export SUDO_ASKPASS

# Reload systemd daemon to pick up the changes
echo "Aryan123#" | sudo -A systemctl daemon-reload

# Start and enable gunicorn service
sudo -A systemctl start gunicorn 
sudo -A systemctl enable gunicorn

echo "Gunicorn setup done"

# Check gunicorn service status
sudo -A systemctl status gunicorn

# Restart gunicorn service
sudo -A systemctl restart gunicorn
