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
hisotry -c 
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
>edit contents of the file

```bash
head -<number of lines> <filename> 
```
>shows lines in the file with  the number specifed starting from the top
```bash
tail -<number of lines> <filename> 
```
>shows lines in the file with  the number specifed starting from the bottom

```bash
nl  <filename> 
```
>displays numbers the lines(lines that are not blank)


```bash
cat <filename> | grep chicken
```
> used to look word specific strings
```bash
sudo 
```
>super user do

```bash
sudo apt update -y 
```
>updates list of downloadable packages (confirms access to the intenet)


```bash
sudo apt upgrade -y
```
> upgrades packages on system

```bash
cd /
```
>goes to root


```bash
sudo su
exit
```
>Enter and exit super user mdoe


```bash
sudo apt install nginx -y
sudo systemctl status nginx
```
>download and check status of nginx web server. (go to IP address
)
grep -w word (look for specifc strings with blank space each side)








## Linux Notes

>>>**Color codes:**
>>White file
>>Blue Directory


>**Important infomation**
>>Linux does not care about file extentsions.
>
>>Linux is case sensitive
>
>>Linux has a list of what is installed or it knows where to find packages
>
>>Can update its list about new packages


LTS - long term service (supported for 5 years)
Https need ssl certificate




## Linux Questions

>**How can we set a variable in BASH?**
```bash
#!/bin/bash

VAR="NAME" (no spaces)
```
>**What are environment variables?**

Global variables that can be used sytems wide. can share between applicaitons

>**How can we set one?**
```bash
#!/bin/bash

export VAR="NAME" (no spaces)
```
>>(exist only in the current session.))

>**How can you make an environment variable persistent?**
  add the line into the .bashsrc file
  source ~/.bashsrc

```bash
#!/bin/bash
source ~/.bashsrc
```
>**What is a process?**

>**How can we see running processes?**
>>A instance of a program in running
whenever a command is used linux creates a new process

>**What are child processes?**
>>A new process created and used by another process

>**How can you run a process in the background, rather than the foreground?**
>>append a & at the end of the command

>**How can you end a process?**
```bash
kill <PID>
```



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
* Group
* Others (World)

* rwx = 4 + 2 + 1 = 7
* r-x = 4 + 0 + 1 = 5
* r-- = 4 + 0 + 0 = 4

>**How can you change the permissions on a file?**
chmod [permissions] [file/directory]

+ adds permission.

- removes permission.

= sets the exact permission.

If time:

Find out how to avoid/fix the "purple screen" problem?
