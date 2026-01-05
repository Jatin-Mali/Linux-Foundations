# File Permissions in Linux 

Permissions helps us to decide which user or group gets the access to the
file or directory. 

A user in Linux can have atmost 3 permissions type such as 
read "r", write "w", execute "e".

Every File and Directory in our Linux system has 3 Permissions Groups:

1. Owner
2. Group
3. Others 

1. Owner:- Owner Permissions are for Owner of the file or directory, This 
   Permission group decides what permissions the owner gets. 

2. Group:- Group Permissions are for specified groups of the file or 
   directory. This applies to group assigned to the file or directory. 

3. Others:- Others are all rest of the users in the system. 

 
We can view a files permission using the command "ls -l", This provides 
additional info about a file or directory such as its permissions, owner
and group and time stamp.

As we discussed before each permission group gives 3 permission types 

1. Read
2. Write
3. Execute 


Example:- 

-rw-rw-r-- 1 linux linux 2024 Jan  5 20:08 commands.md

The first - represents that this is a file, if this was a driectory we 
would have a d instead of -. 

The "rw-" represents read and write permissions assigned to owner 
and execute permissions are not granted yet. 

The first "rw-" in the example is for Owner, the second "rw-" is for group
and the last "r--" is for others group. 

Any permission assigned to a group is defined by their appropriate letters
such as "r,w,x". If any permission is not granted it is represented with
a single hypen "-" ("rw-" in the above example denote read and write
permissions only, execute permission not granted). 

So whenever a permission is not granted it is represented with a "-". 
 

# How to Change Permissions:-

1. chown - Change Ownership of file or directory. 
2. chmod - Change Permissions. 


1. chown - it stands for changing Owner. 
 
   Now, if we want to Change the owner of a file or directory we use chown
   command. 
  
   Syntax:- sudo chown <OwnerName> <FileName>

   Example:- sudo chown Linux test.txt

   This just changes the Owner of the file or directory. But if you want 
   to change the group of a file or directory, you would write the command
   like this - 

   Syntax:- sudo chown <OwnerName>:<GroupName> <FileName>

   Example:- sudo chown Linux:LinuxGroup test.txt


2. chmod - Change mode

   If we want to Change the mode of a file or directory we use chmod command.
   To understand this we first need to understand Linux Numbering System. 
   
   So Read is assigned the value 4, write has 2 and other is 1. 
 
   Read = 4
   Write = 2
   Others = 1

 Example:- "- rw- rw- r--" 
 This Permissions is a 664. rw makes 4+2 = 6, and a single r means 4. 

 Now to change The permission we would have to use these number properly. 
 
 Lets add Execute permission to the above example. So the command would be 
 
 Example - sudo chmod 774 test.txt

 This would result in "- rwx rwx r--". 

 Now if we want to remove all the permissions of a group, we can just use 0
 to specify no permission for the specified group. 

 Common Examples - 

 644 - File baseline. Gives the owner the permission to read and write and
 read only for remanining groups.  
 755 - Directory Baseline. Gives read, write and execute for onwer, and 
 read and execute for remanining groups.  
 400 - Key pair. This is Important for Sensitive Information defining read
 only for Owner and no permission for remaning groups. 

 
