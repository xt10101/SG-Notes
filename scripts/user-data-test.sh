#!/bin/bash

sleep 15
cd ..
cd home/ubuntu/


export DB_HOST=mongodb://10.0.1.37:27017/posts

cd app

node seeds/seed.js

pm2 kill


pm2 start app.js 

#tech503-tom-app-ami-ud-v3
#sudo su - ubu