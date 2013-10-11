#!/usr/bin/env bash

# TODO: Eventually modify this to just run every shell script in the directory. So we dont explicitly have to specify each test and can just copy new tests into the directory.
 
# Create SQOOP Reporting Directory

# Use SQOOP to dump an RDBMS Table into the HCFS
echo "(((((((((" >> /tmp/sq.log
pwd >> /tmp/sqoop_result
ls sqoop* >> /tmp/sq.log
if [ -e ./sqoop-dump.sh ]; then
     echo "exists" >> /tmp/sq.log
else
  echo "not exists"
  return 33
fi

echo "running..." >> /tmp/sq.log
chmod -R 777 ./sqoop-dump.sh
source ./sqoop-dump.sh >> /tmp/sq.log
pass=$?
echo "done running... $pass" >> /tmp/sq.log

echo "sqoop-dump.sh returned test result = $pass,  SQOOP Tests Have Completed " >> /tmp/sq.log

#Just one last check : we confirm that the directory exists.

if [ ! -a /mnt/glusterfs/employees ]; then
        echo "found employees directory in gluster mount" >> /tmp/sq.log;
else
        pass=9
fi
echo "test.sh decided sqoop test result = $? **********" >> /tmp/sq.log

exit $pass


