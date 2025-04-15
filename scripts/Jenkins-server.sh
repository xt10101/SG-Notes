#!/bin/bash
 
# Update the system
sudo apt update -y
 
# Upgrade the system
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

#First, add the repository key to your system:
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

#append the Debian package repository address to the server’s sources.list:
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update -y


# install Jenkins and its dependencies:
sudo DEBIAN_FRONTEND=noninteractive apt install jenkins -y
# install Java
sudo DEBIAN_FRONTEND=noninteractive apt install openjdk-17-jdk -y

#enable the server and print the instial password
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo cat -n /var/lib/jenkins/secrets/initialAdminPassword

