#!/bin/bash
sudo systemctl stop packagekit

export DEBIAN_FRONTEND=noninteractive
# update
sudo apt update -y

# upgrade
export DEBIAN_FRONTEND=noninteractive
sudo apt upgrade -y

# install nginx

export DEBIAN_FRONTEND=noninteractive
sudo apt install nginx -y

sudo systemctl restart nginx

# enable nginx
sudo systemctl enable nginx


#get app code github repo 
git clone https://github.com/xt10101/Code-Bank.git
#move the app and delele the old cloned folder
mv Code-Bank/nodejs20-sparta-test-app/app/ ~
rm -rf Code-Bank/





#install verion 20.x
export DEBIAN_FRONTEND=noninteractive
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\ #give operating system a specific verison to install
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y nodejs
cd app
#check version
node -v
#go into the app folder


sudo npm install

#start app as a background process
http://54.171.165.138:3000/;

bg



