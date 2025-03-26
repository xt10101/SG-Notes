# Week 2 AWS Notes 


## Links
Links to places(headers) in the document
- [Week 2 AWS Notes](#week-2-aws-notes)
  - [Links](#links)
  - [Cloud Computing Questions](#cloud-computing-questions)
  - [Extra notes](#extra-notes)

_____






## Cloud Computing Questions

>**What is Cloud Computing?**

>>The idea of decentralizing computer resources/services. By delivering it over the internet, Instead of runnning computers or services locally,  a cloud provider  is used to store and process the software and access the output over the internet. the compnay does not need own or maintain physical servers or data centers instead they are rented.
----
>**How do we know if something is in the Cloud (on-prem vs the cloud)**
>>If the company runs and maintains physical computer resources on premise then its on prem, if the company accesses their computer resoureses or services over the internet (accesses compute resources remotely) or rents them from a provider then its the cloud. 
---
>**What are some popular cloud computing services and how are they used?**
>>**Elastic Compute Cloud (EC2):**  EC2 allows for the creation of VMs. These VMs can be extensively customized with different processors, storage, networking and operating systems. This allows them to be optimized for their specific task without overspending on any resources. EC2 instances can also be deployed automatically using scripts.  This can make it very convenient if an organisation needs to launch a lot of VMs. Auto Scaling add or remove intances, Failover in different local zones
>
>>**Simple Storage Service (S3):** S3 is an object storage service. It can store any amount of data securely which can be accessed globally. S3 also offers a feature to easily backup data and optimise the cost of data storage through moving data into different archives based on how long you want to store it.
>
>>**Amazon Relational Database Service (Amazon RDS):** The Amazon RDS service allows users to quickly and easily create and use a number of well-known types of relational databases.  The main advantages include removing / reducing administration tasks of manging databases and being able to deploy and scale a large number of different databases efficiently using automation.
>
>> **CloudWatch and Cloud Trail:** Amazon CloudWatch is a service that allows organisations to collect data about the use of their IT resources, using AWS services or applications from on-premise or other cloud applications. CloudWatch can also be used to visualize data and is used to understand trends and predictions about resource usage. This can be useful to understand future costs and help troubleshoot existing problems. CloudWatch can create alarms when resources go above or below certain thresholds. These alarms can be made to trigger an action such as notifying an employee.
---
>>**AWS CodePipeline**: A fully managed continuous  delivery service. Allows user to create CI/CD service that automates the build, test, and deployment phases of your software release process. can run multiple build and deployment processes simultaneously.
---
>**Explain the four main cloud deployment models**
  >>* Public clouds - anybody can access the services (pulbic cloud providerm multi tenenant clouds)
  >>* Private clouds - one-on-one enviroment for a single customer does not share hardware with anyone else.(usually owns the hardware)
  >>* Hybrid clouds - a mix of public and private (store senstivity stuff private and usee public for the rest)
  >>* Multi Cloud - multiple Cloud Providers, avoid vendor  lock, more redundancy (more complexity)

---
>**Explain the three main types of cloud service**
>>* Saas: fully functional sofware servies over the internet
>>* PaaS: A dev or deployment enviroment over the intenet(VMs)
>>* IaaS: Virutalized computing resources (Storage, Server, Networking)
>>* FaaS: One Function does not need a server
>>![aaSdiagram](Imagenotes/スクリーンショット%202025-03-26%20105137.png)

---
>**What are some of the main advantages of the cloud?**
>>* **Flexibility** – This is because the cloud offers the ability to request access to almost any kind of hardware needed and you do not have to wait around for it to arrive. Recreate Snapshots, make Backups of designs or systems. Easy to setup new resources.
>>* **Cost** –  The costs for on premise include the initial purchase or replacement of physical equipment and the cost of paying workers to manage the hardware. In cloud you can pay as you go, or rent resources and change the ammount you spend based on demand. Econermy at scale Capex OPEx
 >> * **Global** - if there is an internet connection, use of most of the cloud services is possible from almost anywhere in the world. 
  The globality of the cloud helps simplify collaboration of multiple people since most of the setup is in place.  Moving services to the cloud also allows for the centralized management of software and other resources. 
>>* **Security** – The cloud can be more secure for storing data compared to on-premise.  Cloud providers are more likely to have specialized personnel for securing data.  Small and medium sized organisation providing security on-premise may have less specialised personnel who have responsibility for a broader range of tasks. 
  Providers also offer tools to streamline areas of security the customer is responsible for such as access management through easy-to-use services such as IAM. 
>> * **Scalable** – UWith on premise setups, it could easily overspend or underspend on compute resources.   Ordering and setting up new equipment is time consuming and compute resources need to be able to keep up with changing demand.  If growth predictions are inaccurate, an organisation risks buying insufficient or excessive compute resources, risking loss of profits or wasted investment. Cloud can avoid these outcomes with its ability to almost instantly increase or decrease the number of resources used

>**What are some potential pitfalls/disadvantages of using the cloud?**
  >>* **Reliablity** - Cloud services depend on internet 

  >>* **connectivity** - if the provider experiences server failures or maintenance, users may face downtime.

>>* **Security** - Storing data on third party can cause security compliance issues and it can be an issue if you have not fine control over how its stored

>>* **Vendor Lock-in** - Can be diffcult to migrate to another cloud provider since it is not straight forward to move all your data. Can as EULA that limit what you can use the cloud resourses for

>>* **Compliance/Leagality**- can Store data in different countires which could break data protection laws depending what country your in.

>**Have a look at marketshare? Who are the biggest Cloud providers?**
>>* AWS
>>* Microsoft Azure
>>* Google Cloud Platform

>**Which Cloud Provider is best? What are the big three known for?**
>>* AWS - Starts ups, Range, Scalabiltiyu amd reliability more documentation (been around longer)
>>* Azure - Buiness  Syngery, Already using Microsoft services, hybrid cloud solutions.\
>>* GCP - AI/ML Work laods, best in class data analytics, kubernetes (invented), most popular container orchestration systems,(10% cheaper)

>**What sorts of thing do you usually pay for when using the cloud?**
>>1. Compute
>>1. Storage
>>1. Networking
>>1. Managed service
>>1. Data Transfer (leaving AWS or moving Reigon)
  



>**What are the four pillars of DevOps? How are they linked to cloud computing?**
  >>Stability, Backups fall over systems
  >>Scalability, Can Scale as neeed
  >>Speed, 
  >>Security, Manged Security 
  >> All Advantages of cloud Computing

  Collab
  Culture
  Monitoring
  Lean/Automation




## Extra notes

AWS Resources

Git uses openSSH

.pem - tracking, certificate

Image - proncofiuguired software configuration 


Port - where is an action taking place