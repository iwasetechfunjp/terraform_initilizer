#!/bin/bash

function install_commands(){
  yum update -y
  yum install -y \
    unzip
  dnf --enablerepo=PowerTools install -y \
    groff
}

function install_terraform(){
  echo " Install yum-config-manager to manage your repositories."
  yum install -y yum-utils

  echo " Use yum-config-manager to add the official HashiCorp Linux repository."
  yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

  echo " Install."
  yum install -y  terraform
}

echo " # $0 - Main"
echo " # --------------------------------------------------"
install_commands
install_terraform
