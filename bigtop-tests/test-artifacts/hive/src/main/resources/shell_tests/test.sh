#!/usr/bin/env bash

# TODO: Eventually modify this to just run every shell script in the directory. So we dont explicitly have to specify each test and can just copy new tests into the directory.
if [ -z $HIVE_HOME ];
   then
     echo "No HIVE_HOME set ! export it and try again"
     exit 99;
fi
rm hive-crud.out

# Run HiveMix
pwd >> /tmp/hereiam 

source ./hive-crud.sh #` #> hive-crud.out 2>&1
result=$?

echo "Hive test result $result" >> /tmp/hive_result

grep -r DATABASE $TEST_DIR/hive-crud.out 

echo "Hive Tests Have Completed $TEST_DIR"

return $result
