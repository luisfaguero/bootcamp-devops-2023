#!/bin/bash

REPO="bootcamp-devops-2023"

sudo apt-get update 
echo "El servidor esta actualizado"

if dpkg -l | grep -q apache2  ; 
then
	echo "ya esta instalado"
else 
	echo "instalando paquete"
	apt install apache2 -y
	systemctl start apache2
	systemctl enable apache2
fi

if [ -d "REPO" ] ; 
then 
	echo "la carpeta $REPO Existe"
else
	git clone -b  clase2-linux-bash https://github.com/roxsross/bootcamp-devops-2023.git
	fi
	echo "instalando web"
sleep 1

sudo cp -r $REPO/* /var/www/html
