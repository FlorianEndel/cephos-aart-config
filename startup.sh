#! /bin/bash

echo ""
echo ""
echo "###########################################################"
echo "START"
echo `date +%Y-%m-%d\ %H:%M`
echo ""



### AART

echo ""
echo "CEPHOS AART"
echo "#############"

cd /root/cephos-aart
git clean -fd
git reset --hard origin/master
git pull -f


echo ""
echo "CEPHOS AART Config"
echo "#############"

cd /root/cephos-aart-config
git clean -fd
git reset --hard origin/master
git pull -f



echo ""
echo "Docker Compose"
echo "#############"

/usr/local/bin/docker-compose stop
/usr/local/bin/docker-compose rm -f
/usr/local/bin/docker-compose pull
/usr/local/bin/docker-compose up -d


echo ""
echo "Docker Logging"
echo "#############"

ln `docker inspect --format='{{.LogPath}}' cephosaartconfig_reverse_nginx_1` /root/cephos-aart-config/nginx-reverse/www/logs/docker_nginx.log
chmod +r /root/cephos-aart-config/nginx-reverse/www/logs/docker_nginx.log

ln `docker inspect --format='{{.LogPath}}' cephosaartconfig_shiny_1` /root/cephos-aart-config/nginx-reverse/www/logs/docker_shiny.log
chmod +r /root/cephos-aart-config/nginx-reverse/www/logs/docker_shiny.log

ln /srv/shinylog/ /root/cephos-aart-config/nginx-reverse/www/logs/shinylog/
chmod -R +r /root/cephos-aart-config/nginx-reverse/www/logs/shinylog/

echo ""
echo ""
echo "END"
echo `date +%Y-%m-%d\ %H:%M`
echo "###########################################################"
echo ""
