## I'm using Vagrant and MikroK8s to play around k8s

### Setup MikroK8s in Vagrant

1. initializes a new Vagrant environment by creating a Vagrantfile
vagrant init

2. Changes in Vagrant file
2.0 change vagrant box in Vagrant file for example to 'ubuntu/focal64' (snap pre installed)
2.1 make sure you add the followings to the Vagrant file
   vb.memory = "5024"
   vb.cpus = "2" 
3. start and ssh into the vm
vagrant up
vagrant ssh

4. install docker and minikube
4.0. I had to install core (snapd runtime environment)
sudo snap install core
sudo snap install docker
5. install minikube  
   curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
   sudo install minikube-linux-amd64 /usr/local/bin/minikube

6. start minikube 
sudo minikube start --force // TODO: why I have to use sudo and force flag?

7. install kubectl
sudo snap install kubectl --classic