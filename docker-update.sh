
git pull /root/cephos-aart-config/

docker-compose rm -f
docker-compose pull
docker-compose up -d

