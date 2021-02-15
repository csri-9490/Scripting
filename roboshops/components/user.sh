#!/bin/bash

COMPONENT=user

source components/common.sh

Print "Installing NodeJS" "yum install nodejs make gcc-c++ -y"
yum install nodejs make gcc-c++ -y
Stat $?

Print "Adding RoboShop Project User" "useradd roboshop"
id roboshop || useradd roboshop
Stat $?

Print "Download User Component Code" 'curl -s -L -o /tmp/user.zip "https://dev.azure.com/DevOps-Batches/f635c088-1047-40e8-8c29-2e3b05a38010/_apis/git/repositories/8cd1d535-7b52-4823-9003-7b52db898c08/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"'

curl -s -L -o /tmp/user.zip "https://dev.azure.com/DevOps-Batches/f635c088-1047-40e8-8c29-2e3b05a38010/_apis/git/repositories/8cd1d535-7b52-4823-9003-7b52db898c08/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
Stat $?

Print  "Extract user Component Code" "rm -rf /home/roboshop/user && mkdir -p /home/roboshop/user && cd /home/roboshop/user && unzip /tmp/user.zip"
rm -rf /home/roboshop/user && mkdir -p /home/roboshop/user && cd /home/roboshop/user && unzip /tmp/user.zip
Stat $?

Print "Install NOdeJS Dependencies" "npm install"
npm install --unsafe-perm
Stat $?

chown roboshop:roboshop /home/roboshop -R

Print "Update SystemD Script for user" "sed -i -e 's/MONGO_DNSNAME/mongodb-ss.devopsb54.tk/' /home/roboshop/user/systemd.service && mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service"
sed -i -e 's/MONGO_ENDPOINT/mongodb-ss.devopsb54.tk/' -e 's/REDIS_ENDPOINT/redis-ss.devopsb54.tk/' /home/roboshop/user/systemd.service && mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service
Stat $?

Print "Start User Service" "systemctl daemon-reload && systemctl restart user && systemctl enable user"
systemctl daemon-reload && systemctl restart user && systemctl enable user
Stat $?