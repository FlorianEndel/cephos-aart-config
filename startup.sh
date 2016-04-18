#! /bin/bash

echo ""
echo ""
echo "###########################################################"
echo "START"
echo `date +%Y-%m-%d\ %H:%M`
echo ""



echo ""
echo "Docker Compose STOP"
echo "#############"

/usr/local/bin/docker-compose stop
/usr/local/bin/docker-compose rm -f


### AART

echo ""
echo "CEPHOS AART"
echo "#############"

cd /root/cephos-aart
git clean -fd
git reset --hard origin/master
git pull -f

# set permissions
chmod a+w /root/cephos-aart/out.tex -R


echo ""
echo "CEPHOS AART Config"
echo "#############"

cd /root/cephos-aart-config

# remove all logs from nginx (in .dockerignore)
rm -r /root/cephos-aart-config/nginx-reverse/www/logs/*

git clean -fd
git reset --hard origin/master
git pull -f



echo ""
echo "Docker Compose START"
echo "#############"

/usr/local/bin/docker-compose pull
/usr/local/bin/docker-compose up -d

# add log directory to web
docker exec cephosaartconfig_shiny_1 ln -s /var/log/shiny-server /srv/shiny-server/log

## floe/shiny-custom:2016-04-18 --> Cairo is missing
docker exec cephosaartconfig_shiny_1 R --no-save -e 'install.packages("Cairo")'


echo ""
echo "Docker Logging"
echo "#############"

ln `docker inspect --format='{{.LogPath}}' cephosaartconfig_reverse_nginx_1` /root/cephos-aart-config/nginx-reverse/www/logs/docker_nginx.log
chmod +r /root/cephos-aart-config/nginx-reverse/www/logs/docker_nginx.log

ln `docker inspect --format='{{.LogPath}}' cephosaartconfig_shiny_1` /root/cephos-aart-config/nginx-reverse/www/logs/docker_shiny.log
chmod +r /root/cephos-aart-config/nginx-reverse/www/logs/docker_shiny.log

#chmod -R +r /root/cephos-aart-config/nginx-reverse/www/logs/shinylog



echo ""
echo ""
echo "END"
echo `date +%Y-%m-%d\ %H:%M`
echo "###########################################################"
echo ""
