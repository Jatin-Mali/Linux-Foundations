#!/usr/bin/zsh

echo -e "This is a Script for Demonstrating Permissions in Linux \n"


echo "Creating a user " 

sudo adduser linux_user123

echo "user linux123 created"

echo "Creating a new Group"

sleep 1

sudo addgroup testgroup

echo "New group created: testgroup"
sleep 1

echo "Adding linux_user123 to testgroup"

sudo usermod -a -G testgroup linux_user123

echo "Added" 


echo "Creating New Directory.."

mkdir test

echo "Permissions of the test directory "

ls -ld test

echo "Changing Owner of the Directory.."

sudo chown linux_user123 test
ls -ld test

echo "Changing Group of the directory.."
sudo chown linux_user123:testgroup test
ls -ld test

echo "Owner and Group Changed"

echo "removing all the permissions of the test and other groups"

sudo chmod 600 test

echo "Permissions Removed" 

echo "Deleting test Directory.."

sudo rm -r test

echo "Deleted"
 
echo "Deleting the user.."
sudo userdel -r linux_user123
echo "Deleting the Group.."
sudo groupdel testgroup

echo "User and Group deleted."




