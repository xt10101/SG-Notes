# Week 4 VPC notes

## Links
Links to places(headers) in the document
- [Week 4 VPC notes](#week-4-vpc-notes)
  - [Links](#links)
    - [Creating VPC](#creating-vpc)
    - [Adding Instances to the VPC](#adding-instances-to-the-vpc)
    - [Removing VPC Order:](#removing-vpc-order)
_____




 

 
>**What is a VPC?**

>>Amazon Virtual Private Cloud can launch logically isolated virtual networks. Resembles a traditional network.


>>![VPC Diagram](Imagenotes/スクリーンショット%202025-04-07%20103936.png)

>>A VPC will sit inside a region and can be broken down into subnets that sit into multiple availability zones.
To access the internet all traffic  can access the internet though the internet gateway.Helps with security



>**How do VPCs help a business?**
>>**Isolation:** Each VPC is isolated, so your workloads aren’t exposed to others using the same cloud.
>>**Control:** Choose your IP ranges, subnets, and routing rules. Set up custom route tables, NAT gateways, internet gateways, etc.
>>**Cost Optimization**  Keep internal traffic private (and cheaper) using local routing instead of going through the internet.

>**How do they help DevOps?** 
>>**Scalability** Easily scale your infrastructure up or down. You can split environments by VPCs (e.g., dev, staging, prod) or by team/project.
>>**Infrastructure as Code (IaC)** You can define VPCs and all their components (subnets, route tables, gateways, etc.) 
>>**CI/CD Integration** CI/CD pipelines can deploy applications into specific VPCs or subnets with controlled access to databases, caches, or message queues.
>>**Networking** DevOps can use VPCs with internal DNS, load balancers, and VPC endpoints to ensure services talk to each other securely and reliably.
>>**enable better monitoring** 
>>**Good Hybrid Intergrations**

>**Why did AWS feel the need to introduce VPCs?**

>>* Give users control, isolation, and flexibility
>>* Support enterprise-level network architectures
>>* Enable hybrid and secure cloud deployments
>>* Evolve AWS from “just a few EC2 instances” to full-blown enterprise cloud infrastructure

**Explain the VPC components:**
>>* **Subnets** - a range of ip addresses the sub network can use (segment a network), lives in a single AZ
>>* **Public vs Private Subnets**: public subnets can access the internet, private only talk to other devices on the network.
>>>**Public Subnets** are subnets that have direct access to the internet through an Internet Gateway (IGW). They're typically used for resources like web servers.
>>>**Private Subnets** do not have direct access to the internet. They're used for resources that don't need public access, such as databases or application servers.
>>* **CIDR Blocks** - Cider notation used to work out the range of addresses for a subnetting
>>* **Internet Gateways** - routers controls access between public subnets and the internet.
>>* **Route Table/s** a set of route that determine where network 
traffic goes. Routes define where traffic is directed based on the destination IP address. Used to direct network traffic between subnets
>>**SG and how SGs work on an INSTANCE level**, SGs do not attach to subnets only to instances. if the inbound is allowed the response is automatically allowed outbound regardless of outbound rules (Stateful)
When multiple SGs are attached rules are aggregated.
No Deny Rules SGs only have allow list if traffic is not explicitly allowed it is denied by default

Network Access Control list
let in and outbound traffic
accept and deny rules





#VPC Set up notes

### Creating VPC

>1. Go to VPC dashboard and click "Create VPC"

>2. "On the Create VPC page" do:
   * "VPC Only",
   * give the VPC a Name
   * Assign the VPC CIDR Block (10.0.0.0/16)
   * Set Tenancy to "Default" 
  
>![VPC Create Page](Imagenotes/スクリーンショット%202025-04-07%20154622.png)

>3. Review the name in the "Tags" field at the bottom then press "Create VPC"

>4. On the Left in the side menu click on "Subnets" --> "Create subnet". On the "Create Subnet" page select the VPC you made earlier in the dropdown. 
 >![VPC selection](Imagenotes/スクリーンショット%202025-04-07%20155800.png)


>5. In the Subnet settings page Create to subnets one private(DB), one public(app).

>>Give each subnet:
>>* Name: (public private)
>>* availability zone
>>* Cider Block

>![public subnet](Imagenotes/スクリーンショット%202025-04-07%20160539.png)
>![private subnet](Imagenotes/スクリーンショット%202025-04-07%20160632.png)

>5. Go back to the VPCs and select "Internet Gateways" on sidebar and click "Create internet Gateway" and give it a name.

>![IG Creation](Imagenotes/スクリーンショット%202025-04-07%20162115.png)



>6. To attach the internet gateway press actions then "Attach VPC". select the VPC you made earlier then press "Attach internet gateway:

>![Attach VPC](Imagenotes/スクリーンショット%202025-04-07%20162418.png)

>7. Next click on "Route tables" --> "Create Route Table". For the public route
Name the route and assign the VPC, the press "Create Route Table"

>![route creation](Imagenotes/スクリーンショット%202025-04-07%20162923.png)

>8. To create the connection to the internet, When the route table is created click "Edit routes" --> "Add route"

fill in:
Destination: "0.0.0.0/0"
Target: Internet Gateway --> select your VPC

>Then press "Save changes"

>![Edit Route](Imagenotes/スクリーンショット%202025-04-07%20163534.png)

To attach the public subnet to the public route find your public subnet then go to "actions" --> Edit route table association search for the route table you just made then press "save"


>![subnet route match](Imagenotes/スクリーンショット%202025-04-07%20164927.png)
 
>9. To confirm the VPC was made correctly go back to "Your VPCs" click on yours and view the resource map.

>![view progress](Imagenotes/スクリーンショット%202025-04-07%20165030.png)


### Adding Instances to the VPC

>1. Start by creating a instance like you normally would. When you get to Network settings press "Edit"


>2. Change the VPC to the one you made and select the appropriate subnet (public for app and private for DB)/

>3. If you are making an app instance enable "Auto-assign IP" else leave it disabled.

>4. Due to the VPC being different you  will have to remake any security groups you used before
>APP add 0.0.0.0/0: port  80
>DB add 0.0.0.0/0: port  27017

>5. when making the app you will have to change the user data db ip to its private address.



### Removing VPC Order:

Remove the VMs in the VPC
Remove the security groups associated with the VPC
Remove the VPC:
When deleting the VPC it should report that it will also delete these 4 resources:
the Internet gateway
the public route table
the private subnet
the public subnet







Feel free to add content on Subnets, CIDR blocks etc.
I
f you finish early you have a number of options to crack on with:
Revise for the assessment tomorrow (estimated time 10:00)
Work on ASP.NET api deployment
If you have done above already you can work on:
Automating it with a bash script
Automating it using AMIs + User Data
Running it through an ASG (ask me first if you do this please)
Deploying it in a VPC
Update your PDP