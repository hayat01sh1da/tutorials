#!/bin/sh
test 3 -gt 2 && echo "1"
test 3 -lt 2 && echo "2"
test 3 -gt 2 || echo "3"
test 3 -lt 2 || echo "4"
test 3 -gt 2 && echo "5" || echo "6"
test 3 -lt 2 && echo "7" || echo "8"

echo

[ 3 -gt 2 ] && echo "9"
[ 3 -lt 2 ] && echo "10"
[ 3 -gt 2 ] || echo "11"
[ 3 -lt 2 ] || echo "12"
[ 3 -gt 2 ] && echo "13" || echo "14"
[ 3 -lt 2 ] && echo "15" || echo "16"
