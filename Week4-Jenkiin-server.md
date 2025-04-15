# Week 4 Jenkins Server notes

## Links
Links to places(headers) in the document
- [Week 4 Jenkins Server notes](#week-4-jenkins-server-notes)
  - [Links](#links)
  - [Jenkins server setup](#jenkins-server-setup)
_____

Continuous integration and automation 



## Jenkins server setup

1. Make a VPC with 1 public subnet and an Instance within that subnet. Use a T3 micro and setup a Security group with the ports 22 and 8080.

tutorial reference

2. On the instance run the script to set up the Jenkins server. use `sudo cat -n /var/lib/jenkins/secrets/initialAdminPassword` to get the initial login password


3. In the Jenkins setup find the NodeJS and SSH agent plugin and install them.
>![Plugins](Imagenotes/スクリーンショット%202025-04-11%20154944.png)
   
>![Plugins](Imagenotes/スクリーンショット%202025-04-11%20152538.png)

4. To disable strict key checking, In the Dashboard go to --> manage Jenkins --> Security. Scroll down to "Git Host Key Verification Configuration" and change the dropdown from "Known host file" to "no verification". Then save.

>![Plugins](Imagenotes/スクリーンショット%202025-04-11%20155253.png)

5. To get the a NodeJS version, In the Dashboard go to --> manage Jenkins --> Tools. Scroll down to "NodeJS installations " press "Add NodeJS" give it a name a choose "20.19.0" as the version. Then save.

>![Plugins](Imagenotes/スクリーンショット%202025-04-11%20155648.png)

6. the Jenkins server should now be able to run the job you perviously made.




