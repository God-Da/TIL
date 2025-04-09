setwd("c:/r_wrokdata")
Sys.setlocale("LC_ALL","Korean")
library(lubridate)
library(dplyr)
library(ggplot2)


#자주 사용되는 기본 함수
#aggregate(): 다양한 함수를 사용하여 결과 출력
#apply(): 다양한 기능
#cor():상관함수
#cumsum(): 설정된 지점까지의 누적합
#cumporm(): 설정된 지점까지의 누적곱
#diff(): 차이나는 부분을 찾는다
# length(): 요소 갯수
#max() : 최대값
#min() : 최소값
#mean(): 평균
# median(): 중앙값
#order() : 요소의 원위치
# prod() : 누적곱
#range(): 범위
# rank(): 순위
#sd(): 표준편차
#rev(): 역순
#sort(): 정렬
# summary(): 요약
#sweep(): 일괄 적 빼기
# tapply() : 벡터에서 주어진 함수 연산
# var(): 분산

v1 = c(1,2,3,4,5)
v2= c('a','b','c') #max,min 빼고 다 안돼

max(v1)
max(v2)
mean(v1)
mean(v2)
sd(v1)
sum(v1)

install.packages("googleVis")
library(googleVis)
Fruits

#aggregate(계산된 컬럼~ 기준이될 컬럼, 데이터, 함수): 데이터프레임 상대로 주어진 함수값 구하기

#년도별로 판매된 수량의 합계
aggregate(Sales~Year, Fruits, sum)

#과일 별로 가장 많이 판매된 수량
aggregate(Sales~Fruit, Fruits, max)

# 과일별로 최대 판매량에 연도를 추가해서, 과일별, 년도별 최대 판매량 출력
aggregate(Sales~Fruit+Year, Fruits, max)

#apply(데이터, 행(1)열(2), 함수): matrix에 유용하게 사용(행, 열을 대상으로 작업)
m1=matrix(c(1,2,3,
            4,5,6), 2, by=T)

m1
apply(m1,1,sum)
apply(m1,2,sum)
apply(m1[,c(2,3)],2,max)

# lapply(데이터, 함수)/ sapply(데이터, 함수): list 처리 (파이썬 딕셔너리 키:값으로 이루어짐)
l1=list(Fruits$Sales)
l2=list(Fruits$Profit)
l1
l2
lapply(c(l1,l2),max) #출력결과: list형
sapply(c(l1,l2),max) #출력결과: 벡터형

#데이터프레임에서 사용(컬럼명까지 같이 출력)
lapply(Fruits[,c(4,5)],max)
sapply(Fruits[,c(4,5)],max)

# tapply(출력값, 기준컬럼, 함수): 데이터셋의 factor를 처리 
# mapply(함수, 벡터1, 벡터2, ..., 벡터n): 벡터나 리스트를 데이터프레임처럼 처리
# - 데이터프레임이 아닌 벡터나 리스트형태로 데이터가 있을 떄 마치 데이터 프레임처럼 연산을 해주는 함수. 단, 벡터들의 요소갯수가 동일해야한다.

Fruits
tapply(Sales, Fruit, sum) #이러면 결과가 안나와
tapply(Fruits$Sales, Fruits$Fruit, sum) #명시해줘야함

# 컬럼명을 변수로 직접 사용하기 : attach
# attach(Fruits): 컬럼명을 변수처럼 직접 사용 가능공통적으로 계속 사용되는 대상 프레임을 지정할때, $:dataframe$컬럼명은 입력할 데이터가 몇개 안될 때 사용

attach(Fruits)
tapply(Sales, Fruits, sum)

#판매된 과일별 합계
tapply(Sales, Fruit, sum)
aggregate(Sales~Fruit, Fruits, sum) #데이터 프레임 형태

#년도별 판매된 합계
tapply(Sales, Year, sum)
aggregate(Sales~Year, Fruits, sum) #데이터 프레임 형태

v1=c(1,2,3,4,5)
v2=c(10,20,30,40,50)
v3=c(100,200,300,400,500)
mapply(sum,v1,v2,v3) #각인덱스끼리의 계산을 해준다, 모든 벡터의 크기가 동일해야한다.

# apply()계열 함수 연습 문제
# 1-1. data1.csv파일을 읽어 data1이라는 변수로 불러온다.
data1=read.csv("C:/r_workdate/data1.csv", header=TRUE)
data1
View(data1)
 
# 1-2.연도별 합계
apply(data1[,-1],2,sum)

# 1-3.연령대별 합계
apply(data1[,c(2:15)],1,sum) #-1 이나 2:15나 똑같음

#사용자 정의 함수: 함수를 직접 만들어서 사용
#함수명 = function(인수 또는 입력값){
# 수식1
# 수식2
# ...
# return (반환 값)
#}
#
# 1. 입력 값이 없는 경우

my1=function(){
  return(10)
}

my1
my1()

# 2. 입력값(인자)이 있는 경우

my2=function(a){
  b=a^2
  return (b)
}

my2(3)

my3= function(a,b){
  c=abs(a-b)
  return(c)
}

my3(2,3)

my4=function(a,b){
  if(a>b){
    c=a-b
  }else{
    c=b-a
  }
  return(c)
}

my4(2,3)

#sort(): 정렬

s1 = Fruits$Sales
s1

sort(s1) #오름차순
sort(s1,decreasing=T) #내림차순

# plyr() : 원본 데이터를 분석하기 쉬운 형태로 나누어서 다시 새로운 형태로 만들어 주는 패키지
# - apply() 함수를 확장
# - ply(data, 기준컬럼,함수)란, 함수앞에 두글자: 첫번째 글자는 입력될 데이터 유형, 두번째 글자는 출력될 데이터유형
# - d: dataframe, a: array(matrix), l: list
# - dlply(): 입력은 dataframe 출력은 list, laply():

install.packages("plyr")
library(plyr)

f=read.csv('C:/r_workdate/fruits_10.csv')
f

# summarise : 기존 컬럼의 데이터 끼리 모은 후 함수를 적용(sql의 group by 와 유사)
# 과일 이름으로 판매량 합계 와 가격 합계를 구하여라
ddply(f, 'name', summarise, sum_qty=sum(qty),sum_price=sum(price))

#과일 이름별로 최고 판매량과 최저 가격을 구하라
ddply(f, 'name', summarise, max_qty=max(qty), min_price=min(price))

# 년도별, 과일이름별로 최고 판매량과 최저가격을 구하라.
# agreegate() 는 +로 조건추가, plyr()은 c(컴바인 함수)로 추가
ddply(f, c('year','name'), summarise, max_qty=max(qty), min_price=min(price))

# transform : 만약 동일한 컬럼이 아닌 각 행별로 연산을 수행해서 해당 값을 함께 출력해야 할 경우
# - 즉, 주어진 데이터 프레임에서 기준 컬럼으로 모은 후 계산해서 출력하고 싶은 경우 summerise, 다른 계산을 각 행별로 각각 출력하고 싶은경우 transform 사용
f
# pct_qty는 해당 과일의 판매수량이 기준 컬럼으로 합계한 총 판매갯수 대비 몇 %를 차지하는지 계산
ddply(f, 'name',transform, sum_qty=sum(qty), pct_qty=qty*100/sum(qty))

ddply(f, 'name',transform, sum_qty=sum(qty), pct_qty=round(qty*100/sum(qty),2))
































