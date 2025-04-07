

## Links
Links to places(headers) in the document
- [Links](#links)
- [To Do](#to-do)
- [General Notes](#general-notes)
_____


## To Do

* [x] Redo SSH set up
* [x] Do Cloud Research
* [x] Create new Repo for notes
* [ ] Create Bash Script for SSH Agent
* [x] Finish HR Videos
* [x] Northrop Grumman Ref
* [x] Sparta Global Ref
* [x] Personal Reference Ref
* [x] Develop your Linux cheatsheet from the commands we have learned so far
* [x] Research the following topics/concepts/commands in Linux/Bash
* [x] Find out how to avoid/fix the "purple screen" problem?
* [ ] Practice TMAY
* [ ] More Flash cards
* [ ] Tidy up notes
* [ ] cloud, linux, github
## General Notes
sudo systemctl stop packagekit

exlpains the first one that comes to mind

STAR

scp /path/to/local/file username@remote_host:/path/to/remote/destination

scp -i ~/.ssh/tech503-tom-aws-key.pem nodejs20-sparta-test-app.zip ubuntu@ec2-18-203-92-148.eu-west-1.compute.amazonaws.com:~




1. (MAIN TASK) Redo the deployment of the ASG + LB. Document the process along the way
Make sure to have a number of screenshots of the console during the process
If you want to explain the concepts you can do, but main focus is the steps
Should be good enough to be used by others who did not do the session with us
1. (OPTIONAL) Deploy the ASP.NET application Nish set yesterday.
See the following card: Planner - Deploy ASP.NET API
Reminder, must be on a PRIVATE GitHub Repo
1. (OPTIONAL) Deploy the ASP.NET API in an ASG
Documentation optional for that, will be similar to Sparta app ASG


Explore the Documentation:

Go through the project’s documentation to understand how the API works (ignore the Docker setup instructions for now). The API is already deployed on Azure, so you can test it there. NOTE: There is no external database, it uses an in-memory database, do don't worry about creating another instance for the database

Create a Private Repository:

Create a new private repository on GitHub and upload the project code into it.


Write a Bash Script:
Your Bash script should include the following tasks:

Update system packages

Install required dependencies: Nginx, Git, Curl, Unzip, .NET SDK

Clone the private repository using your GitHub Personal Access Token (PAT) — do not use SSH. For more details on generating a PAT, refer here.

Publish the ASP.NET API (publish the app before proceeding further).

Delete the cloned repository after publishing the app.

Set up Nginx as a reverse proxy to route requests to the published API.

Run the published app using the appropriate process manager (e.g., systemctl or nohup).







Test Topics
App Deployment
DB Deployment
User Data
Images/AMIs
Autoscaling
Load Balancing
Launch Templates



Catherine Moncrieff
CMoncrieff@spartaglobal.com
Sparta Main phone number
Address: Sparta Head office
Title: Head of HR
 
 
6th Floor,
125 London Wall,
London,
EC2Y 5AS
+44 (0) 207 048 4022
