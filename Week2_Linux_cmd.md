# Week 2 AWS Notes 


## Links
Links to places(headers) in the document
- [Week 2 AWS Notes](#week-2-aws-notes)
  - [Links](#links)
  - [Linux Commmnads](#linux-commmnads)
  - [Linux Notes](#linux-notes)
  - [Linux Questions](#linux-questions)

_____



## Linux Commmnads


```bash
uname
```
>tells us about the system

```bash
uname --help
```
>get help about a commmand


```bash
cat 
```
>Concaternate


```bash
ps -p $$
```
>Get current shell

```bash
history
```
>shows last 500 commands used

```bash
!<number>
```
>inputs a command from history
```bash
history -c 
```
> clear history

```bash
curl <URL> --output <filename>
```
>Transfers files to system


```bash
wget <URL> -0 <filename>
```
>Only used to download files or folders


```bash
file t <filename>
```
>Tells you what typs of file it is


```bash
mv <filename>  <new-filename>
mv <filelocation>  <newfile-location>
```
>Rename, move file


```bash
cp  <filename> <new-filename>
```
>copy file 

```bash
rm  <filename> 
```
> Remopve file

```bash
mkdir <foldername>
rm -r <foldername>
```
>Create and delete dict

```bash
touch <filename> 
```
>Create an empty file or update file timestamps.

```bash
nano <filename> 
```
>Edit contents of the file

```bash
head -<number of lines> <filename> 
```
>shows lines in the file with  the number specifed starting from the top
```bash
tail -<number of lines> <filename> 
```
>Shows lines in the file with  the number specifed starting from the bottom

```bash
nl  <filename> 
```
>Displays numbers the lines(lines that are not blank)


```bash
cat <filename> | grep chicken
```
> used to look word specific strings
```bash
sudo 
```
>Super user do

```bash
sudo apt update -y 
```
>Updates list of downloadable packages (confirms access to the intenet)


```bash
sudo apt upgrade -y
```
> Upgrades packages on system

```bash
cd /
```
>Goes to root


```bash
sudo su
exit
```
>Enter and exit super user mdoe


```bash
sudo apt install nginx -y
sudo systemctl status nginx
sudo systemctl stop nginx #shuts down the Nginx server
sudo systemctl restart nginx #turn the server off and on (updates any configureations)
sudo systemctl enable nginx #run on startup

```
>Downloads and check status of nginx web server. (go to IP address)
grep -w word (look for specifc strings with blank space each side)
systemctl = System control
```bash
kill -1 #(most graceful)
kill -15 #(used if the process has child processes)
kill -9 #(most brutal, don't use on services than contiunally writes)
```
```bash
tree
```
>shows all lower directories and files 



`Sleep 3`: runs stops terminal access  (can space out commands delays (can do things to fast))

```bash
jobs -l #Lists the background and suspended jobs running in the current shell session, -l  shows the process IDs
```


## Linux Notes

>**Color codes:**
>>White file
>>Blue Directory
>>green executable

>**Important infomation**
>>Linux does not care about file extentsions.
>
>>Linux is case sensitive
>
>>Linux has a list of what is installed and it knows where to find packages
>
>>Can update its list about new packages


LTS - long term service (supported for 5 years)
Https need ssl certificate

linux lightweight, accessable, open source, customisable(configurable)
low mainantance (stable, not mandatory updates)


## Linux Questions

>**How can we set a variable in BASH?**
```bash
#!/bin/bash

VAR="NAME" #no spaces, can be written in the terminal
```
>**What are environment variables?**

>>Global variables that can be used sytems wide. can share between applicaitons
>> usally can't be used by other programs

![variablecomapre](Imagenotes/スクリーンショット%202025-03-27%20103558.png)

>**How can we set one?**
```bash
#!/bin/bash

export VAR="NAME" (no spaces) #can be written in the terminal
```
>>exists only in the current session.

>**How can you make an environment variable persistent?**
  add the line into the .bashsrc file
  source ~/.bashrc

```bash
#!/bin/bash
source ~/.bashrc #run every time a new shell creation is created
```
>**What is a process?**
>>A instance of a program that is currently being execution, each process given a process
>>loaded into the ram and is currently being processed by the CPU, one process per core
>>

>**How can we see running processes?**
>>A instance of a program in running
whenever a command is used linux creates a new process

>**What are child processes?**
>>A new process created and used by another process

>**How can you run a process in the background, rather than the foreground?**
>>append a & at the end of the command

>**How can you end a process?**
```bash

ps 
ps -e
```
chown - change owner

printenv - prints all enviroment variables

'#!' - **shabang**
Used in scripts to specify the interpreter.
'#!/bin/bash' - the path to the shell 

>**Explain the Linux permission system to me**
>>* Read (r)  open and view content
>>* Write (w) modify the contetn or add and remove content
>>* Exectute (x) allows the content to run the file as a program or move directory to access other content

>**Explain the shorthand permission system (numbers)**
* Read (r) = 4
* Write (w) = 2
* Execute (x) = 1

The number is the sum of these values for each user category:

* Owner (User)
* Group (of users)
* Others (World)

* rwx = 4 + 2 + 1 = 7
* r-x = 4 + 0 + 1 = 5
* r-- = 4 + 0 + 0 = 4
chmod 400
R n/a n/a
>**How can you change the permissions on a file?**
chmod [permissions] [file/directory]

chmod -x
+ adds permission.

- removes permission.

= sets the exact permission.

example chmod -x



