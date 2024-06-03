#!/bin/bash

name=$1

if [ $# -ne 1 ]
then
  echo "입력값 오류"
  exit 1
fi

while true
do
  check=$( who | grep $name )
  
  if [ -n $check ]
  then
    echo "$name 로그인 함!"
    exit 0
  fi

  sleep 60
done