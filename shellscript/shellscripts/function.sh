#!/bin/sh

hello() { echo "Hello $1."; }

goodbye()
{
  echo "Goodbye $1."
  echo "Goodbye $2."
}

hello Taro
goodbye Taro Jiro
