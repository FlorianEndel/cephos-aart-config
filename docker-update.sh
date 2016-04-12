#! /bin/bash


cd /root/cephos-aart
git clean -fd
git reset --hard origin/master
git pull -f


cd /root/cephos-aart-config
git reset --hard origin/master
git pull -f

docker-compose rm -f
docker-compose pull
docker-compose up -d

