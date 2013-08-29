#!/usr/bin/env bash

# TODO: Eventually modify this to just run every shell script in the directory. So we dont explicitly have to specify each test and can just copy new tests into the directory.

echo "Making flume dir"
mkdir /mnt/glusterfs/flume

# Create Flume Reporting Directory

REPORT_DIR=Test_Reports
COMPONENT=Flume
TEST_DIR=$REPORT_DIR/$COMPONENT/
mkdir $TEST_DIR

# Use Flume to create an agent that gathers log events and then pipes them into the HCFS

echo "Starting flume" 

Tests/flume/flume-sink.sh # > $TEST_DIR/flume-sink.out 2>&1

echo "Flume Tests Have Completed"
