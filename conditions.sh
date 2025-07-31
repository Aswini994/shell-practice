#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
 echo "ERROR: please run with root access"
else
    echo "you are running with root access"
fi

dnf install mysqlsfsfgd -y
if [ $? -eq 0]
then
    echo "Installing MySql is ... success"
else
    echo "Installing MySql is failing"
fi