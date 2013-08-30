#!/usr/bin/env bash

# Setup environment variables
if [ -z $HIVE_HOME ]; 
   then 
     echo "No HIVE_HOME set ! export it and try again"
     exit 99; 
fi

rm -rf /tmp/root/hive.log
# Clean up Before Test
$HADOOP_HOME/bin/hadoop fs -rmr /tmp
$HADOOP_HOME/bin/hadoop fs -rmr /user/hive/warehouse

# Create the Directories for the Hive Data Warehouse
$HADOOP_HOME/bin/hadoop fs -mkdir       /tmp
$HADOOP_HOME/bin/hadoop fs -mkdir       /user/hive/warehouse
$HADOOP_HOME/bin/hadoop fs -chmod g+w   /tmp
$HADOOP_HOME/bin/hadoop fs -chmod g+w   /user/hive/warehouse

# Run Hive CRUD Test
echo "Running Hive CRUD Test" >> /tmp/hivecrud.log
echo "HIVE HOME  : $HIVE_HOME" >> /tmp/hivecrud.log 
cp -r $HIVE_HOME/examples ./examples
echo pwd > /tmp/hivetestdir 
$HIVE_HOME/bin/hive --verbose -f hive-crud.q
echo "Hive CRUD Test Completed" >> /tmp/hivecrud.log
echo ""

#Grep the exceptions
grep -A 2 -B 2 -r Exception /tmp/root/hive.log


# Condition to determine Test Case Success
if cat ./hive-crud.out | grep -q 'Time taken:'; 
   echo "succeed" >> /tmp/hivecrud.log
   then echo "TEST SUCCEEDED" 
   return 0 
else 
   echo "fail" >> /tmp/hivecrud.log 
   echo "TEST FAILED"
   return 3
fi

