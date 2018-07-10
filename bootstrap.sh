#install mysql
yum -y install mariadb mariadb-server wget

#install java
cd ~ && \
wget -q --no-cookies --no-check-certificate \
--header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.rpm"

yum -y install jdk-8u172-linux-x64.rpm

#create db
service mariadb start
systemctl enable mariadb

mysql -uroot -e "create database if not exists app_db";

mysql -uroot app_db -e "create table if not exists next_number (number int NOT NULL AUTO_INCREMENT, PRIMARY KEY(number));"

echo -e "127.0.0.1\tdb" >> /etc/hosts

#java -jar /app/nextNumberApp.jar 1234 &
