#!/bin/bash
#This script will help users on linux servers install packages and manage the Apache services
#This script will work on RedHat and Centos Linux Servers
Author: Obinna Aliogor
echo "installing and starting the httpd service"
sleep 5
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
#chcecking the status of httpd to be sure is running 
systemctl status httpd
ps -ef | grep httpd

#CopyRight C 2022 LandMark Technologies.
author jerome odibi
echo "the makes life easier"