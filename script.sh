#!/bin/bash
while :
do
  #Variable of limit
  LIM=100
  #Get the highest process
  PROCESS=$(ps aux | sort -nrk 3,3 | head -n 1 | awk '{print $2}')
  #Get the CPU usage
  CPU=$(ps -p $PROCESS -o %cpu | grep -o -E '[0-9]+')
  #Remove comma CPU usage
  VAL=${CPU:0:2}
  #Check when to kill
  #-gt is bigger than or > , complete documentation on : https://www.tldp.org/LDP/abs/html/comparison-ops.html
  if [ $VAL -gt $LIM ]; then
    kill $PROCESS
    echo "some process is use more than $LIM of CPU, it was killed!"
  fi
  echo "Press [CTRL+C] to stop.."
  sleep 1
done
