#!/bin/bash

echo "welcome to the script"
apt update
apt install mariadb-server
mysql_secure_installation



git clone https://itsYomie@bitbucket.org/hashimamani/game-card-scripts.git
echo "clone successful"


echo "intalation finished"

sudo systemctl start mariadb

echo "database started"

sudo mysql -e CREATE DATABASE game_card;


echo "Creating game_card database..."

git clone https://itsYomie@bitbucket.org/hashimamani/game-card-engine.git 
echo "clone successful"
cd game-card-engine
mvn spring-boot:run

cd "backend running"



git clone https://itsYomie@bitbucket.org/hashimamani/game-card-site.git
echo "clone successful"

ng build

ng serve

echo "script executed Successfully Goodbye"

exit






