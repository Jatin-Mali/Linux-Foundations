# Services in Linux

Lets Understand what services are, services can be referred as processes that complete a task. 

A process is a instance of a running program. 

There are multiple process running in your linux system all the time, that makes 
your system run properly. 

Now, everytime you open a application, or even run a command a new process starts. 
These processes are handled by "daemons".

# Daemon

Daemon are processes or services that continously keep running in the background. 
They are hidden from users and these daemons make it possible for a system to run properly. 

Daemons can be referred as the parent process that controls or lets say takes all the shots during a process. 
They Run directly in the background without any user interaction to provide essential system services. 

Daemons usually start during the system boot process and continue running until the systems shutdown. 

Now, the first ever daemon or process or service that starts in our linux system is systemd. 

systemd is parent process of all the process running onto linux. 

A daemon process can be recognized by the letter d at the end of a prcess. 

such as - systemd, sshd, ntpd etc. 

The d appended at the end denotes this is a daemon process. 


# How to Manage Daemons

To control or Manage the daemons all by ourselves we have to control the master daemon. 
which is, you guessed it right "systemd". 

As we know, systemd is the master daemon that can start, stop, restart all the other daemons. 

Systemd has two main jobs - 

It is a Service manager that manages all the services. As we all know. 

It is also a initialization system, or also called init system. which ia very vital process for booting the OS. 

You can visualize all the process using process tree. 

Run: pstree

As systemd is the first process to run on the system, its process id is always 1.

Now lets get to the point, controlling the daemons. 

To control all the daemons we have to control the service manager. 

Which we can do using the command "systemctl".

Before we jump right into messing with daemons, understand this - 

systemd doesnt talk or control the other daemons using their names, it uses a term call units.

So units = daemons (For systemd). 

We will take sshd for example - 

Disclaimer - If you are using your linux OS do not run this commmand this will break your system. 

Jokes aside, it wont break anything but you will be logged out immediately. 

Better use a cloud based terminal, such as hackthebox or linode. 

Stop - sudo systemctl stop sshd

If you run this you wont know if it actually stopped or not. 

To see - 

Run: sudo systemctl status sshd. 

Start - start the daemon again - sudo systemctl start sshd. 


Restart - Stop the daemon and start it again. 

Run: sudo systemctl restart sshd. 

Reload - Means if you dont want to stop or restart the sshd but reload it. 

Run: sudo systemctl reload sshd. 

Note -  Not all the daemons can reload, it depends on their configuration. 

if you are not sure if a daemon can reload or not you can use command. 

sudo systemctl reload-or-restart sshd. 

This will reload it, if it can, it not then restart it. 


If you want to disable a daemon from starting after the boot. or during the boot process, you can just 

Run: sudo systemctl disable sshd

Now you sholudnt do this though, just for understading purposes.


If you want to enable it 

Run: sudo systemctl enable sshd 

If you want to check if a daemon is active or not. 

Run: sudo systemctl is-active sshd. 

If you want to check if a daemon is enabled or not. 

Run: sudo systemctl is-enabled sshd.


# View All daemons 

Run: sudo systemctl list-units

This only shows active daemons 

If you want all 

Run: sudo systemctl list-units --all 


# View Daemon Logs

To view all the Daemon logs we have a command "jorunalctl"

So Run: sudo journalctl -xe


