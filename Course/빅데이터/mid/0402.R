setwd("c:/r_wrokdata")

Sys.setlocale("LC_ALL","Korean")

library(lubridate)

#서로 다른 데이터 타입 처리 객체
#1. list
# - 벡터와 비슷한 형태 (키,값)으로 저장

l1= list(name='홍길동',
         addr='서울',
         tel='010-1111-1111',
         pay=500)
l1

#특정 키만 조회
l1$addr

#list에 요소 추가 / 삭제
l1$birth='2003'
l1$birth

l1$name=c('고길동','마이콜')
l1$name

l1$name[length(l1$name)+1]='홍길동'
l1$name

# append()사용
l1$name = append(l1$name, '둘리',after = 1)
l1$name

# list삭제 (키:값으로 되어있어 삭제 법이 다름)
# 1. 특정 값을 삭제 
l1$name[length(l1$name)-1]=NA
l1$name

# 2. 리스트 키 삭제(키는 NA 못들어감, 무조건 값을 포함해야함, 키가 사라지고 값만 존재 할 수 없음, 키 자체를 null로 만들어야함)
l1$birth=NULL
l1$name

# 2.dataframe
# 2-1 각 컬럼(라벨)별로 먼저 생성 후 data.frame으로 모든 컬럼을 합친다.
no=c(1,2,3,4)
name=c('Apple','Banana','Peach','Graph')
price=c(500,200,100,300)
qty=c(5,2,4,7)

sales=data.frame(NO=no, NAME=name, PRICE=price, QTY=qty)
sales
class(sales)
str(sales)

# 2-2. 행렬로 생성 (다시 해)
sales2 =matrix(c(1,'Apple',500,5,
               2,'Peach',200,2,
               3,'Banana',50,4,
               4, 'Graph',100,7),4,by=T)

sales2

d1=data.frame(sales2)
d1

names(d1)= c('NO','NAME','PRICE','QTY')
d1
class(d1)
str(d1)

#데이터 조회
sales
sales$NAME
sales[1,3]
sales[,2]
sales[3,]
sales[c(1,3),]
sales[,c(2,4)]
sales[,c(1:3)]

# 원하는 조건만 검색이 가능: subset()
subset(sales,QTY<=5)
subset(sales, PRICE==200)
subset(sales, NAME=='Apple')

#데이터 추가/ 합치기: rbind(),cbind(), merge()
no=c(1,2,3)
name=c('apple','banana','peach')
price=c(100,200,300)
df1=data.frame(NO=no, NAME=name, PRICE=price)
df1

no=c(10,20,30)
name=c('train','car','ship')
price=c(1000,2000,3000)
df2=data.frame(NO=no, NAME=name, PRICE=price)

df1
df2
df3=cbind(df1,df2)
df3

df4=rbind(df1,df2)
df4

df5=data.frame(name=c('apple','banana','cherry'),price=c(300,200,100))
df6=data.frame(name=c('apple','berry','cherry'),qty=c(10,20,30))
cbind(df5,df6) #열로 합치는거라 문제 없음
rbind(df5,df6) #컬럼이 달라서 안돼

merge(df5,df6) #name을 기준으로 df5,6에 동시에 존재하는것을 합쳐줌
merge(df5, df6, all=T) # 비어있는곳은 NA

df1
# df1에 번호가 4,5이고, 이름이 'mango','berry'와 가격이 각 400,500인 데이터 생성후 df1행 추가
# 내풀이
no=c(4,5)
name=c('mango','berry')
price=c(400,500)
ee=data.frame(NO=no, NAME=name, PRICE=price)
df1=rbind(df1,ee)
df1

#교수님 풀이
n1=data.frame(NO=c(4,5),NAME=c('mango','berry'),PRICE=c(400,500))
df1=rbind(df1,n1)
df1

#수량이 (10,20,30,40,50)인 데이터를 열추가 하시오
df1=cbind(df1,qty=c(10,20,30,40,50))
df1

# 데이터프레임에서 특정 컬럼만 골라내서 새로운 형태 만들기
no=c(1,2,3,4,5)
name=c('이순신','김유신','유관순','강감찬','안중근')
addr=c('서울','대전','대구','부산','광주')
tel=c(111,222,333,444,555)
hobby=c('놀','먹','자','게','멍')
mem=data.frame(NO=no,NAME=name,ADDR=addr, TEL=tel,HOBBY=hobby)
mem 
mem2=subset(mem, select=c(NO,NAME,TEL))
mem2

mem3=subset(mem,select=-TEL)
mem3

#열 이름 바꾸기
colnames(mem3)=c('번호','이름','주소','취미')
mem3

sales
ncol(sales) #col 데이터처리: 숫자 데이터시각화: 컬러
nrow(sales)
names(sales)
colnames(sales)
rownames(sales)
row.names(sales)

#문제1, data.frame()과 c()를 조합해서 표의 내용을 데이터 프레임으로 만들어 출력해보세요
sales=data.frame(제품=c('사과','딸기','수박'),
              가격=c(1803,1901,3040),
              판매량=c(24,38,13))
sales

#문제2, 앞에서 만든 데이터 프레임을 이용해 과일 가격 평균, 판매량 평균을 구해보세요

#가격 평균
(sales[1,2]+sales[2,2]+sales[3,2])/3
sum(sales$가격)/3
mean(sales$가격)

round(mean(sales$가격),2)
#판매량 평균
(sales[1,3]+sales[2,3]+sales[3,3])/3
round(mean(sales$판매량),2)


# 데이터 수정: 변수명 바꾸기
install.packages("dplyr")
library(dplyr)

df1=data.frame(var1=c(1,2,1),
               var2=c(2,3,3))
df2=df1

df2=rename(df2, v2=var2)
df2

#변수를 조합해서 파생 변수를 만들기
df1
df1$var1_sum= df1$var1+df1$var2
df1

install.packages("ggplot2")
library(ggplot2)

mpg
View(mpg)
class(mpg)
str(mpg)
head(mpg)
tail(mpg)

mpg1=mpg
mpg1 = rename(mpg1,city=cty)
mpg1= rename(mpg1, highway=hwy)
View(mpg1)

# 작업용 데이터 읽기, 쓰기
#파일 이름 확인
setwd("C:/r_workdate")

list.files() #폴더는 확장자 없이 그냥"aaa"로 표시
list.files(all.files=T)

list.files(recursive = T) #폴더안의 파일 보기("aaa/bbb/1-4호선승하차승객수.csv" )

#scan(): 텍스트 파일을 읽어서 벡터(배열)에 저장,정수값만 읽어들임
s1=scan('scan_1.txt')
s1
s1[1]

s2=scan('scan2.txt')
s2

s2=scan('scan2.txt',what ='')  #what 옵션 시 문자열로 읽음
s2

s3=scan('scan_3.txt')
s3


s3=scan('scan_3.txt', what = '')
s3 #정수 제외하고는 what옵션 써야함

s4=scan('scan_4.txt', what='')
s4

input=scan()
input

input=scan(what='')
input

# readline(): 한 줄 읽기
input=scan()
input[3]
input2=readline("R U OK?")
input2

# readLines(): 파일을 읽어 벡터에 저장
input5=readLines("scan_4.txt")
input5 #대신 다 문자열로 읽음

#read.table(): 데이터를 읽어서 데이터 프레임에 저장
# - 주석이나 공백을 제외하고 읽음
# 기본적으로 컬럼명이 없다고 판단
f=read.table('fruits.txt')
f #컬럼명이 없다고 판단해 컬럼명을 데이터처럼 읽어옴

f=read.table('fruits.txt', header=T) #명시적표현
f

#read.csv(): csv 파일을 읽기
#read.table과 다르게 기본적으로 컬럼명이 있다고 판단
f3=read.csv("fruits_3.csv")
f3

f4=read.csv("fruits_4.csv") #기본적으로 헤더가 있다고 판단해 첫번째 데이터를 헤더로 만들어
f4

f4=read.csv("fruits_4.csv",header=F)
f4

lab=c('NO','NAME','PRICE','QTY')
f4=read.csv("fruits_4.csv",header=F, col.names=lab)
f4

#read.csv() -> wrtie.csv()
#read.table() -> write.table()

t3=read.table("csv_test.txt")
t3

#txt로 저장된 csv 파일 열기 (sep: 구분기호)
t3=read.table("csv_test.txt", sep=',' ,header = T)
t3








