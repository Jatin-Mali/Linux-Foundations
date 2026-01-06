# Package Management in Linux 

What is package - Package is a container that contains essential files and
meta data of a software. which helps the software run efficiently. 

Now, To manage this packages we need Package Manager. 

There are two package manager in linux. 

1. dpkg
2. apt

dpkg - Debian Package Manager. 

It is a low level Package manager used to install, remove, build and manage 
software packages that have .deb extension. 

You can only use dpkg command for files with .deb extension. 
In simple words if you wan to download a software you first need to download
.deb file of that software, than use dpkg on that .deb file. 


Example:- sudo dpkg -i <deb file> 

-i stands for install. 

Example:- Lets download discord. 

Step 1 - Download .deb for discord. 
Step 2 - Locate the .deb file. 
Step 3 - run the dpkg file, (sudo dpkg -i discord-0.0.119.deb) 


Now, For some of you it might get installed correctly, and for others it would have given you a error.

This happens cause dpkg is low level and can install all the other dependencies package required by discord. 

So you need to install those first manually then install the discord. 

To overcome this limitations, we use apt. 

apt - advanced package toolkit 

apt is much more advanced than dpkg and handles all the dependencies on its own.
It doesnt require any .deb file just run the command. 

Example - sudo apt update 

sudo apt install <package>


now you would thik why sudo apt update?

The way apt works is whenever you run a install command it searches for a
corresponding package in its storage location. 

The repo has list of all the packages. 

So the command sudo apt update simply, updates the list and fetches whole list. 

So always use sudo apt update befor any apt install command. 


We can also see where all our packages are located. 

Run - sudo apt edit-sources

This will show you the path or sources where all the packages are located. 


We can also use "help" command or -h to see other usecases of apt command. 
Such as apt -h, this shows all the parameters we can use with apt. 


# Remove Packages 

We use similar apt command with remove parameter. 

Example - sudo apt remove discord. 


This will remove the discord software only and not the user data so 
when you install it again the data remians intact.

The user data is stored like "software_name-data" for discrod it will be 
"discord-data" 

But what if you wan to completely destroy a software.

So while purging or deleting data completely you have to purge the data. 
Example - sudo apt purge discord-data





# APTITUDE PACKAGE MANAGER

There is a third package manager tool too names "aptitude" 

This is a high level tool just like apt. Think of it like apt but on steroids. 

Just run:- sudo aptitude, and see for yourself. 



# Snap 

As we have learned till here, we understood installing packages and softwares
in linux is pretty easy. 
Just sudo apt install package_name. 

But there is another easy and fast way to install applications called "snap"

Yeah, its just snap, now snap has its own snap store where people just upload
there applications and users can just donwload them easily on any system in a snap.

if you dont have snap installed on your system just install, 

Run:- sudo apt install snapd 

Example - Lets download vs-code using snap. 
 
Run:- sudo snap install --classic code

# Pip 

Similarly we also a package manager tool named pip, but this is only used to istall python packages. 

These have similar syntax like any other tool. 

Example:- pip install package_name 

if you use python3 your command would be pip3 install package_name. 

 

