#!/bin/bash

for i in apple-apple-apple apple-apple-orange apple-apple-grape
do
  echo ${i/apple/banana}
done

echo

for i in apple-apple-apple apple-apple-orange apple-apple-grape
do
  echo ${i//apple/banana}
done
