# Jenkins demo environment used during learning sessions

To create Jenkins 

  1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
  2. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
  3. Clone repository `git clone https://github.com/nixuser/jenkins_env.git`
  4. Change directory to jenkins_env `cd jenkins_env`
  5. Run`vagrant up`
  6. Check access to web interface http://localhost:8085/ and use default password admin/123456. You can change password in jenkins_up.sh. 


Update plugins

  1. `vagrant ssh server`
  2. Find container name from `docker ps` output or use 
     `CONTAINER_NAME=$(docker ps --filter publish=8080 --format '{{.Names}}')`
  3. `docker exec -it  ${CONTAINER_NAME} bash -c "stty -onlcr && jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins_list.txt --available-updates --output txt" >  /vagrant/jenkins/plugins_list.txt`
