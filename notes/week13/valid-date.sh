#!/bin/bash

month=$1
day=$2
year=$3

if [ $# -ne 3 ] 
then 
  echo "입력값 오류"
  exit 1
fi

case $month
in
  jan | january | 1) month=Jan;;
  feb | february | 2) month=Feb;;
  mar | march | 3) month=Mar;;
  apr | april | 4) month=Apr;;
  may | 5) month=May;;
  jun | june | 6) month=Jun;;
  jul | july | 7) month=Jul;;
  aug | august | 8) month=Aug;;
  sep | september | 9) month=Sep;;
  oct | october | 10) month=Oct;;
  nov | november | 11) month=Nov;;
  dec | december | 12) month=Dec;;
  *) echo "month 범위 초과 : $month $day $year는 유효하지 않습니다."; exit 2;;
  
esac

if [ $day -lt 1 -o $day -gt 31 ]
then
  echo "day 범위 초과 : $month $day $year는 유효하지 않습니다."
  exit 3
fi

case $month
in
  Jan | Mar | May | Jul | Aug | Oct | Dec)
    echo "$month $day $year"
    exit 0;;
  Apr | Jun | Sep | Nov)
    if [ $day -gt 30 ]
    then  
      echo "day 범위 초과 : $month $day $year는 유효하지 않습니다."
      exit 3
    else
      echo "$month $day $year"
      exit 0
    fi ;;
  Feb)
    if [ $(($year % 4)) -ne 0 ] #"$year은 윤년이 아닙니다."
    then
      if [ $day -gt 28 ]
      then  
        echo "day 범위 초과 : $month $day $year는 유효하지 않습니다."
        exit 3
      else
        echo "$month $day $year"
        exit 0
      fi
    elif [ $(($year % 400)) -eq 0 ] #"$year은 윤년입니다."
    then 
      if [ $day -gt 29 ]
      then  
        echo "day 범위 초과 : $month $day $year는 유효하지 않습니다."
        exit 3
      else
        echo "$month $day $year"
        exit 0
      fi
    elif [ $(($year % 100)) -eq 0 ] #"$year은 윤년이 아닙니다."
    then
      if [ $day -gt 28 ]
      then  
        echo "day 범위 초과 : $month $day $year는 유효하지 않습니다."
        exit 3
      else
        echo "$month $day $year"
        exit 0
      fi
    else #"$year은 윤년입니다." 
      if [ $day -gt 29 ]
      then  
        echo "day 범위 초과 : $month $day $year는 유효하지 않습니다."
        exit 3
      else
        echo "$month $day $year"
        exit 0
      fi
    fi ;; 
esac









