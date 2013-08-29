#!/usr/bin/env bash

# TODO: Eventually modify this to just run every shell script in the directory. So we dont explicitly have to specify each test and can just copy new tests into the directory.

# Create Hive Reporting Directory
TEST_DIR=/root/ContinuousIntegration/SystemTests/Test_Reports/hive

mkdir -p $TEST_DIR
echo "test directory = $TEST_DIR"

# Run HiveMix
/root/ContinuousIntegration/SystemTests/Tests/hive/hive-crud.sh > $TEST_DIR/hive-crud.out 2>&1

grep -r DATABASE $TEST_DIR/hive-crud.out 
echo "Hive Tests Have Completed $TEST_DIR"
cat $TEST_DIR/hive-crud.out | head
