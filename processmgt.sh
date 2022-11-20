#!/bin/bash
#This script will help anyone kill or start a process on the Linux 
#This script will work on RedHat and Centos Linux Servers
echo "Welcome to process management"
echo "Please enter the name of the process you want to terminate"
echo "You can enter the process in this form 'apache' or 'httpd'"
read name
ps -ef | grep $name
echo "what is the process Id"
read $Id
if [ $? -eq 0 ]
then
echo "Terminating the Process"
sudo kill -9 $Id
echo "The process has being terminated"
fi
echo would you like to restart the process?
echo "Enter yes to restart or 'no' to discontinue"
read answer
if [ $answer = yes ]
then
sudo systemctl enable $name
sudo systemctl start $name
sudo systemctl status $name
else
echo "You entered an inexisting process"
fi
