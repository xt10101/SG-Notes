#!/bin/bash

sleep 15
cd ..
cd home/ubuntu/


export DB_HOST=mongodb://3.254.123.253:27017/posts

cd app

node seeds/seed.js

pm2 kill


pm2 start app.js 

#tech503-tom-app-ami-ud-v3
#sudo su - ubu