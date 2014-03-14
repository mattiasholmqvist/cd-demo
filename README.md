# Prerequisites
* Virtualbox
* Capistrano 3.x
* Packer
* AWS credentials (for AWS example)
* Maven
* Java

# Running the demo (Virtualbox)
0. packer build cd-demo-base-ubuntu-json (in packer directory)
0.1 vagrant add box ucd-demo-base-ubuntu
1. mvn clean install
2. vagrant up
3. cap dev deploy
4. curl http://localhost:8080/hello

# AWS
1. Create keypair
2. Create security group,
3. Configure private key in Vagrantfile

4. vagrant up --provider=aws
5. cap staging deploy
6. curl http://<AWS INSTANCE IP>:8080/hello

## IMPORTANT
Right now manual changes are required in Vagrantfile for AWS example run.

