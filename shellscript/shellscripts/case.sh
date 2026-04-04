#!/bin/sh

fruit="apple"
case $fruit in
  apple)
    echo "This is an apple.";;
  orange)
    echo "This is an orange.";;
  babana|grape)
    echo "This is either a bunch of banana or grape.";;
  *)
    echo "This is neither an apple, an orange, a bunch of banana nor a bunch of grape.";;
esac
