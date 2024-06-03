# for loop
- for 명령
- 동일한 작업을 정해진 횟수만큼 반복할 떄 사용한다.
- 구조:
  ```sh
  for var in var1 var2 var3 # a b c
  do
    cmd1
    cmd2
    ...
    echo $var ...
    ...
  done
  ```
- do - done 구간을 body라고 부른다
- body구간은 var개수만큼 반복이 되고, 마지막 var을 타고 종료한다.
- **_Q. file1, file2, file3을 돌면서 파일 출력하기_**
  ```sh
  for var in file[1-3]
  do
    cat $var
  done
  ```
- **_Q. 현재 디렉토리의 모든 파일에 대해서 루프를 타고자 한다._**
  ```sh
  for var in *
  do
    ...
  done
  ```
- **_Q. 파일 목록이 있고 filelist.txt에 저장되어 있다. 이 파일에 있는 모든 파일 리스트를 순회하는 코드._**
  ```sh
  for var in $( cat filelist.txt )
  ```

## in이 없는 for loop
- for file # 들어오는 모든 인수를 순회한다.
- ./simple.sh 1 2 3 4 5
- = for file in "$@"

### $* vs $@
- 입력되는 모든 인수
- 따옴표로 감싸고 아니고에 차이점
  - **$\***
    - 따옴표로 감싸면 모든 인수를 1개 취급한다.
    - 따옴표로 감싸면 null을 출력한다. 
  - **$@**
    - 따옴표로 감싸면 입력되는 인수의 따옴표를 인지해서 개수를 취급한다.
    - 인수가 null이면 loop를 타지 않는다.

# while
- 어떠한 조건이 성립할 때 까지 순회하는 반복문
- 조건이 false가 되면 탈출
- 구조:
  ```sh
  while cmd #true이면 body 순회
  do
    cmd1
    cmd2
    # cmd에 변화가 있어야 함. 안하면 무한loop
  done
  ```
**_Q. 1-5까지 출력하는 while loop_**
```sh
cmd=1
while [ $cmd -le 5 ]
do 
  echo $cmd
  cmd=$(( cmd + 1 ))
done
```

# until loop
```sh
until cmd # nonzero, false
do 
  cmd1
  cmd2
done
```
- 특정 이벤트가 일어나길 기다릴 때 사용

# break
```sh
while cmd #true이면 body 순회
do
  cmd1
  cmd2
  if [ .. ]
  then  
    break n #break 2 -> 중첩된 if, loop문의 개수를 확인하고 n의 수만큼 깨고 나감. 
  fi
  # cmd에 변화가 있어야 함. 안하면 무한loop
done
```

# 결과물 활용하기
for
...
done ###
- 파이프라인 연결하기
  ... done | echo ...
- 백그라운드 보내기
  ... done &
- 리다이렉션
  ... done > file.txt

# 한 줄로 작성하기
- 세미콜론으로 연결 가능
  ```sh
  for i in [1-5] ; do echo $1 ; done
  ```
  ```sh
  if [  ] ; then
    .....
  fi
  ```
  - do 다음에 세미콜론 넣지 않는다
  - 짧은 코드를 효율적으로 가독성 좋게

- **_Q. 로그인 된 유저를 확인하는 스크립트 작성_**
- who | 원하는 유저 이름 추출
- 인수는 1개. 그렇지 않으면 종료코드 설정, 프린트.
- 60초마다 확인하도록 프로그래밍
  - sleep 60
- echo "$user 로그인 함!"