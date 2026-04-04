#!/bin/sh

str=apple-watermelon-pear

echo ${str#*-}
echo ${str##*-}
echo ${str%-*}
echo ${str%%-*}
