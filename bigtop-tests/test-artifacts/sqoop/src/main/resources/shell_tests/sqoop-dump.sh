#!/usr/bin/env bash

TEST_DIR=Tests/sqoop
#MYSQL_TAR=mysql-5.6.10-osx10.7-x86_64.tar.gz
#MYSQL_DIR=mysql-5.6.10-osx10.7-x86_64
MYSQL_SVR=`hostname`
#MYSQL_SVR=localhost
EMPDB_TAR=employees_db-full-1.0.6.tar.bz2
EMPDB_DIR=employees_db
DRIVER=./mysql-connector-java-5.1.23-bin.jar
SQOOP_HOME=/root/ContinuousIntegration/SystemTests/ecosystem/sqoop-1.4.2.23.bin__hadoop-1.1.2.23/

# Clean up Local FileSystem before Test
#rm -rf $EMPDB_DIR

hadoop=/home/install/hadoop-1.1.2.23/bin/hadoop

# Clean up Hadoop before Test
$hadoop fs -rmr employees
$hadoop fs -rmr departments
$hadoop fs -rmr dept_emp
$hadoop fs -rmr dept_manager
$hadoop fs -rmr salaries
$hadoop fs -rmr titles

# Extract Employees DB for use as sample database

tar -zxvf $EMPDB_TAR

# Set up and install MySQL
#tar -zxvf $MYSQL_TAR
#cd $MYSQL_DIR
#scripts/mysql_install_db
#bin/mysqld_safe &
#bin/mysqladmin -u root password root

# Import the Employees DB into MySQL (requires bin/mysql -u root to view)
bunzip2 employees_db-full-1.0.6.tar.bz2
tar -xvf employees_db-full-1.0.6.tar
echo "Done extracting dir..."

dir=$(pwd)
cd ./Tests/sqoop/employees_db/
#mysql --user=root -t < employees.sql 
cd $dir

# Copy the MySQL driver into SQOOP/lib so the SQOOP import works
cp $DRIVER $SQOOP_HOME/lib

echo "Note, if faliure, please run: mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION"

# Import the Employees DB into HDFS using SQOOP
/root/ContinuousIntegration/SystemTests/ecosystem/sqoop-1.4.2.23.bin__hadoop-1.1.2.23/bin/sqoop import-all-tables --connect jdbc:mysql://$MYSQL_SVR/employees --username root 

