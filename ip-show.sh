#!/bin/sh

cp /etc/issue.net /etc/issue


echo "" >> /etc/issue
echo "" >> /etc/issue
echo "IP adress: " >> /etc/issue
/usr/local/bin/get-ip-address | tail -n 1 >> /etc/issue
echo "" >> /etc/issue
