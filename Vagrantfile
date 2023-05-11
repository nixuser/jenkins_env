Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.box_url = 'http://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64-vagrant.box'

  config.vm.define "server" do |server|
    server.vm.provision "shell",
      name: "Setup Docker",
      path: "setup_docker.sh"
    server.vm.provision "shell",
      name: "Build Jenkins image",
      path: "jenkins_build.sh"
    server.vm.provision "shell",
      name: "Start Jenkins container",
      path: "jenkins_up.sh"
    server.vm.host_name = 'controller'
    server.vm.network "forwarded_port", guest: 8080, host: 8085
    server.vm.network :private_network, 
                       ip: "10.0.0.20", 
                       virtualbox__intnet: 'ci'
  end

  config.vm.define "agentnode" do |agent|
    agent.vm.host_name = 'agent'
    agent.vm.network :private_network, 
                      ip: "10.0.0.21",
                      virtualbox__intnet: 'ci'
                         
    agent.vm.provision "shell",
      name: "Setup Docker",
      path: "setup_docker.sh"
    agent.vm.provision "shell",
      name: "Setup java",
      path: "setup_java.sh"
  end

end



