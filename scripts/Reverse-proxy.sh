#!/bin/bash
sudo systemctl stop packagekit


# update
sudo apt-get update -y

# upgrade

sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# install nginx


sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y

sudo systemctl restart nginx

# enable nginx
sudo systemctl enable nginx



#replace uri linbe with proxy pass line
sudo sed -i 's#try_files $uri $uri/ =404#proxy_pass http://localhost:3000#' /etc/nginx/sites-available/default
#sudo sed -i '51c\proxy_pass http://127.0.0.1:3000;' /etc/nginx/sites-available/default
sudo systemctl restart nginx


#get app code github repo 
git clone https://github.com/xt10101/Code-Bank.git
#move the app and delele the old cloned folder
mv Code-Bank/nodejs20-sparta-test-app/app/ ~
rm -rf Code-Bank/





#install verion 20.x

DEBIAN_FRONTEND=noninteractive curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\ #give operating system a specific verison to install

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
cd app
#check version
node -v
#go into the app folder


sudo npm install

#start app as a background process
# npm start app.js &
#bg



sudo DEBIAN_FRONTEND=noninteractive npm install pm2 -g

# kill any running node processes that could interfere
pm2 kill

# run the app with pm2 (runs in background by default)
pm2 start app.js 


pm2 startup #keep your app running after a server restart




