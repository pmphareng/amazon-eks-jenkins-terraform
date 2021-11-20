#!/bin/bash
sudo apt-get update -y

echo "***********************Install Java JDK*************************"
# Install java
if ! java -version 2>&1 >/dev/null | grep "java version\|openjdk version" ; then
  sudo apt install default-jdk -y
fi

echo "************************Install Maven***************************"
sudo apt install -y maven

echo "***************************Install git*************************"
sudo apt install -y git

echo "**********************Install Docker engine**********************"
sudo apt-get update -y
sudo apt install docker.io -y


echo "************************Install Jenkins***********************"
# Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update -y

sudo apt-get install jenkins -y

echo "****************************Add users to Docker group************************"

sudo usermod -aG docker $USER  # add current user to docker group
sudo usermod -aG docker jenkins  # add Jenkins user to docker group


echo "****************************Start services*************************"
sudo service docker start
sudo service jenkins start