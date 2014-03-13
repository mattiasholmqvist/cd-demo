#Prerequisites
sudo gem install capistrano

#Running the demo (Virtualbox)
vagrant up
mvn clean install
cap dev deploy


# AWS
Create keypair
Create security group, configure private key in Vagrantfile