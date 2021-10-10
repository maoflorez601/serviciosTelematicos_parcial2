Vagrant.configure("2") do |config|
if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false  
  end
config.vm.define :dns do |dns|
dns.vm.box = "bento/centos-7"
dns.vm.network :private_network, ip: "192.168.50.10"
dns.vm.hostname = "dns"
dns.vm.provision "shell", path: "./provisionDNS.sh"
end
config.vm.define :firewall do |firewall|
firewall.vm.box = "bento/centos-7"
firewall.vm.network :private_network, ip: "192.168.50.12"
firewall.vm.network :public_network, ip: "192.168.50.13"
firewall.vm.hostname = "firewall"
end
config.vm.define :ftp do |ftp|
ftp.vm.box = "bento/centos-7"
ftp.vm.network :private_network, ip: "192.168.50.11"
ftp.vm.hostname = "ftp"
ftp.vm.provision "shell", path: "./provisionFTP.sh"
end
end