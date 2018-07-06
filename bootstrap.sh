#install mysql
sudo yum -y install mariadb mariadb-server wget

#install java
cd ~ && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.rpm"
sudo yum -y localinstall jdk-8u172-linux-x64.rpm

#create db
sudo service mariadb start
sudo systemctl enable mariadb

mysql -uroot -e "create database if not exists app_db";

mysql -uroot app_db -e "create table if not exists next_number (number int NOT NULL AUTO_INCREMENT, PRIMARY KEY(number));"

#java -jar /app/nextNumberApp.jar 1234 &
