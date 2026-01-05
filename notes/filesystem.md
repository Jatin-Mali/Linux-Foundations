# Linux Filesystem 

A linux filesystem is a set of process that controls how, where and when 
data is stored or retreived or it can be described as way to organize data
properly. A filesystem dictates how files are stored, organized and accessed. 


# But what is at the root of this filesystem?

To check this go to your root directory which is "/". You can use "cd .." to 
navigate to your root directory. 

Once you are in list out the contents using ls command. 

You will see Bunch of folders. Lets understand them. 

 bin - bin stands for Binaries, This bin directory contains command binaries
 in simple terms bin directory contains all the essential commands there are in linux.
 you can list them out using ls. 

 sbin - sbin is similar to bin. Now you would think why there is a sbin if we have a bin, or why we 
 have a bin if we have sbin. So, sbin stands for "superuser binaries"
 This sbin contains all the commands that a super user can use, it has 
 system administrator commands which are used to administer the system. 

 usr - usr contains non-essential (for boot) but important software: most
 applications, their libraries, and documentation live here.
 now you would see a bin and sbin inside usr/ directory too, and these
 bin and sbin are almost same as the bin and sbin from root folder. 
 so which one is real, if you ls both bins you will see same commands, the 
 only difference is that the bin and sbin from usr/ has more special commands
 than the root bins. 
 
 home - Personal directories for each user (e.g., /home/user123 contains 
 your files, configs, downloads). 
 
 root - Home directory for the root superuser (not the same as /)

 tmp - Temporary files created by programs/users; often cleared on reboot.

 var - Variable data like logs (/var/log), mail spools, databases that
 grow/shrink.​

 boot -  Kernel images (vmlinuz), initramfs, bootloader config (GRUB files).​

 opt - Third-party software packages (e.g., Google Chrome, manually 
 installed apps).​

 dev - Device files (hard drives like /dev/sda, USBs as /dev/sdb,
 virtual terminals /dev/tty).

 media - Auto-mount point for removable media (USB drives appear here when 
 plugged in).​

 mnt - Temporary manual mount point for filesystems (e.g., mount /dev/sdc1
 /mnt).​
 
 sys - Virtual filesystem exposing kernel/device info (CPU stats,
 hardware details).​ 


Note - As we discussed in the README.md that everything in linux is a file.
we can cp or modify or del any file from above directories. 

For Example - we can change the name of cp command by renaming the cp file 
in bin directory, we can name is copy123 and now we can use copy123 as cp 
command. 
