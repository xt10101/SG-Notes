#!/bin/bash
sudo systemctl stop packagekit


# update
sudo apt update -y

# upgrade

DEBIAN_FRONTEND=noninteractive sudo apt upgrade -y

# install nginx


DEBIAN_FRONTEND=noninteractive sudo apt install nginx -y

sudo systemctl restart nginx

# enable nginx
sudo systemctl enable nginx

sudo sed -i 's#try_files $uri $uri/ =404#proxy_pass http://localhost:3000#' /etc/nginx/sites-available/default
 
sudo systemctl restart nginx


#get app code github repo 
git clone https://github.com/xt10101/Code-Bank.git
#move the app and delele the old cloned folder
mv Code-Bank/nodejs20-sparta-test-app/app/ ~
rm -rf Code-Bank/





#install verion 20.x

DEBIAN_FRONTEND=noninteractive curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\ #give operating system a specific verison to install

DEBIAN_FRONTEND=noninteractive sudo apt-get install -y nodejs
cd app
#check version
node -v
#go into the app folder


sudo npm install

#start app as a background process
nohup npm start app.js &
bg




