#!/usr/bin/env bash

# TODO: Eventually modify this to just run every shell script in the directory. So we dont explicitly have to specify each test and can just copy new tests into the directory.

# Create Pig Reporting Directory

# Run PigMix
date=`date`
source ./pig-tutorial.sh > "/tmp/pig-tutorial.out-$date" 2>&1
result=$?
echo "returning result " >> "/tmp/pig-tutorial.out-$date"
return $result
