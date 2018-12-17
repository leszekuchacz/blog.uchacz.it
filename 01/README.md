# Free to use 
# blog-1-Automatyzacja-rodowiska-Wirtualnego-przy-u-yciu-Ansbile-Vagrant
# snnipets from my it blog : https://blog.uchacz.it/1-automatyzacja-srodowiska-wirtualnego-przy-uzyciu-ansbile-vagrant/

git clone https://github.com/leszekuchacz/blog-1-Automatyzacja-rodowiska-Wirtualnego-przy-u-yciu-Ansbile-Vagrant.git blog1
cd blog1


# default configuration ip for this snnipet is for network 192.168.50.0/24
# chanege ip for your network in files:
# - /etc/hosts
# - VagrantFile
# - setup-all.yml

vagrant box add debian/jessie64 https://atlas.hashicorp.com/debian/boxes/jessie64 --provider virtualbox

vagrant up

cat >> /etc/hosts <<EOL
192.168.50.40 web0
192.168.50.51 db
EOL

ssh-keyscan web0 db >> ~/.ssh/known_hosts

ansible -i ./inventory.ini all -m ping -u vagrant
