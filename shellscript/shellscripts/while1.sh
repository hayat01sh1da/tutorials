#!/bin/sh

i=1
while [ $i -le 5 ]
do
  echo "Welcome $i times."
  i=$(( i+1 ))
done
