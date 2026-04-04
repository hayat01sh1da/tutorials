#!/bin/sh

PS3="Select item: "
select fruit in Apple Orange Banana Brape exit
do
  case $fruit in
    Apple|Orange|Banana|Grape)
      echo "$fruit is selected!";;
    exit)
      break;;
    *)
      echo "Select number from 1 to 5.";;
  esac
done
