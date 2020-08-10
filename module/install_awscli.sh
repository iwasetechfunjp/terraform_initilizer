#!/bin/bash

SUBDIR_PATH="/tmp"

function install_awscli(){
  curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "${SUBDIR_PATH}/awscliv2.zip"
  unzip ${SUBDIR_PATH}/awscliv2.zip -d ${SUBDIR_PATH}
  ${SUBDIR_PATH}/aws/install

  rm -rf \
    ${SUBDIR_PATH}/awscliv2.zip \
    ${SUBDIR_PATH}/aws
}

echo " $0 - Main"
echo " # --------------------------------------------------"
install_awscli
