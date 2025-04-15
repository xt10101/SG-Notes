# Week 5 Infrastructure as code notes

## Links
<!-- Links to places(headers) in the document -->
- [Week 5 Infrastructure as code notes](#week-5-infrastructure-as-code-notes)
  - [Links](#links)
_____

Continuous integration and automation 


>### IaC

the ability to provision and support compute infrastructure through code instead of manually through UI settings.

Automates infrastructure management, don't have to focus on managing environment
Control costs, reduce risks, extra scalability, Improve infrastructure consistency. Eliminate configuration drift

>configuration files are created that contain your infrastructure specifications
* By codifying and documenting your configuration specifications, IaC aids configuration management and helps you to avoid undocumented, ad-hoc configuration changes.
* Can divide your infrastructure into modular components that can then be combined in different ways through automation.
* Version control is an important part of IaC, and your configuration files should be under source control just like any other software source code

>#### There are 2 ways to approach IaC: declarative or imperative. 

>**Declarative**: 
* the desired state of the system, including what resources you need and any properties they should have, and an IaC tool will configure it for you. 
* keeps a list of the current state of your system objects, which makes taking down the infrastructure simpler to manage.

>**Imperative**:
*  defines the specific commands needed to achieve the desired configuration, and those commands then need to be executed in the correct order. 
*  

Many IaC tools use a declarative approach and will automatically provision the desired infrastructure. If you make changes to the desired state, a declarative IaC tool will apply those changes for you. An imperative tool will require you to figure out how those changes should be applied.

>### Configuration Management? 
aimed at automating the configuration of individual systems, such as multiple servers, firewalls or routers.  
Settings, how they are managed, software, manages existing instance
>### Configuration Orchestration? 
Orchestration helps to represent, model, configure and deliver complex systems. 
Managing the order and coordination in which configuration tasks are applied — especially across multiple systems or layers of infrastructure.
Creating launching new infrastructure 

>### Config Management vs Orchestration
Orchestration manages and coordinates configuration pipelines and applies configurations via automation. 
Management manages existing confiugrations,


>### Ansible and it's uses/benefits
one of the most popular tools in DevOps and system administration

Ansible is an open source IT automation engine that automates provisioning, configuration management, application deployment, orchestration, 

Simplicity: Ansible is easy to install and use, making it accessible for users of all skill levels. 

Open Source: It is free and open-source, allowing for community contributions and transparency. 

Agentless Architecture: Ansible does not require any agent installation on target machines, simplifying management. 

Powerful Automation: It automates application deployment, cloud provisioning, and intra-service orchestration, enhancing efficiency. 

Scalability: Ansible can manage a large number of servers simultaneously, making it suitable for both small and large environments.

adhoc one off command
playbook -> recipe/desired state (written in yaml)

>### Terraform and it's uses/benefits

Terraform is an open-source IaC tool, designed to automate the creation, modification, and management of infrastructure across various cloud providers (AWS, GCP, Azure, etc.) and services.

Provisioning Infrastructure
Terraform allows you to define infrastructure in code (e.g., EC2 instances, S3 buckets, VPCs) in a cloud-agnostic way.

Can provision resources across multiple cloud providers simultaneously.

1. Multi-Cloud and Hybrid Infrastructure
With Terraform, you can manage resources across multiple clouds (AWS, Azure, GCP) within the same configuration.

Ideal for hybrid cloud architectures where you might need to manage both on-prem and cloud resources.

3. Infrastructure as Code (IaC)
Version control and collaborative management of infrastructure.

Infrastructure is treated like software code, which means changes can be tracked, tested, and versioned.

4. Automating Networking and Security Configurations
Automate the creation of networks (e.g., subnets, VPCs), firewalls, security groups, etc.

Use Terraform to manage complex networking setups and apply security standards consistently.

5. Managing Dependencies Between Resources
Terraform’s graph-building capabilities allow you to define dependencies (e.g., a database must be created before an app server is spun up).

Handles inter-resource dependencies automatically.

6. Continuous Integration / Continuous Deployment (CI/CD) Pipelines
Integrate Terraform into CI/CD pipelines to automatically provision infrastructure when deploying code changes.

Automation of Infrastructure Management
Multi-Cloud Strategy Support
Immutable Infrastructure
Version Control Integration
Self-Service Clusters
Cost Management
Community and Ecosystem
https://dev.to/supportfly/what-are-the-benefits-of-using-terraform-4cp9
>### What can you do with IaC tools? IaC projects?

With Infrastructure as Code (IaC) tools, you can automate, manage, and version control the infrastructure you deploy, whether it's on cloud platforms like AWS, Azure, Google Cloud, or even on-premises hardware. IaC transforms the process of provisioning and maintaining infrastructure into a repeatable, consistent, and scalable operation.


>### New/Alternative IaC tools
Cloud formation
Terraform

CM Tools
Cehf Puppet


>### Why does IaC matter for DevOps?

aC takes away the majority of provisioning work from developers, who can execute a script to have their infrastructure ready to go. That way, application deployments aren’t held up waiting for the infrastructure, and sysadmins aren’t managing time-consuming manual processes. 

CI/CD relies on ongoing automation and continuous monitoring throughout the application life cycle,
 IaC helps you to align development and operations because both teams can use the same description of the application deployment, supporting a DevOps approach.






Ansible Creation Steps

>1. Create two new instances one for the Ansible controller and one for the target host which the controller will be able to modify. 

>2. ssh into the Ansible controller instance. check that python is installed using `python3 --version`

>3. to install Ansible run the commands:

```bash
# Update the system (download but don't use)
sudo apt update -y
 
# Upgrade the system
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

#point to where to find ansible files for download
 
sudo DEBIAN=FRONTEND_noninteractive apt-add-repository ppa:ansible/ansible
#install ansible

sudo DEBIAN_FRONTEND=noninteractive apt install ansible -y
```

>4. In order to connect to the controller add the private key you used when creating the instance into the .ssh directory:
```
cd
cd .ssh
sudo nano <key-name>.pem #make .pem inside .ssh directory
<add private key inside>
sudo chmod 400 tech503-tom-aws-key.pem # set access to readonly for the owner

```
you can test the private key by using sudo ssh -i "<key-name>" ubuntu@<ip-address>

>5. Add the Target's ip information into the ansible "hosts" file

```
cd
cd /etc/ansible
sudo nano hosts
<add the two lines then save:>
[<group>]
ec2-instance ansible_host=<placeholder-ip> ansible_user=ubuntu ansible_ssh_private_key_file=/home/ubuntu/.ssh/<placeholder-key-name>
```

[groups] can be used to group instances together.

to test of the configuration use to see if the target instance can be reached.
`sudo ansible all -m ping`

`sudo ansible [<group>] -m ping`

>6. In order to remove the purple message, go in to the ansible configuration and add the lines:

```
nano ansible.cfg
<ansible.cfg>
[default]
interpreter_python = auto_silent
```
>![ansible test](Imagenotes/スクリーンショット%202025-04-14%20162125.png)

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


https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html


https://github.com/ansible/ansible/blob/stable-2.9/examples/ansible.cfg

How does Ansible work (diagram please)


**use ad hoc command to copy the private key on AWS from controller to target node node**

sudo ansible ec2-instance -m copy -a "src=/home/ubuntu/.ssh/tech503-tom-aws-key.pem  dest=/home/ubuntu/.ssh/tech503-tom-aws-key.pem"


**
Try to deploy nginx (on the target node) using adhoc commands!**

`sudo ansible ec2-instance -b -m apt -a "name=nginx state=present update_cache=yes"`
#The -b flag in the ansible command stands for "become".
targeting the group/host called ec2-instance from your inventory.
state=present -> Install it if it's not already installed.

`sudo ansible ec2-instance -b -m service -a "name=nginx state=started enabled=yes"`

`sudo ansible ec2-instance -a "curl -I http://localhost"`