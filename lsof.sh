#!/usr/bin/env bash
find /proc/[0-9]*/fd -type l -exec ls -l {} \; > file.txt

while IFS= read -r line
do
  l=$(echo $line)
  U=`echo $l | awk '{print $3}'`
  P=$(echo $l | awk '{print $11}')
  var_pid=$(echo $l | awk '{print $9}' | grep -o "/[0-9]*/" | grep -o [0-9]* )
  var_t=$(echo $l | awk '{print $8}')
  var_d=$(echo $l | awk '{print $7}')
  var_m=$(echo $l | awk '{print $6}')
  echo $U '|' $var_m '|' $var_d '|'  $var_t '|' $var_pid '|' $P   
done < file.txt
rm -rf file.txt
