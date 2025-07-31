#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
 echo "ERROR: please run with root access"
 exit 1
else
    echo "you are running with root access"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysqql not installed"
dnf install mysql -y
if [ $? -eq 0 ]
then
    echo "Installing MySql is ... success"
else
    echo "Installing MySql is failing"
    exit 1
fi
else
    echo "mysql already installed"
fi

