#!/bin/bash

I_ERR="requirement software installation failed"
JDKD_ERR="JDK downloading failed"
JDKI_ERR="JDK installation failed"
GRADLED_ERR="Gralde downloading failed"
GRADLEI_ERR="Gradle installation failed"
MYSQLS_ERR="MySQL service enabling failed"
DB_ERR="creating database failed"
TABLE_ERR="creating table failed"

show_err() {
    echo "What went wrong: $1"
    echo "try running vagrant reload -- provision"
    echo "when there is no problem"
    exit 1
}

#install mysql
sudo yum -y install mariadb mariadb-server wget unzip || show_err $I_ERR

#install java
cd /tmp
wget -nv --no-cookies --no-check-certificate \
--header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.rpm" \
|| show_err $JDKD_ERR

#install gradle
cd /tmp 
wget -nv https://services.gradle.org/distributions/gradle-4.8.1-bin.zip || show_err $GRADLED_ERR
mkdir -p /opt/gradle && \
unzip -d /opt/gradle /tmp/gradle-4.8.1-bin.zip || show_err $GRADLED_ERR

cd /vagrant/
/opt/gradle/gradle-4.8.1/bin/gradle wrapper || show_err $GRADLEI_ERR

sudo yum -y localinstall jdk-8u172-linux-x64.rpm || show_err $JDKI_ERR

#create db
sudo service mariadb start || show_err $MYSQLS_ERR
sudo systemctl enable mariadb || show_err $MYSQLS_ERR

mysql -uroot -e "create database if not exists app_db; " || show_err $DB_ERR

mysql -uroot app_db -e "create table next_number (number int NOT NULL AUTO_INCREMENT, PRIMARY KEY(number));" \
|| show_err $TABLE_ERR