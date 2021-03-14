#!/bin/bash

COMPONENT=user

source components/common.sh

Print "Installing NodeJS" "yum install nodejs make gcc-c++ -y"
yum install nodejs make gcc-c++ -y
Stat $?

Print "Adding RoboShop Project User" "useradd roboshop"
id roboshop || useradd roboshop
Stat $?

Print "Download User Component Code" 'curl -s -L -o /tmp/user.zip "https://github.com/roboshop-devops-project/user/archive/main.zip"'

curl -s -L -o /tmp/user.zip "https://github.com/roboshop-devops-project/user/archive/main.zip"
Stat $?

Print  "Extract user Component Code" "rm -rf /home/roboshop/user && mkdir -p /home/roboshop/user && cd /home/roboshop/user && unzip /tmp/user.zip"
rm -rf /home/roboshop/user && mkdir -p /home/roboshop/user && cd /home/roboshop/user && unzip /tmp/user.zip
Stat $?

Print "Install NOdeJS Dependencies" "npm install"
npm install --unsafe-perm
Stat $?

chown roboshop:roboshop /home/roboshop -R

Print "Update SystemD Script for user" "sed -i -e 's/MONGO_DNSNAME/mongodb-ss.srikanthc.tech/' /home/roboshop/user/systemd.service && mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service"
sed -i -e 's/MONGO_ENDPOINT/mongodb-ss.srikanthc.tech/' -e 's/REDIS_ENDPOINT/redis-ss.srikanthc.tech/' /home/roboshop/user/systemd.service && mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service
Stat $?

Print "Start User Service" "systemctl daemon-reload && systemctl restart user && systemctl enable user"
systemctl daemon-reload && systemctl restart user && systemctl enable user
Stat $?
