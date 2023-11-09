#!/bin/bash
#Variable

REPO="bootcamp-devops-2023"



sudo apt-get update 
echo "El servidor esta actualizado"

sudo apt install -y git
echo -e "\n\033[33mGit se ha instalado\033[0m\n"

if dpkg -s mariadb-server > /dev/null 2>&1 ;
then
    echo -e "\n${LBLUE}El Servidor se encuentra Actualizado ...${NC}"
else 
    echo -e "\n${LYELLOW}instalando MARIA DB ...${NC}"
    sudo apt install -y mariadb-server

fi
    sudo systemctl start mariadb
    sudo systemctl enable mariadb

 
    mysql -e "
    CREATE DATABASE devopstravel;
    CREATE USER 'codeuser'@'localhost' IDENTIFIED BY 'codepass';
    GRANT ALL PRIVILEGES ON *.* TO 'codeuser'@'localhost';
    FLUSH PRIVILEGES;"


    





if dpkg -l | grep -q apache2 ;
then
    echo -e "\n\e[96mApache esta realmente instalado \033[0m\n"
else    
    echo -e "\n\e[92mInstalando Apache2 ...\033[0m\n"
    sudo apt install -y git apache2
    sudo apt install -y php libapache2-mod-php php-mysql php-mbstring php-zip php-gd php-json php-curl


fi
    systemctl start apache2
    systemctl enable apache2
    

 



if [ -d "REPO" ] ; 
then 
        echo "la carpeta $REPO Existe"
else
 git clone -b  clase2-linux-bash https://github.com/roxsross/bootcamp-devops-2023.git
fi
echo "instalando web"
sleep 1
mv /var/www/html/index.html /var/www/html/index.html.bkp
sudo cp -r $REPO/app-295devops-travel/* /var/www/html
mysql < database/devopstravel.sql
systemctl reload apache2

