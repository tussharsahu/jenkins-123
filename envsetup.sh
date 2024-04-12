#!/bin/bash

if [-d "env"]
then 
  echo "python venv exists"
else 
  python3 -m venv env 
fi
echo $PWD
source env/bin/activate

pip3 install -r requirements.txt 

if [-d "logs"]
then 
  echo "logs folder exists"
else 
  mkdir logs 
  touch logs/error.logs logs/access.log  
fi
sudo chmod -R 777 logs
echo "envsetup finishes"