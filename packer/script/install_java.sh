#!/bin/sh
sudo apt-get install -y curl

sudo apt-get -y install python-software-properties
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -q -y update

sudo echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

sudo apt-get -y install oracle-java7-installer

sudo sh -c 'echo "\n\nJAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment'
export JAVA_HOME=/usr/lib/jvm/java-7-oracle/
