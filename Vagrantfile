Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.synced_folder "./app", "/app"
  config.vm.network :forwarded_port, guest: 1234, host: 8080
  config.vm.provision :shell, path: "bootstrap.sh"
end
