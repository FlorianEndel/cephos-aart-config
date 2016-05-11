#!/bin/sh

cp /etc/issue.net /etc/issue


echo "" >> /etc/issue
echo "" >> /etc/issue
echo "IP adress: " >> /etc/issue
/root/cephos-aart-config/ip-get.sh | tail -n 1 >> /etc/issue
echo "" >> /etc/issue
