#! /bin/bash

echo ""
echo ""
echo ""
echo "###########################################################"
echo ""



### AART

echo ""
echo "CEPHOS AART"

cd /root/cephos-aart
git clean -fd
git reset --hard origin/master
git pull -f


echo ""
echo "CEPHOS AART Config"

cd /root/cephos-aart-config
git reset --hard origin/master
git pull -f



echo ""
echo "Docker Compose"

/usr/local/bin/docker-compose stop
/usr/local/bin/docker-compose rm -f
/usr/local/bin/docker-compose pull
/usr/local/bin/docker-compose up -d

