#!/bin/bash


# update
sudo apt-get update -y

# upgrade

sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# install MongoDB (https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/)


# install gnupg (anti tamper, can tell if someone has changed somthing) and curl
sudo DEBIAN_FRONTEND=noninteractive apt-get install gnupg curl -y


# Add the GPG Key

curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
    sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor


#Create sources list File tells it about new packages and which version to get
#add more 

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list


# Update the package list again
sudo apt-get update -y


# install MongoDB

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6

#check is mongo is installed
sudo systemctl status mongod
#change configuration who can connect to the database change to 0.0.0.0
sudo nano /etc/mongod.conf


#Change the BindIp line to 0.0.0.0 (from 127.0.0.1)


#start mongod
sudo systemctl start mongod
#start check
sudo systemctl status mongod
 

#other app


export DB_HOST=mongodb://3.252.157.239:27017/posts
cd app
sudo npm install

node seeds/seed.js
pm2 start app.js


