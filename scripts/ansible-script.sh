#!/bin/bash
 
# Update the system (download but don't use)
sudo apt update -y
 
# Upgrade the system
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

#£ po install location
 
sudo DEBIAN=FRONTEND_noninteractive apt-add-repository ppa:ansible/ansible
#install anisuble

sudo DEBIAN_FRONTEND=noninteractive apt install ansible -y

ansible --version
 
cd /etc/ansible
 
ls
 

 #give controller the ssh key for the target go into ssh folder
 #Make .pem file in .ssh folder
 sudo nano


sudo chmod 400 tech503-tom-aws-key.pem

sudo ssh -i "tech503-tom-aws-key.pem" ubuntu@3.250.48.204

#test ability to talk to target host
cd /etc/ansible

sudo nano hosts

#add IP addresses to a [group]

ec2-instance ansible_host=3.250.48.204 ansible_user=ubuntu ansible_ssh_private_key_file=/home/ubuntu/.ssh/tech503-tom-aws-key.pem





sudo ansible all -m ping

sudo ansible web -m ping

https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html


#remove purple message
<ansible.cfg>
[default]
interpreter_python = auto_silent
#example config file
https://github.com/ansible/ansible/blob/stable-2.9/examples/ansible.cfg


#list and graph
ansible-inventory --help
--list: display hosts in a list
--graph: display hosts in a tree view

#adhoc commands, run command on the hosts

sudo ansible web -a "uname -a"
sudo ansible web -m ansible.builtin.command

sudo ansible web -m ansible.builtin.apt -a "update_cache=yes" --become
sudo ansible web -m ansible.builtin.apt -a "upgrade=dist" --become
#if module is not specifced