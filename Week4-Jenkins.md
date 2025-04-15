# Week 4 Jenkins notes

## Links
Links to places(headers) in the document
- [Week 4 Jenkins notes](#week-4-jenkins-notes)
  - [Links](#links)
  - [Jenkins:](#jenkins)
  - [Creating a basic job in jenkins](#creating-a-basic-job-in-jenkins)
  - [Setting up configuration between Github and Jenkins (SSH)](#setting-up-configuration-between-github-and-jenkins-ssh)
  - [Setting up the WebHook](#setting-up-the-webhook)
  - [Auto Merging](#auto-merging)
  - [Code Deployment](#code-deployment)
_____

CI/CD
integration, check code before its merged automatically 


**Continuous Delivery (CD)**
>Still needs to be manually deployed to the new user

**Continuous Deployment (CDE)**
>Software is always in a deployable state (can be delivered at any time)
automatic release

## Jenkins:

**Advantages**

* Open source automation server
* Create Build, test deploy pipelines
* Lots of plugins
* Cross platform


**Disadvantages**

* complex to set up/trouble shoot
* Have to keep maintaining pipelines
* Resource intensive 
* UI issues


Typical Stages of Jenkins Pipeline:
* SCM - source code management (retrieve source code)
* Build - build the source code
* Test - run tests on the build
* Package - package and compile the code
* Deploy - Deploy it out the an environment
* Monitor - set your metrics


![Diagram](Imagenotes/スクリーンショット%202025-04-10%20163421.png)


## Creating a basic job in jenkins


>1. Press "New Item" give the job a name and select "Freestyle Project" the press "OK"

>2. In "General" give the job a description. Below select "Discard old builds" and set "Max # of builds to keep" to 3.
>![des number builds settings](Imagenotes/スクリーンショット%202025-04-09%20153302.png)

>3. go down to build step and select an "Execute shell".  Enter a command to test if the job runs successfully. Press finish.
>![Execute shell example](Imagenotes/スクリーンショット%202025-04-09%20153518.png)

>4. To test the job press the "build now" button in the sidebar.




## Setting up configuration between Github and Jenkins (SSH)

>1. Using Git-bash, go to .ssh run the command ssh-keygen -t rsa -b 4096 -C "placeholder@hotmail.com", give the key a name

>2. Go to your GitHub repo --> Settings --> Deploy Keys --> Add Deploy Key. Give the key a name and add your PUBLIC key to the key section. Make sure there is no white space. You can get the key from your bash using the cat command.

![public key add](Imagenotes/スクリーンショット%202025-04-09%20141316.png)

>3. Go to your Jenkins and create a new Build. In "General", paste the url of your github into the github project section. (the URL from the webpage not the the "CODE" URL)
   
![git url](Imagenotes/スクリーンショット%202025-04-09%20141835.png)

>4. In source code management select git. Get the SSH URL from your repo and paste it into the repository URL. To add your Key click the add below the "Credentials" input and add your private key into it.

>5. Change the branch specifier from master to main. In "Build Environment" select "Provide Node & npm bin/ folder to PATH" and set the NodeJS version to 20.

![Node config](Imagenotes/スクリーンショット%202025-04-09%20142509.png)

>6. In Build Steps add an Execute shell and write:
```bash
ls
cd app
npm install
npm test
```
>Then press save



## Setting up the WebHook
* Setting up a webhook in order to trigger build runs on jenkins when a push to a specific branch is performed.

>1. Go to your Job that you connected to github with ssh. 

>2. In your Job --> "Configure" --> "General". go to the "Branches to build" --> "Branch Specifier". Change the name from "main" to "dev"

>3. go to "Build Triggers" window. select "GitHub hook trigger for GITScm polling" and then save the job.

>![build triggers](Imagenotes/スクリーンショット%202025-04-09%20151521.png)

>3. Go to your github repo --> "settings" --> "Webhooks" --> "Add webhook". Set the "Payload URL" to Payload to (http://jenkins-ip-here:8080/github-webhook/) and disable SSL verification then press "Add Webhook" (the ip address will change)

>![github directions](Imagenotes/スクリーンショット%202025-04-09%20151702.png)


>![github webhook settings](Imagenotes/スクリーンショット%202025-04-09%20152114.png)


>Now when you create a dev branch in git and push it, the job on jenkins should automatically run.


## Auto Merging

>1. Create an new item, choose the "copy from" template option and select job1 that is connected for the git, change description to reflect the role of the job

>2. Remove the Build Trigger and go down to the "post build actions" and select "git publisher" tick the boxes Push Only If "Build Succeed" and "Merge Results"
>![post build settings](Imagenotes/スクリーンショット%202025-04-10%20121130.png)

>3. Scroll down to "Branches"  in "Branch to push" type "main" and in "Target remote name" type "origin" then save the job.
>![branch options](Imagenotes/スクリーンショット%202025-04-10%20121230.png)
  
>4. Go back to job1 go down to "Post-build Actions" in "Projects to build" select your merge job you just made. then select "Trigger only if build is stable" below and save the Job
>![ost-build Actions for job1](Imagenotes/スクリーンショット%202025-04-10%20121417.png)
   
>5. You can now push a change to the dev branch and it should automatically be merged with the the dev branch.



## Code Deployment

>1. Create an new item, choose the "copy from" template option and select auto merging job, change description to reflect the role of the job

>2. Change back to :main" in build branch.  Remove the Post-build Actions from the bottom.

>3. Go to AWS EC2 make an instance, Use an AMI that downloads NGINX. (you can make use for the AMI usd for the  Nodejs app or look at the tutorial for making one in Week3-AMI-user-data), Keep track of the SSH key used to make the instance as you will need the private key later.
   
>4. In Jenkins select SSH agent and then add your private key for the instance you just made to the credentials section.

>![SSH Agent](Imagenotes/スクリーンショット%202025-04-10%20151845.png)

>5. In "Build Steps" add a "Execute shell" put in the commands and press save:

```bash
rsync -avz -e "ssh -o StrictHostKeyChecking=no" app ubuntu@<instance-address>:/home/ubuntu
ssh -o "StrictHostKeyChecking=no" ubuntu@<instance-address> <<EOF
   cd app
   npm install
   pm2 kill
   pm2 start app.js
EOF
```
>![SSH Agent](Imagenotes/スクリーンショット%202025-04-11%20152524.png)

>6. In your merge job go to "Post-build Actions" and add a "Build other projects" option then add your deploy job. (make sure this action run after the first one)

>![SSH Agent](Imagenotes/スクリーンショット%202025-04-11%20152538.png)

>7. To test the code deployment push a change from your dev branch




#GitHub hook trigger for GITScm  note
#When Jenkins receives a GitHub push hook, GitHub Plugin checks to see whether the hook came from a GitHub repository which matches the Git repository defined in SCM/Git section of this job. If they match and this option is enabled, GitHub Plugin triggers a one-time polling on GITScm. When GITScm polls GitHub, it finds that there is a change and initiates a build. The last sentence describes the behavior of Git plugin, thus the polling and initiating the build is not a part of GitHub plugin.
