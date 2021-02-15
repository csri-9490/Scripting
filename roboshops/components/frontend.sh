#!/bin/bash

COMPONENT=frontend

source components/common.sh

Print "Installing Nginx" "yum install nginx -y"
yum install nginx -y
Stat $?

Print "Downloading Frontend Content" 'curl -s -L -o /tmp/frontend.zip "https://dev.azure.com/DevOps-Batches/e869c1fe-489d-4f58-b676-fb75fe4e9e12/_apis/git/repositories/18fbb315-ed99-4a65-9b79-e7eec2f3e1b1/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"'

curl -s -L -o /tmp/frontend.zip "https://dev.azure.com/DevOps-Batches/e869c1fe-489d-4f58-b676-fb75fe4e9e12/_apis/git/repositories/18fbb315-ed99-4a65-9b79-e7eec2f3e1b1/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
Stat $?


Print "Remove Old Docs" "cd /usr/share/nginx/html ;rm -rf *"
cd /usr/share/nginx/html
rm -rf *
Stat $?

Print "Extract RoboShop Frontend Docs" "unzip /tmp/frontend.zip"
unzip /tmp/frontend.zip && mv static/* . && rm -rf static README.md
Stat $?

Print "Setup Nginx Config for RoboShop" "mv localhost.conf /etc/nginx/default.d/roboshop.conf"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
Stat $?


Print "Starting Nginx Service" "systemctl start nginx"
systemctl enable nginx
systemctl restart nginx
Stat $?