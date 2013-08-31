#!/usr/bin/env bash

date=`date`
echo "sq logging-> $date" >> /tmp/sq.log

############################

MYSQL_SVR=`hostname`

EMPDB_DIR=employees_db
DRIVER=./mysql-connector-java-5.1.23-bin.jar

echo "done env vars " >> /tmp/sq.log
#SQOOP_HOME=/root/ContinuousIntegration/SystemTests/ecosystem/sqoop-1.4.2.23.bin__hadoop-1.1.2.23/

# Clean up Local FileSystem before Test
#rm -rf $EMPDB_DIR

#hadoop=/home/install/hadoop-1.1.2.23/bin/hadoop
hadoop=$HADOOP_HOME/bin/hadoop

# Clean up Hadoop before Test
$hadoop fs -rmr employees
$hadoop fs -rmr departments
$hadoop fs -rmr dept_emp
$hadoop fs -rmr dept_manager
$hadoop fs -rmr salaries
$hadoop fs -rmr titles

# Extract Employees DB for use as sample database

pwd >> /tmp/sq.log
echo "starting tar $EMPDB in above dir ^ " >> /tmp/sq.log

tar -zxvf $EMPDB_TAR

# Set up and install MySQL
#tar -zxvf $MYSQL_TAR
#cd $MYSQL_DIR
#scripts/mysql_install_db
#bin/mysqld_safe &
#bin/mysqladmin -u root password root

# Import the Employees DB into MySQL (requires bin/mysql -u root to view)
### Download the employees database from launchpad.  this is a standard test db 
### for sql tools.  
empdb=employees_db-full-1.0.6.tar.bz2
if [ ! -e $empdb ]; then
   echo "emp not found , downloading " >> /tmp/sq.log
   wget https://launchpad.net/test-db/employees-db-1/1.0.6/+download/$empdb
   ls -altrh >> /tmp/sq.log
   echo "done downloading ... untaring ... " >> /tmp/sq.log
   #bzip2 -cd $empdb | tar xvf -
   bunzip2 employees_db-full-1.0.6.tar.bz2
   tar -xvf employees_db-full-1.0.6.tar
   if [ ! -e ./employees_db ]; then
      echo "Couldnt find empdb " >> /tmp/sq.log
      ls -altrh >> /tmp/sq.log
      echo "Exiting..."
      exit 44 ;
   fi
fi

echo "Done extracting dir..." >> /tmp/sq.log

dir=$(pwd)
cd ./employees_db
pwd >> /tmp/sq.log
echo "^^ emplyees" >> /tmp/sq.log

### This script will drop all data and recreate it. 
mysql --user=root -t < employees.sql 
cd $dir

# Copy the MySQL driver into SQOOP/lib so the SQOOP import works
cp $DRIVER $SQOOP_HOME/lib

echo "Note, if faliure, please run: mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION"
echo "running query $MYSQL_SVR" >> /tmp/sq.log

# Import the Employees DB into File System using SQOOP
$SQOOP_HOME/bin/sqoop import-all-tables --connect jdbc:mysql://$MYSQL_SVR/employees --username root >> /tmp/sq.log

pass=$?

echo "DONE running sql query $pass " >> /tmp/sq.log

## Write results of a simple query to log. 
mysql --user=root -h localhost -e 'select * from departments' employees >> /tmp/sq.log

return $pass

