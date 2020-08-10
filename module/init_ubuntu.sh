#!/bin/bash

function install_terraform(){
  echo " Add the HashiCorp GPG key."
  curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
  
  echo " Add the official HashiCorp Linux repository."
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
  
  echo " Update and install."
  apt-get update && apt-get install terraform
}

function install_commands(){
  apt-get update
  apt-get -y install \
    vim           		\
    git           		\
    curl          		\
    gnupg	        	\
    lsb-release			\
    software-properties-common	\
    groff			\
    unzip
}

echo '# Main'
echo '# --------------------------------------------------'
install_commands
install_terraform
