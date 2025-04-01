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


#change configuration who can connect to the database change to 0.0.0.0
sudo sed -i 's#127.0.0.1#0.0.0.0#' /etc/mongod.conf
#Change the BindIp line to 0.0.0.0 (from 127.0.0.1)


#start mongod
sudo systemctl enable mongod
sudo systemctl start mongod
#start check


 

#other app



