#!/bin/bash

clone-game-card-db(){

if [ -d "/game-card-scripts/" ]
  then
  echo " Error folder exist"
  
  elif
git clone https://itsYomie:ATBBvYYQffnupNWmAttG8fYZycJJA9916BF3@bitbucket.org/hashimamani/game-card-scripts.git
  then
   echo "clone Successful"
   else
   echo "Error cannot clone"
   fi

}


configure-mariadb(){


#sudo dnf module install mariadb -y
#sudo systemctl enable mariadb
#sudo systemctl start mariadb

sudo mysql -e "CREATE DATABASE IF NOT EXISTS game-card"
sudo mysql -u root   game-card< game_card.sql




}

clone-game-card-engine(){

if [ -d "/game-card-engine/" ]
  then
  echo " Error folder exist"
  
  elif
  
git clone https://itsYomie:ATBBvYYQffnupNWmAttG8fYZycJJA9916BF3@bitbucket.org/hashimamani/   game-card-engine.git
 
  then
  echo " cloned successful"
  cd game-card-engine
  
  mvn package
  
  cd target
  
  nohup java -jar game-card-engine.jar --server.port=9000 &
  
  echo "backend running"
  
  else
  #sudo apt-get purge mariadb-server
  echo "Error clone failed"
   fi
}


clone-game-card-site(){

cd ..
cd ..



if [ -d "/game-card-site/" ]
then 
 echo " Error folder exist"
 
 elif
 git clone https://itsYomie:ATBBvYYQffnupNWmAttG8fYZycJJA9916BF3@bitbucket.org/hashimamani/game-card-site.git
 then
 echo "clone successful"
 
 cd game-card-site
 npm install
 
 
 ng build
 
 nohup ng serve &
 
 xdg-open http://localhost:4200/
 echo "site is running"
 fi
}

clone-game-card-db
configure-mariadb
clone-game-card-engine
clone-game-card-site

