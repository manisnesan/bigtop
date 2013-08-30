#!/usr/bin/env bash

# TODO: Eventually modify this to just run every shell script in the directory. So we dont explicitly have to specify each test and can just copy new tests into the directory.
 
# Create SQOOP Reporting Directory

# Use SQOOP to dump an RDBMS Table into the HCFS
echo "(((((((((" >> /tmp/sqoop_result
pwd >> /tmp/sqoop_result
ls sqoop* >> /tmp/sqoop_result
if [ -e ./sqoop-dump.sh ]; then
     echo "exists" >> /tmp/sqoop_result
else
  echo "not exists"
  return 33
fi

echo "running..." >> /tmp/sqoop_result
chmod -R 777 ./sqoop-dump.sh
./sqoop-dump.sh > ./sqoop-dump.out
pass=$?
echo "done running... $pass" >> /tmp/sqoop_result

echo "SQOOP Tests Have Completed $pass " >> /tmp/sqoop_result
cp ./sqoop-dump.out /tmp/sqoop-dump.out
return $pass
