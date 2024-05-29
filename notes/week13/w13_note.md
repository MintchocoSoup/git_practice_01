# **조건문**
## 구조
```bash
if <조건문>
then
  <수행문>
  <...>
fi
``` 
  - 들여쓰기는 스크립트에서 가독성을 위해 하는게 좋다.
  - if의 종료 상태(exit status)가 0이 되면 then 구문을 한다.
- **종료 코드**
  - 0 : 성공
  - 1, 2, ... : 실패 (오류 - 매뉴얼에서 각 오류코드 확인 가능)
- **종료상태 확인하기**
  - $?
- **파이프라인 일 경우**
  - 프로그램 | 프로그램 | ... | 프로그램
    - 마지막 프로그램의 종료상태가 전체 파이프라인의 종료상태가 됨

## 참/거짓을 판단하는 프로그램
- **test**
```bash
if test <T/F 비교문>
then 
  <수행문>
fi
```
  - true일 경우 종료 상태 0으로 반환하는 프로그램
  - 비교하는 인수는 항상 띄어쓰기
  - 같다 =
  - 테스트로 판별한 인수, 변수등은 모두 ""로 감싼다.
    - null, 공백 등을 인식하지 못하는 오류가 생길 수 있기 때문
- **_Q. 자기 이름을 변수에 할당하고 빈값(null)인지 확인하는 조건문 작성하기_**
  ```bash
  name="배재현"
  
  if test "$name" = ""
  then
    echo "이름칸이 비었습니다."
  fi
  ```

## 문자열 비교연산자
- 같다: =
- 다르다: !=
- str # null
  - if test "$name"
- -n # is not null / nonzero
- -z # is null / zero

```bash

```

## test 표현식
```bash
if [ -z $name ]
then 
  echo "빈 값"
fi
```
- [, ]로 감싼다. "test" 프로그램 돌리는 표현식
- 앞뒤로 공백 넣기
  
- **_Q. 표현식으로 바꾸고 종료상태 확인하는 코드 보내기_**
```bash
name="qowogus"

if [ -z $name ]
then 
  echo "빈 값"
fi

echo $?
```

## 수치 비교
num1, num2
- -eq: equal
- -gt: greater than, >
- -lt: <
- -ge: >=
- -le: <=
- -ne: not equal
```bash
[ num1 -eq num2 ]
```
- **_Q1. count라는 변수 원하는 숫자 넣고, 10보다 작은지 판별하는 코드_**
  ```bash
  count=3
  if [ $count -lt 10 ]
  then
    echo "less than 10"
  fi
  ```
- **_Q2. count 스크립트_**
  - 전체 인수가 0이 아닐 때, "프로그램을 실행합니다"라는 문자 출력

## 종료 프로그램
exit n
- 셸 종료 코드 지정
- exit 프로그램을 사용하지 않으면 마지막 프로그램의 종료 상태가 반환된다.

## else
```bash
if [  ]
then #true
  cmd1
  cmd2
  ...
else #false
  cmd3
  ...
fi
```

## elif
```bash
if [  ]
then
  cmd1
elif [  ]
then 
  cmd2
else  
  cmd3
fi
```
- **_Q. 시간을 기준으로 인사하는 프로그램 만들기_**

## 파일 간 비교
- 파일의 형태, 빈 파일인지, 권한 등등 판별하는 연산자
- 구조: <옵션> <디렉토리/파일>
- 종류:
  - -d tmp/ : tmp가 디렉토리인지
    ```bash
    [ -d tmp/ ]
    ```
  - -f : 파일인지
  - -s : 파일이 비어있지 않은지
  - -x : executable한지
  - -r : readable한지
  - -e : exists (존재하는지)

## 논리 부정 연산자
```bash
[ ! -x file ]
```

##
(조건1) and/or (조건2)
-a
-o
```bash
[ -r file -a 3 -eq 4 ]
```
- -a 주의점
  - 조건1이 false라면 조건2는 비교하지 않는다
- **_Q. 0 < $x < 10_**
```bash
if [ $x -gt 0 -a $x -lt 10 ]
then  
  echo "correct"
fi
```
- **_Q2. "$name"이 null이 아니거나 $file이 읽기 가능할 경우_**
```bash
if [ \( $name -n \) -o \( -r $file \)  ]
```

## case 표현식
1) jan
2) fab
3) ...
12) dec

dog) 개
cat) 고양이

```bash
case 값
in 
  패턴1) cmd1
        cmd2 ;; #패턴1의 경우 ;;전까지 수행
  패턴2) ...
  *) ... #그 외의 패턴들
esac #case의 역
```
- 매칭되는 패턴 없으면 아무것도 실행하지 않는다
- **_Q. count 확장_**
  - 인수가 없으면 오류로 종료
  - 인수가 1개면 실행
    - 숫자를 달로 환산
      - 1 -> jan
      - 2 -> feb
      - ...
  - 인수가 2개 이상이면 오류로 종료

- **_Q2. 숫자, 대문자, 소문자, 특수문자 판별 스크립트_**
  - [0-9] ) echo "number" ;;

### 패턴이 여러 개인 경우
  - 패턴1 | 패턴2 ) 명령문 ;;

- **_time\_hello -> case로 바꿔보기_**
### 아무것도 하고 싶지 않을 때
```bash
if [  ]
then
  :
else
fi
```
- : -> 아무것도 하지 말기 (pass)

## &&, ||
- 프로그램1 && 프로그램2 : 1이 성공하면 2를 실행
  - 그냥 쓰면 판별식, if안에 들어가면 조건연산자
- || : 1이 실패하면 2를 실행

file을 정렬하고 file에 저장하라
- **_Q. $file이 존재하지 않으면 /etc/passwd를 변수 $file에 할당하라._**
```bash
if [ -z $file ]
then
  file=/etc/passwd
fi
```

- 프로그램1 && 프로그램2 || 프로그램3 #프로그램1이 성공하면 2, 실패하면 3을 실행
