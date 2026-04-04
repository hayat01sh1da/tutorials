#!/bin/sh
if test 3 -gt 2
then
  echo "1"
fi

if [ 3 -gt 2 ]
then
  echo "2"
fi

if test 3 -lt 2
then
  echo "3"
fi

if [ 3 -lt 2 ]
then
  echo "4"
fi
