#!/bin/bash
#echo iam common file executing
USER_ID=$(id -u)

if [ "$USER_ID" -ne 1 ]; then
  echo -e "\e[1;31myou must root user\e[0m"
  #exit 1 #if we want to stop there only, don't want got o cart and catalogue
fi
#Linux os based
Print(){
  echo -e "\e[1m $(date +%c) \e[35m$(hostname) \e[0m \e[1;36m${COMPONENT}\e[0m::$1"
  #echo -e "\e[1m $(date +%c) \e[35m$(hostname) \e[0m \e[1;36m${COMPONENT}::$1"
}
#Maven based
Print(){
echo -e "[\e[1;34mINFO\e[0m]---------------------< \e[1m $1\e[0m >-----------"
echo -e "[\e[1;34mINFO\e[0m]\e[1m $2 \e[0m"
echo -e "[\e[1;34mINFO\e[0m]-----------------------------------------------"
}
stat(){
  echo -e "[\e[1;34mINFO\e[0m]-----------------------------------------------"
  if [ "$1" -eq 0 ]; then
    echo -e "[\e[1;34mINFO\e[0m] \e[1;SUCCESS \e[0m"
  else
    echo -e "[\e[1;34mINFO\e[0m] \e[1;FAILURE \e[0m"

  fi
echo -e "[\e[1;34mINFO\e[0m]-----------------------------------------------"

}
