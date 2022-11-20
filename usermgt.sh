#!/bin/bash
#This script will grant full sudoers right to users in the linux server.
#This script will work for RedHat and centos servers
echo "Please enter the name of the user you are granting the sudo right"
read name
#Verify if the user exist in the server
id $name
if [ $? -eq 0 ]
then
echo "Granting full sudoers right to $name"
sudo echo "$name ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$name
#verify that the user was added to the sudoers file
sudo grep $name /etc/sudoers
echo "$name now has a sudo right. Thank you"
else
echo "The user you entered does not exist in the Linux server"
echo "Would you like to create this user with the name $name?"
echo " Enter 'yes' to continue or 'no' to terminate"
read answer
yes=create
no=donotcreate
if [ $answer = yes ]
then
echo "Creating a user with the name $name"
sudo adduser $name
echo "Assigning password for the user $name"
echo "Enter your prefeered password"
read -s password
echo "$password" | sudo passwd "$name" --stdin
#Verify that the user has being added and assigned a password
id $name
grep $name /etc/passwd
sudo grep $name /etc/shadow
echo "$name is now created and password updated base on your input"
echo "Do you still want to continue with granting $name sudo previlages"
echo " Enter 'yes' to continue or 'no' to terminate"
read option
if [ $option = yes ]
then
echo "Granting full sudoers right to $name"
sudo echo "$name ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$name
#verify that the user was added to the sudoers file
sudo grep $name /etc/sudoers
echo "$name now has a sudo right. Thank you"
else
        echo "Thank you"
fi
else
echo "Thank you"
fi
fi
