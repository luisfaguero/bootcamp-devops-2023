#!/bin/bash

if dpkg -l | grep -q apache2  ; 
then
	echo "ya esta instalado"
	sudo systemctl enable apache2
	systemctl status apache2 
else 
	echo "instalando paquete"
	apt install apache2 -y

fi

