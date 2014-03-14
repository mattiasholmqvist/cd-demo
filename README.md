# Prerequisites
* Virtualbox
* Capistrano 3.x
* Packer
* AWS credentials (for AWS example)
* Maven
* Java

# Running the demo (Virtualbox)
     packer build cd-demo-base-ubuntu-json (in packer directory)
     vagrant add box ucd-demo-base-ubuntu
     mvn clean install
     vagrant up
     cap dev deploy
     curl http://localhost:8080/hello

# AWS
1. Create keypair
2. Create security group,
3. Configure private key in Vagrantfile

#Commands
     vagrant up --provider=aws
     cap staging deploy
     curl http://<AWS INSTANCE IP>:8080/hello

## IMPORTANT
Right now manual changes are required in Vagrantfile for AWS example run.

