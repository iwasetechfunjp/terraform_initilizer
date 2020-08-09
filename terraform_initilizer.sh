#!/bin/bash

function init_ubuntu(){
  apt-get update
  apt-get -y install \
    vim		\
    git		\
    curl		\
    gnupg		\
    lsb-release	\
    software-properties-common
  
  echo " Add the HashiCorp GPG key."
  curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
  
  echo " Add the official HashiCorp Linux repository."
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
  
  echo " Update and install."
  apt-get update && apt-get install terraform
}

function init_centos(){
  yum update -y

  echo " Install yum-config-manager to manage your repositories."
  yum install -y yum-utils

  echo " Use yum-config-manager to add the official HashiCorp Linux repository."
  yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

  echo " Install."
  yum -y install terraform
}

echo "# Main"
echo "# --------------------------------------------------"
OS_KEYWORD=$(cat /etc/os-release | grep '^NAME=' | awk -F'"' '{print $2}')

if [ "Ubuntu" = "${OS_KEYWORD}" ];then
	echo " Ubuntu"
	init_ubuntu
elif [ "CentOS Linux" =  "${OS_KEYWORD}" ];then
	echo " CentOS"
	init_centos
else
	echo " Unsupported OS"
	exit 9
fi
