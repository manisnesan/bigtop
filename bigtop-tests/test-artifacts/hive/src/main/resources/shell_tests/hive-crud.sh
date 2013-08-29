#!/usr/bin/env bash

# Setup environment variables

TEST_DIR=/root/ContinuousIntegration/SystemTests/Test_Reports/hive
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
echo "Running Hive CRUD Test"
echo "HIVE HOME  : $HIVE_HOME"
cd $HIVE_HOME
echo pwd > /tmp/hivetestdir 
$HIVE_HOME/bin/hive --verbose -f hive-crud.q
echo "Hive CRUD Test Completed"
echo ""

#Grep the exceptions
grep -A 2 -B 2 -r Exception /tmp/root/hive.log

# Condition to determine Test Case Success
if cat $TEST_DIR/hive-crud.out | grep -q 'Time taken:'; 
   then echo "TEST SUCCEEDED" ; 
   return 0 
else 
   echo "TEST FAILED"; 
   return 3
fi

