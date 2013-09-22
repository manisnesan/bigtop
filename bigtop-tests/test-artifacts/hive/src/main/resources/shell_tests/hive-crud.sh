#!/usr/bin/env bash

# Setup environment variables
if [ -z $HIVE_HOME ]; 
   then 
     echo "Missing hive home " >> /var/log/systemtestsbt/hive
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
echo "Running Hive CRUD Test" >> /var/log/systemtestsbt/hive
echo "HIVE HOME  : $HIVE_HOME" >> /var/log/systemtestsbt/hive
cp -r $HIVE_HOME/examples ./examples
pwd >> /var/log/systemtestsbt/hive
$HIVE_HOME/bin/hive --verbose -f hive-crud.q
result=$?
echo "Hive CRUD Test Completed , crud return code: $result" >> /var/log/systemtestsbt/hive
echo ""

#Grep the exceptions
grep -A 2 -B 2 -r Exception /tmp/root/hive.log

# Condition to determine Test Case Success
grepresult= cat /var/log/systemtestsbt/hive | grep -q 'Time taken:';
echo "grep -> $grepresult ret-> $result"

test $result -eq 0
testresult=$?
echo "Test result : $testresult" 
if [ $testresult == 0 ]; then
   echo "hive succeed" >> /var/log/systemtestsbt/hive
   echo "TEST SUCCEEDED" 
   return 0 
else 
   echo "hive fail grep result was:$grepresult return from crud was :$result" >> /var/log/systemtestsbt/hive 
   echo "TEST FAILED"
   return 3
fi

