#!/bin/sh

string="Hello world!"

echo string
echo 'string'
echo "string"
echo
echo $string
echo '$string'
echo "$string"
echo
echo ${string}
echo '${string}'
echo "${string}"
echo

num=10

echo num
echo 'num'
echo "num"
echo
echo $num
echo '$num'
echo "$num"
echo
echo ${num}
echo '${num}'
echo "${num}"
echo

name=Taro
age=20

echo '$name is $age years old.'
echo "$name is $age years old."
echo
printf '%s is %d years old.\n' $name $age
printf "%s is %d years old.\n" $name $age
echo
echo '%s is %d years old.\n' $name $age
echo "%s is %d years old.\n" $name $age
