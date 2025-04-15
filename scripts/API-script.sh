#!/bin/bash
 
# Update the system
sudo apt update -y
 
# Upgrade the system
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
 
# Install nginx
sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y
 
# Edit the default file for reverse proxy
sudo sed -i '51c\proxy_pass http://127.0.0.1:5000;' /etc/nginx/sites-available/default
 
# Restart nginx
sudo systemctl restart nginx
 
# Install curl
sudo DEBIAN_FRONTEND=noninteractive apt install curl -y
 
# Install .NET SDK
sudo DEBIAN_FRONTEND=noninteractive apt install dotnet-sdk-8.0 -y
 
# Install git
sudo DEBIAN_FRONTEND=noninteractive apt install git -y
 
# Clone the app repo
git clone https://xt10101:<<PAT>>@github.com/xt10101/Private_Code_Bank.git

# Change directory to the app

 
mv Private_Code_Bank/sparta-api-main/sparta-api-main ~
rm -rf Private_Code_Bank/


# Change directory to the unzipped app
cd sparta-api-main
 
# Publish the app
sudo dotnet publish -c Release -o /var/www/ --runtime linux-x64
 
 # Change directory to the published app
cd /var/www/
 
# Run the app
sudo dotnet SpartaAcademyAPI.dll &