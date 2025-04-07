# Week 3 Auto Scaling notes

## Links
Links to places(headers) in the document
- [Week 3 Auto Scaling notes](#week-3-auto-scaling-notes)
  - [Links](#links)
  - [Auto Scaling Concepts](#auto-scaling-concepts)
  - [How to set up Auto Scaler](#how-to-set-up-auto-scaler)
    - [Launch Templates](#launch-templates)
    - [Create Auto Scaling Groups (ASG)](#create-auto-scaling-groups-asg)
_____


## Auto Scaling Concepts



>Horinzontal scaling is more cost effective than vertical sclaing



>High avavailabity -SLA - service level agreement -SLO - Service level objective SLI Service level indicator(where they are in their service level) (SRE, Site reilability Engineer)




Load balancer (manage the load by sending users to different isntances)

##ASG Diagram


## How to set up Auto Scaler

### Launch Templates

> The launch template is used to specifiy what instances and instance configurations will be run.

>1. On the template page choose, create launch template. The choose following options as if you were making a regaular instance:
   >* AMI
   >* Instance Type
   >* Key Pair
   >* Security Group
   >* User Data
   >* Resource Tags (optional)

>2. Once finished press the "Create template version" button, To test if the template works select your template then go to "Actions" --> "Launch template".



### Create Auto Scaling Groups (ASG)

>**1**. In the "Auto scaling groups" tab press the "Create Auto Scaling group" button then press "Next". Select the Name and Launch Template you want to use for the ASG.
>
>![ASG name and template options](Imagenotes/スクリーンショット%202025-04-04%20144047.png)


>**2**. The next tab should appear showing network options, in the "Availability zones and subnets" tab the 3 DevOpsStudent subnets (1a, 1b and 1c) should to be used.
>**3**. Keep the VPC as default and the Availability zones(AZ) distribution options as "Balanced best effort" then press "Next."
>
>![AZ and distirbution options](Imagenotes/スクリーンショット%202025-04-04%20145145.png)




>**4**. On the "Integrate other service" page, go in the load balancing tab and select  "Attach to a new load balancer: option.
>   
>![create new load balancer option](Imagenotes/スクリーンショット%202025-04-04%20150425.png)

>**5**. In the wigdet "attach a new load balancer" Select the Application Load Balancer for the web application, edit the name to be more descriptive, set "Load balancer scheme" "internet-facing".
>
>**6**. When that Option is pressed new widgets should appear below. In the "Network mapping settings", go to "Listeners and routing" then create a new target group, edit the name to be more descriptive. Your settings should be similiar to this:
>   
>![load balancer settings](Imagenotes/スクリーンショット%202025-04-04%20151059.png)

>**7**. Scroll down to "Health checks" and enable "Turn on Elastic Load Balancing health checks", then press "Next".
>
>![health Check option](Imagenotes/スクリーンショット%202025-04-04%20151459.png)


>**8**. On the "Configure group size and scaling page" in "Groups size" tab set desired capacity to 2 and in the "Scaling tab" set the min to 2 and max to 3.
>
>**9**. Enable "Target scaling policy" in order to work with cloud watch, set the policy name and choose your metric type and target value (%), once these settings are to your liking scroll to the bottom and press "Next".
>
>![policy Settings](Imagenotes/スクリーンショット%202025-04-04%20152457.png)


>**10**. Press "Next" again to skip to the "Add tags" page. Create a name tag and give it a value for your instances. 
>
>![policy Settings](Imagenotes/スクリーンショット%202025-04-04%20153251.png)



>**11**. Review your options then at the bottom select press Create Auto Scaling Group, to test your website 
add tag to asg


The Deletion order for getting rid of the ASG is:
1. Delete LB (Load Balancer)
2. Delete TG (Target Groups)
3. Delete ASG (Auto Scaling Groups)




