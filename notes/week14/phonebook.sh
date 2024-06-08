#!/bin/bash

name="$1"
pnum=$2

# 입력값 판별
if [ $# -ne 2 ]
then
  echo "입력 인수의 개수가 잘못되었습니다. 이름이나 전화번호에 띄어쓰기가 있는지 확인해주세요."
  exit 1
fi

numcheck=$( echo $pnum | grep [0-9] )

if [ ${#pnum} -lt 10 ]
then
  echo "입력한 전화번호가 잘못되었습니다."
  exit 2
else
  if [ ${#pnum} -eq 10 ]
  then
    # 문자열 parsing
    # ${STR:offset:length}
    localnum=${pnum:0:2}
    midnum=${pnum:2:4}
    lastnum=${pnum:6:4}

    pnum="$localnum-$midnum-$lastnum"
  elif [ ${#pnum} -eq 11 ]
    then
    localnum=${pnum:0:3}
    midnum=${pnum:3:4}
    lastnum=${pnum:7:4}

    pnum="$localnum-$midnum-$lastnum"
  else
    echo "입력한 전화번호가 잘못되었습니다."
    exit 2
  fi
fi

# 지역번호 저장
case $localnum
in
  010) localname="휴대전화";;
  02) localname="서울";;
  031) localname="경기";;
  032) localname="인천";;
  033) localname="강원";;
  041) localname="충남";;
  042) localname="대전";;
  043) localname="충북";;
  044) localname="세종";;
  051) localname="부산";;
  052) localname="울산";;
  053) localname="대구";;
  054) localname="경북";;
  055) localname="경남";;
  061) localname="전남";;
  062) localname="광주";;
  063) localname="경북";;
  064) localname="제주";;
  070) localname="인터넷 전화";;
  *) echo "지역번호가 잘못되었습니다.";
     exit 3;;
esac

# Search
search=$( cat numbook.txt | grep "$name" )
add=$( echo "$name $pnum $localname" | cat >> numbook.txt )

if [ -z "$search" ] #동일 이름이 없는 경우
then
  #echo $search
  echo "$add"
  echo "$name $pnum $localname : 정상적으로 추가되었습니다.11"

  sort numbook.txt | cat > numbook_tmp.txt
  rm numbook.txt
  mv numbook_tmp.txt numbook.txt
else #동일 이름이 있는 경우
  search=$( cat numbook.txt | grep "$pnum" )
  #echo $search
  if [ -n "$search" ] #번호까지 동일하면
  then
    echo "이미 저장된 이름과 번호입니다."
    exit 0
  else #번호까지 다르다면
    echo "$add"
    echo "$name $pnum $localname : 정상적으로 추가되었습니다.22"

    sort numbook.txt | cat > numbook_tmp.txt
    rm numbook.txt
    mv numbook_tmp.txt numbook.txt
  fi
fi
