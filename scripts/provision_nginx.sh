#!/bin/bash

# update
sudo apt update -y

# upgrade
sudo apt upgrade -y

#install nginx activate config changes
sudo apt install nginx -y

#Restart
sudo systemctl restart nginx
#enable nginx
sudo systemctl enable nginx






sudo systemctl restart nginx