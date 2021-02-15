#!/bin/bash

COMPONENT=cart

source components/common.sh

Print "Installing NodeJS" "yum install nodejs make gcc-c++ -y"
yum install nodejs make gcc-c++ -y
Stat $?

Print "Adding RoboShop Project User" "useradd roboshop"
id roboshop || useradd roboshop
Stat $?

Print "Download Cart Component Code" 'curl -s -L -o /tmp/cart.zip "https://dev.azure.com/DevOps-Batches/f635c088-1047-40e8-8c29-2e3b05a38010/_apis/git/repositories/f62a488c-687f-4caf-9e5e-e751cf9b1603/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"'

curl -s -L -o /tmp/cart.zip "https://dev.azure.com/DevOps-Batches/f635c088-1047-40e8-8c29-2e3b05a38010/_apis/git/repositories/f62a488c-687f-4caf-9e5e-e751cf9b1603/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"

Stat $?

Print  "Extract Cart Component Code" "rm -rf /home/roboshop/cart && mkdir -p /home/roboshop/cart && cd /home/roboshop/cart && unzip /tmp/cart.zip"
rm -rf /home/roboshop/cart && mkdir -p /home/roboshop/cart && cd /home/roboshop/cart && unzip /tmp/cart.zip
Stat $?

Print "Install NOdeJS Dependencies" "npm install"
npm install --unsafe-perm
Stat $?

chown roboshop:roboshop /home/roboshop -R

Print "Update SystemD Script for cart" "sed -i -e 's/MONGO_DNSNAME/mongodb-ss.devopsb54.tk/' /home/roboshop/cart/systemd.service && mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service"
sed -i -e 's/REDIS_ENDPOINT/redis-ss.devopsb54.tk/' -e 's/CATALOGUE_ENDPOINT/catalogue-ss.devopsb54.tk/' /home/roboshop/cart/systemd.service && mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service
Stat $?

Print "Start cart Service" "systemctl daemon-reload && systemctl restart cart && systemctl enable cart"
systemctl daemon-reload && systemctl restart cart && systemctl enable cart
Stat $?