#!/bin/bash

echo "# $0 - Main"
echo "# --------------------------------------------------"
OS_KEYWORD=$(cat /etc/os-release | grep '^NAME=' | awk -F'"' '{print $2}')

if [ "Ubuntu" = "${OS_KEYWORD}" ];then
	echo " Ubuntu"
	bash module/init_ubuntu.sh
elif [ "CentOS Linux" =  "${OS_KEYWORD}" ];then
	echo " CentOS"
	bash module/init_centos.sh
else
	echo " Unsupported OS"
	exit 9
fi

bash module/install_awscli.sh
