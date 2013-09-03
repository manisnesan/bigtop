#!/usr/bin/env bash

echo "Starting pig test " >> /tmp/pigout
export PIG_CLASSPATH=$HADOOP_HOME/conf
#export HADOOP_CONF_DIR=$PIG_CLASSPATH

# Clean up Before Test
$HADOOP_HOME/bin/hadoop fs -rm excite.log.bz2
$HADOOP_HOME/bin/hadoop fs -rmr script1-hadoop-results

# Clean up Pig Log Files
rm pig*.log
rm /tmp/pigout
rm /tmp/pigout-script
# Copy Data Set
$HADOOP_HOME/bin/hadoop fs -copyFromLocal data/excite.log.bz2 .

# Run Pig Tutorial 

if [ ! -f $PIG_HOME/lib/antlr-4.1-complete.jar ]; then
    echo "antlr jar File not found in $PIG_HOME/lib downloading " >> /tmp/pigout
    wget http://antlr4.org/download/antlr-4.1-complete.jar -O $PIG_HOME/lib/antlr-4.1-complete.jar
fi

$PIG_HOME/bin/pig script1-hadoop.pig &> /tmp/pigout-script

# Condition to determine Test Case Success
ls -ialtrh | grep pig >> /tmp/pigout

echo "Now testing for success.. " >> /tmp/pigout

if [ $(cat /tmp/pigout-script | grep -q 'Success!')==0 ]; 
   then echo "TEST SUCCEEDED" ;
   return 0 
else 
   echo "TEST FAILED"; 
   return 99
fi

