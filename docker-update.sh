#! /bin/bash

cd /root/cephos-aart-config
git pull -f

docker-compose rm -f
docker-compose pull
docker-compose up -d

