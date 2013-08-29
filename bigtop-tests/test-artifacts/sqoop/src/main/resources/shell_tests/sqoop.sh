#!/usr/bin/env bash

# TODO: Eventually modify this to just run every shell script in the directory. So we dont explicitly have to specify each test and can just copy new tests into the directory.

# Create SQOOP Reporting Directory
REPORT_DIR=Test_Reports
COMPONENT=Sqoop
TEST_DIR=$REPORT_DIR/$COMPONENT
mkdir $TEST_DIR


# Use SQOOP to dump an RDBMS Table into the HCFS
Tests/sqoop/sqoop-dump.sh > $TEST_DIR/sqoop-dump.out

echo "SQOOP Tests Have Completed"
