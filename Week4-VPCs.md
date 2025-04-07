# Week 4 VPC notes

## Links
Links to places(headers) in the document
- [Week 4 VPC notes](#week-4-vpc-notes)
  - [Links](#links)
_____




 

 
>**What is a VPC?**

>>Amazon Virtual Private Cloud can launch logically isolated virtual networks. Resembles a traditional network.


>>![VPC Diagram](Imagenotes/スクリーンショット%202025-04-07%20103936.png)

>>A VPC will sit inside a region and can be broken down into subnets that sit into multiple availability zones.
To access the internet all traffic  can access the internet though the internet gateway.


>**How do VPCs help a business?**
>>**Isolation:** Each VPC is isolated, so your workloads aren’t exposed to others using the same cloud.
>>**Control:** Choose your IP ranges, subnets, and routing rules. Set up custom route tables, NAT gateways, internet gateways, etc.
>>**Cost Optimization**  Keep internal traffic private (and cheaper) using local routing instead of going through the internet.

>**How do they help DevOps?** 
>>**Scalability** Easily scale your infrastructure up or down. You can split environments by VPCs (e.g., dev, staging, prod) or by team/project.
>>**Infrastructure as Code (IaC)** You can define VPCs and all their components (subnets, route tables, gateways, etc.) 
>>**CI/CD Integration** CI/CD pipelines can deploy applications into specific VPCs or subnets with controlled access to databases, caches, or message queues.
>>**Networking** DevOps can use VPCs with internal DNS, load balancers, and VPC endpoints to ensure services talk to each other securely and reliably.

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
>>* **Route Table/s** a set of route that determine where network traffic goes. Routes define where traffic is directed based on the destination IP address. Used to direct network traffic between subnets
>>**SG and how SGs work on an INSTANCE level**, SGs do not attach to subnets only to instances. if the inbound is allowed the response is automatically allowed outbound regardless of outbound rules (Stateful)
When multiple SGs are attached rules are aggregated.
No Deny Rules SGs only have allow list if traffic is not explicitly allowed it is denied by default