#!/bin/bash

if dpkg -l | grep -q apache2  ; 
then
	echo "ya esta instalado"
else 
	echo "instalando paquete"
	apt install apache2 -y
fi

