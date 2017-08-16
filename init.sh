#! /bin/bash

#Add the gcsfuse distribution URL as a package source and import its public key:

export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key -y add -

#Update the list of packages available and install gcsfuse.

sudo apt-get -y update
sudo apt-get -y install gcsfuse

#Install emacs
sudo apt-get -y emacs

#Install openslide
apt-get -y install openslide-tools
apt-get -y install python-openslide

#gcsfuse mount
gcsfuse -o allow_other svs_images /data/wsi/img/isb-cgc-open

#Install git
sudo apt-get -y install git

#install Docker
sudo apt-get -y install \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo add-apt-repository \
                   "deb [arch=amd64] https://download.docker.com/linux/debian \
         $(lsb_release -cs) \
         stable"

sudo apt-get update

sudo apt-get -y install docker-ce

#Start Docker:
#sudo systemctl start docker
# or
sudo service docker start

sudo gpasswd -a bcliffor docker

sudo service docker restart

newgrp docker

sudo systemctl enable docker

alias dk=docker

#install pip
sudo apt-get install python-pip

#install python google I/F
sudo pip install --upgrade google-api-python-client
