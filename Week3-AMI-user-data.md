# Week 3 AMI- user data notes

## Links
Links to places(headers) in the document
- [Week 3 AMI- user data notes](#week-3-ami--user-data-notes)
  - [Links](#links)
      - [AMIs](#amis)
      - [EC2 User Data](#ec2-user-data)
      - [AWS CLI](#aws-cli)
  - [AMI Questionsf](#ami-questionsf)
  - [How to make one](#how-to-make-one)
  - [How to use one](#how-to-use-one)
_____




#### AMIs

An Amazon Machine Image (AMI) is an image that provides the software that is required to set up and boot an Amazon EC2 instance. 

Each AMI also contains a block device mapping that specifies the block devices to attach to the instances that you launch. You must specify an AMI when you launch an instance. The AMI must be compatible with the instance type that you chose for your instance. You can use an AMI provided by AWS, a public AMI, an AMI that someone else shared with you, or an AMI that you purchased from the AWS Marketplace.

An AMI is specific to the following:

    Region

    Operating system

    Processor architecture

    Root device type

    Virtualization type


You can create an AMI from your Amazon EC2 instances and then use it to launch instances with the same configuration.


#### EC2 User Data

>A script of data that can be passed to an EC2 instance during launch.

>it can be used to automate various tasks. User Data is especially useful when you need to perform one-time configurations or customize an instance’s behavior at launch.


>**Use Cases for EC2 User Data**


  * **Software Installation**: install software packages and dependencies that your EC2 instance requires.
  * **Configuration** : Customize your instance by setting environment variables, configuring services, or applying specific settings.
  * **Automation** : EC2 User Data is a valuable tool for automating tasks like provisioning databases, setting up web servers, and more.
  * **Bootstrapping** : Use User Data to perform setup tasks during the instance’s first boot, such as downloading and installing application code.

(add shebang)

/home/ubuntu/app

Networking and configuration settings are not loaded yet

#### AWS CLI


```bash
--user-data file://path/to/script.sh  #pass user data script from a file using AWS CLI
``` 

```bash
--user-data sudo systemctl nginx start # --userdata running a single command 
```


1. Document Images:


1. Try to create an app image in the same way we created the db image. Your image should:
Have the app code
Have the required dependencies (nodejs 20, nginx)
Have the reverse proxy config
Have pm2
You will still need to manually set the DB_HOST variable, seed the database and start the app.
1. If you finish that, try to develop a "User Data" script that will do the above three manual steps for you.
Hint: Are you the "ubuntu" user when you run user data?


## AMI Questionsf


**What are they?**
> A pre-configured virutal machine template. to create instances
contains an operating system, pre installed software, configuration settings

**How do they work?**
>They can be premadw or customised, When creating an instance you choose one to create the VM.

**Why are they helpful for a business?**
>Automation, reduce human error, allows for consistent


## How to make one
>1. To make an AMI Once you have configured your instance with the correct installation go into the instance tab and shut it down

>2. Next click Actions --> Image and templates --> Create image, Give the AMI a name and descrption then press create image

>3. To use the image when creating a new instance, click on My AMIs then choose your created instance

## How to use one


1. Try to create an app image in the same way we created the db image. Your image should:
Have the app code
Have the required dependencies (nodejs 20, nginx)
Have the reverse proxy config
Have pm2
You will still need to manually set the DB_HOST variable, seed the database and start the app.
1. If you finish that, try to develop a "User Data" script that will do the above three manual steps for you.
Hint: Are you the "ubuntu" user when you run user data?
