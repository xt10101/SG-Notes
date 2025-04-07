# Week 3 MongoDB notes

## Links
Links to places(headers) in the document
- [Week 3 MongoDB notes](#week-3-mongodb-notes)
  - [Links](#links)
      - [MongoDB Manual Installation Steps:](#mongodb-manual-installation-steps)
_____


cd SG 

#### MongoDB Manual Installation Steps:

>1. Before starting check if the security group contains the correct port rules
(22 and 27017), Update the available list of packages and then upgrade the installed packages.

`sudo apt-get update -y`
`sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y`


>2. Before installing mongoDB download gnupg for data verification and signing and curl for downloads.


`sudo DEBIAN_FRONTEND=noninteractive apt-get install gnupg curl -y`


>3. Download the PGP public Key for MongoDB 7.0 then add the offical GPG key in order to verify if downloaded MongoDB packages come from a trusted source.
```bash
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
    sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
```

>4. Add the location of the MongoDB 7.0 repository to the system so that Ubuntu's package manager knows where to download the it.

```bash
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
```

>5. Update the package list again with the new MongoDB repository.

`sudo apt-get update -y`

>6. Install MongoDB and related tools.
```bash
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6
```

>7.  Check if mongoDB installed correctly.
`sudo systemctl status mongod`

**You should see:**
![MongoDB installed](Imagenotes/スクリーンショット%202025-03-31%20160002.png)



>8. Change the ip configuration to specify what IP addresses can connect to the database.

`sudo nano /etc/mongod.conf`
Change the  the line BindIp line to 0.0.0.0 (from 127.0.0.1):
![MongoDB change IP](Imagenotes/スクリーンショット%202025-03-31%20155854.png)


>9. Start and check the status of the database:
```bash
sudo systemctl start mongod
sudo systemctl status mongod
 ```
**You should see:**
![MongoDB installed](Imagenotes/スクリーンショット%202025-03-31%20161127.png)



>10. Swap over to the machine that is running the App. Create the enviromental variable DB_HOST to point the machine running the the Mongo database. Use the public IP address of the machine running the database.

`export DB_HOST=mongodb://<IP-Address>:27017/posts`

>Turn off the app if it is currently running using `pm2 kill`.




>11. Go into the app folder and run the app
```bash
cd app
sudo npm install
```

>12. Fill the database with some data for in order to test the connection then start the app.
```bash
node seeds/seed.js
pm2 start app.js
```
Go to http://App-IP/posts to confirm if the App and Data base is working



