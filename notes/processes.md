# Linux Processes  

A processes is everything we do into our linux system, such as opening 
terminal or even starting our linux system is itself a process. 

we can see the current running processes using "ps" command, but that would
just give you a simple output such as only 2 process running, which will be 
terminal (shell) and the ps command itself. 

# How to View Processes 

To see all the processes running on our system we have to use. 

Example:- ps -u <Username> 

The -u parameter specifies the user whos processes we want to see. 

This will give us a bunch of process,probably hundreds.
So how do you find a specific process out of these all?

Remember Everything in Linux is file, so we can use grep command, it stands
for global regular expression print. grep can be used to find the specific 
process we want to see. 

Syntax - ps -u <UserName> | grep <ProcessName>

Example - ps -u Linux | grep firefox

This will show you firefox only with its process id, and time. 

But But But... WAITT

There is a very simple way to find process id of a process in linux. 

To do so we use - pgrep. This is a similar combination of ps and grep 
command we used above. 

Example - pgrep firefox, Yeah just that and it returns its process id. 


# How to kill a process 


To kill a process in linux we use a very simple command: kill

But we cant use just kill to kill a process, means we cant do "kill firefox".

We need the process id of firefox or any process to kill it. 

To get the process id as we discussed above we can use pgrep or ps -u <Username> | grep firefox

Once we have a process id we can just do - kill <Process id>. 

Example:- kill 21385


There are multiple signals a kill command sends, the default one is sigterm which is number 15. 

This signal may or may not kill a process. 

Some Important Signals:- 

15 - sigterm(Signal terminate) 
2 - sigint (Signal interrupt) 
19 - sigstop (Signal Stop)
18 - sigcont(Signal continue)
9 - sigkill(Signal kill) - this is most useful command cause this kills any process running on our system by 100%. 


# How to monitor Processes Realtime

We can use Commands like top and htop to do so. 

# Foreground and Background Processes. 

A foreground process is a process that runs in foreground infront of us. 

To Understand this we will use ping command. A ping command is used to 
verify if a host or network point is active or not. 

Example:- ping www.google.co.in

we can also a parameter -c to send multiple ping requests such as, 

ping -c 1000 google.co.in 

While this is running we cant actually do anything onto terminal even if it 
is running infront of us. This is a example of foreground process. 


Another Example for foreground process can be, sleep command which puts the terminal to sleep for specified amount of seconds. 

Example:- sleep 50 

sleeps for 50s. 

Now we can also put a foreground service to background. 

lets say you run ping -c 1000 google.co.in , now you cant wait for 100 responses
so just do ctrl+z. 

This will put the foreground process to sleep. 

We can also view our current running jobs or even sleep jobs just by running jobs command. 

Example:- jobs

We still havent converted our process to background, to do so just run the bg command with job id which we can obtain using jobs command. 

This will make our foreground process to background process, now this process will 
continue to run until its finished so to stop it just write 

fg and the job number. 

In short - 

bg <jobid> - for foreground to background.
fg <jobid> - for background to foreground.


To simplify this and get rid of the process to fg to bg then bg to fg. 

Just use "ping -c 1000 google.com &" The "&" makes the process go to background directly without making it foreground. 

