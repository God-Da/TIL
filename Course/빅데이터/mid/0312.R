setwd("c:/r_workdata")
getwd()

Sys.setlocale("LC_ALL","Korean")

d1 = read.csv("야구성적.csv")
d1

install.packages("lubridate")
library(lubridate)

install.packages("installr")
library(installr)

check.for.updates.R()
install.R()

d1 = 10
print(d1)
class(d1)

d1 = '100'
class(d1)

# 1. 화면에 결과 출력
print(1+1)
1+1

# 소수점 뒷 2자리만 보임
print(pi, digit=3)
print(pi, 3)

# 하나만 보여줌
print(1, 2)
print('1', '2')

# 연결
cat(1, ":", 'a', '\n', 2, ":", "b")

# 2. 숫자형
a = 1
a <- 2     # R에서는 이 형식 권장

a = 1:20   # 1 ~ 20 까지 출력 됨됨
a

# R에서는 인덱스 번호를 1부터 시작함
a[1]
a[5]

a = 3+(4*5)
a

# 한 줄에 넣기
1+2; 2*3; 4/5

#지수
2^3
2**3

#3. 산술연산자
# +, -, *
#나누기 : 
#/ -> 나누기 결과를 실수값으로 표현
#%/% -> 몫을 정수로 표현
#%% -> 나머지

5/2
5%/%2
5%%2

# 화면에 나오는 0은 4개까지 5개 부터는 
10000
100000

1e

3e3
3e-2

# 이향연산자는 문자를 합칠 수 없음
'1' + '2'

# 강제 형변환 : as.형변환 함수
as.numeric('1')+as.numeric('2')

# 문자형 ("", '') 사용해야 함 // 안할 경우 변수 취급
'first'

first = 'a'
class(first)


# 진리 값: TRUE / FALSE
# & : AND연산 (모두가 참인 경우에 TRUE:곱하기)
# | : OR연산 (하나라도 참이면 TRUE:더하기 )
# ! : NOT연산 (반전 // TRUE면 FALSE 반환)
# 0을 제외한 모든 숫자는 TRUE

3&0
3&-3
0.3&-3

3|0
0|0

!0

# 4.NA/ NULL
# NA : 잘못된 값이 들어 올 경우 (Not Applicable, Not Available)
# NULL : 존재하지 않는 값

cat(1, NA, 2)
cat(1, NULL, 2)

sum(1, NA, 2)            # 출력: NA
sum(1, NULL, 2)          # 출력: 3


# 5. factor형 : 여러번 중복되어 나오는 데이터들을 각 값으로 모아서 대표값을 출력
# csv : 데이터 또는 컬럼을 구분하는 구분자를 ","로 해놓은 파일

t1 = read.csv("factor_test.txt")
t1

class(t1)
str(t1)

f1 = factor(t1$blood)
f1

summary(f1)


# 문제) 성별을 요약하시오.
s1 = factor(t1$sex)
summary(s1)

# 6. 날짜와 시간
# 6-1 Base 패키지로 날짜 시간 제어
Sys.Date()
Sys.time()
date()

'2025-03-12'
class('2025-03-12')

# 문제) "2025-03-12"의 문자데이터를 날짜 데이터로 바꾸고 타입을 확인하시오.
class(as.Date("2025-03-12"))

# 날짜 형태지정
# %d : 일
# %m : 월
# %Y : 년(4자리)
# %y : 년(2자리)

as.Date("03-12-2023", format="%m-%d-%Y")
as.Date("03122023", format="%m%d%Y")

# 문제) 다음 데이터를 날짜형으로 변환하여라.
# "2023년 3월 10일"

as.Date("2023년 3월 10일", format="%Y년%d월%m일")

# 기준일자를 주고 날짜 계산
as.Date(100, origin='2025-03-12')
as.Date(-100, origin='2025-03-12')

as.Date('2025-03-12')+100


