#!/usr/bin/env bash

# TODO: Eventually modify this to just run every shell script in the directory. So we dont explicitly have to specify each test and can just copy new tests into the directory.

# Run HiveMix
/root/ContinuousIntegration/SystemTests/Tests/hive/hive-crud.sh > hive-crud.out 2>&1

grep -r DATABASE $TEST_DIR/hive-crud.out 

echo "Hive Tests Have Completed $TEST_DIR"

cat hive-crud.out | head
