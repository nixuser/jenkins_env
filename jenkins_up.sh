#!/bin/bash
# login and run this command under vagrant user
sudo -u vagrant docker run --rm --name ci -d -p 8080:8080 --env adminpw=123456 --env CASC_JENKINS_CONFIG=/var/jenkins_conf -v /vagrant/casc_configs:/var/jenkins_conf --env JAVA_OPTS="-Djenkins.install.runSetupWizard=false "  -v jenkins_home:/var/jenkins_home myci:0.1
