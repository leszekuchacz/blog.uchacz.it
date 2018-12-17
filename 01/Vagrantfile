# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
	config.ssh.insert_key=false

	(0..0).each do |i|
		config.vm.define "web#{i}" do |w|
		
			w.vm.box = "debian/jessie64"
			w.vm.hostname = "web#{i}"
			w.vm.network "public_network", bridge: "enp7s0", ip: "192.168.50.4#{i}"
			w.vm.provision "shell", run: "always", inline: "ip route add 192.168.11.0/24 dev eth1"
			w.vm.provision :shell, privileged: false do |s|
				ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
				s.inline = <<-SHELL
     				echo #{ssh_pub_key} >> ~/.ssh/authorized_keys
     				sudo bash -c "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys"
 				SHELL
			end
			
			w.vm.provider "virtualbox" do |vb|
				vb.memory = "1024"
				#vb.gui	= true
			end
		end
	end

	config.vm.define :db do |d|
		d.vm.box = "debian/jessie64"
		d.vm.hostname = "db"
		d.vm.network "public_network", bridge: "enp7s0", ip: "192.168.50.51"
		d.vm.provision "shell", run: "always", inline: "ip route add 192.168.11.0/24 dev eth1"
		d.vm.provision :shell, privileged: false do |s|
			ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
			s.inline = <<-SHELL
     			echo #{ssh_pub_key} >> ~/.ssh/authorized_keys
     			sudo bash -c "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys"
 			SHELL
		end
		d.vm.provider "virtualbox" do |vb|
			vb.memory = "1024"
			#vb.gui	= true
		end
	end

end
