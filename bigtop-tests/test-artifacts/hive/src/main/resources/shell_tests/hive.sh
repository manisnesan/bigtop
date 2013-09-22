#!/usr/bin/env bash

# TODO: Eventually modify this to just run every shell script in the directory. So we dont explicitly have to specify each test and can just copy new tests into the directory.

# Create Hive Reporting Directory
#TEST_DIR=/root/ContinuousIntegration/SystemTests/Test_Reports/hive


# Run HiveMix
hive-crud.sh >> /var/log/systemtestsbt/hive 2>&1

grep -r DATABASE /var/log/systemtestsbt/hive

echo "Hive Tests Have Completed . "
cat /var/log/systemtestsbt/hive | tail
