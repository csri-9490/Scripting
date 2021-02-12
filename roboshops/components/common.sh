#!/bin/bash
#echo iam common file executing
USER_ID=$(id -u)

if [ "$USER_ID" -ne 1 ]; then
  echo -e "\e[1;31myou must root user\e[0m"
  #exit 1 #if we want to stop there only, don't want got o cart and catalogue
fi

Print(){
  echo "\e[1m $(date +%c) \e[35m$(hostname) \e[0m \e[1;36m${COMPONENT}::$1"
}