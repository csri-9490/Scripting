#!/bin/bash
echo iam common file executing
if [ "$USER_ID" -ne 0 ]; then
  echo -e "\e[31myou must root user\e[0m"
fi