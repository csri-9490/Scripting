#!/bin/bash
#set -e  #shel script will run even there is error,so if we give 'set -e', it will stop if we get error
COMPONENT=frontend
source components/common.sh
Print "nginx insallation"  "yum install nginx -y"
yum install nginx -y
#yum install nginx -y &>/tmp/log  {if we don't want output on screen, wants in log file,need to use this}
Stat $? #$? is exit status of yumm  command

Print "Dwonlaod the frontend content" '"https://dev.azure.com/DevOps-Batches/e869c1fe-489d-4f58-b676-fb75fe4e9e12/_apis/git/repositories/18fbb315-ed99-4a65-9b79-e7eec2f3e1b1/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"'
curl -s -L -o /tmp/frontend.zip "https://dev.azure.com/DevOps-Batches/e869c1fe-489d-4f58-b676-fb75fe4e9e12/_apis/git/repositories/18fbb315-ed99-4a65-9b79-e7eec2f3e1b1/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
Stat $?
Print "remove the old documents" "cd /usr/share/nginx/html;rm -rf *"
cd /usr/share/nginx/html
rm -rf *
Print "Extract the roboshop frontend docucments "
#unzip /tmp/frontend.zip
#mv static/* .
#rm -rf static README.md
unzip /tmp/frontend.zip && mv static/* . && rm -rf static README.md  #if unzip properly then only moved to static then rm
Stat $?

Print "setup nginx config for roboshop" "mv localhost.conf /etc/nginx/default.d/roboshop.conf"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
Stat $?

Print "start nginx" "systemctl start nginx"
exit
systemctl enable nginx
systemctl restart nginx
Stat $?