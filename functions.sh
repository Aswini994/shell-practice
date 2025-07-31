#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
 echo "ERROR: please run with root access"
 exit 1
else
    echo "you are running with root access"
fi

VALIDATE(){
if [ $1 -eq 0]
then
    echo "Installing $2 is success"
else
    echo "Installing $2 is failed"
    exit 1
fi

}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql not installed"
dnf install mysql -y
VALIDATE $? "mysql"
else
    echo "mysql already installed"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx not installed"
dnf install nginx -y
VALIDATE $? "nginx"
else
    echo "nginx already installed"
fi