# Try out Nix in VM

To be able to test nix in an isolated env, I have created a virtual machine with [Vagrant](https://www.vagrantup.com/)

#### Create a VM and ssh into it:
`vagrant init ubuntu/bionic64`    
`vagrant up`  
`vagrant ssh`  

#### Install nix in VM:
`sh <(curl -L https://nixos.org/nix/install)`   
`. /home/vagrant/.nix-profile/etc/profile.d/nix.sh` To ensure that the necessary environment variables are set  
`nix-env --version` To verify installation

Start the by shell.nix:  
`cd /vagrant/`  
`nix-shell`
