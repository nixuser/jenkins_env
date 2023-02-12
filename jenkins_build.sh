#!/bin/bash
docker pull jenkins/jenkins:lts-jdk11 
docker build /vagrant/jenkins/ -t myci:0.1

# Note to update plugins list you can use 
# jenkins_update_plugins.sh
