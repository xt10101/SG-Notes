#!/bin/bash

#install pm2 process manager package for nodejs
sudo DEBIAN_FRONTEND=noninteractive npm install pm2 -g

#kill any process that could interferepm2 kill

pm2 start app.js
