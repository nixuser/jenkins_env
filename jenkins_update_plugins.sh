#!/bin/bash

# Script writes new versions after plugin updates to file
# it is necessary to keep lates versions because deployment can be stopped due to dependencies error messages

CONTAINER_NAME=ci
PLUGINS=/vagrant/jenkins/plugins_list.txt
docker exec -it  ${CONTAINER_NAME} bash -c "stty -onlcr && jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins_list.txt --available-updates --output txt" >  plugins.txt
mv plugins.txt ${PLUGINS}
