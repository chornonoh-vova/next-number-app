Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.synced_folder "./app", "/app"
  config.vm.network :forwarded_port, guest: 1234, host: 8080
  config.vm.provision "shell", path: "bootstrap.sh", preserve_order: true
  config.vm.provision "shell", inline: "java -jar /app/nextNumberApp.jar 1234 &", preserve_order: true,
      run: "always"
end
