#!/usr/bin/env bash

# TODO: Eventually modify this to just run every shell script in the directory. So we dont explicitly have to specify each test and can just copy new tests into the directory.
if [ -z $HIVE_HOME ];
   then
     echo "No HIVE_HOME set ! export it and try again"
     exit 99;
fi
mkdir /var/log/systemtestsbt

rm -f /var/log/systemtestsbt/hive

# Run HiveMix
pwd >> /var/log/systemtestsbt/hive

source ./hive-crud.sh #` #> hive-crud.out 2>&1
result=$?

echo "Hive test result $result" >> /var/log/systemtestsbt/hive

grep -r DATABASE /var/log/systemtestsbt/hive 

echo "Hive Tests Have Completed $TEST_DIR"

exit $result
