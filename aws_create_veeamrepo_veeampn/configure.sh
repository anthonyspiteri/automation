#!/usr/bin/env bash

#Install Veeam Repo Key and VeeamPN

sudo curl -k http://repository.veeam.com/keys/veeam.gpg | sudo apt-key add -
sudo su -c "echo 'deb http://repository.veeam.com/VeeamPN/public testing VeeamPN' > /etc/apt/sources.list.d/veeampn.list"
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install veeam-vpn-ui veeam-vpn-svc
sudo echo 'root:VeeamPN' | sudo chpasswd 