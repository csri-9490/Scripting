#!/bin/bash
#echo iam common file executing
USER_ID=$(id -u)

if [ "$USER_ID" -ne 1 ]; then
  echo -e "\e[31myou must root user\e[0m"
  exit
fi