#install mysql
sudo yum -y install mariadb mariadb-server

#install java
sudo yum -y install java-1.8.0-openjdk

#create db
sudo service mariadb start
sudo service mariadb enable

mysqladmin -uroot create app_db;

mysql -uroot app_db -e "create table next_number (number int NOT NULL AUTO_INCREMENT, PRIMARY KEY(number));"

#java -jar /app/nextNumberApp.jar 1234 &
