#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
 echo "ERROR: please run with root access"
 exit 1
else
    echo "you are running with root access"
fi

PACKAGES=("nginx", "nodejs")

VALIDATE(){
if [ $1 -eq 0]
then
    echo "Installing $2 is success"
else
    echo "Installing $2 is failed"
    exit 1
fi

}

for package in ${PACKAGES[@]}
do
dnf list installed $package
if [ $? -ne 0 ]
then
    echo "$package not installed"
dnf install $package -y
VALIDATE $? "$package"
else
    echo "$package already installed"
fi
done
