setwd("c:/r_workdata")

Sys.setlocale("LC_ALL", "Korean")

library(lubridate)
library(dplyr)
library(ggplot2)
library(googleVis)

library(plyr)


# =====================================================
# 5. 히스토그램 : hist()
# =====================================================
# - 특정 데이터의 빈도수를 막대 형태로 시각화
# - hist(데이터, main = "제목")

h = c(182, 175, 167, 163, 172, 181, 166, 159, 155)
hist(h, main = "HIST")

# =====================================================
# 6. 원형 그래프 : pie()
# =====================================================
# - 전체 합이 100이 되는 비율 데이터를 원형으로 표현
# - pie(데이터, 옵션)
p1 = c(11, 19, 33, 37)
pie(p1)

# 6-1. 기본 옵션: 반지름, 시작각도
pie(p1, radius = 1, init.angle = 90)
## radius => 1 원, 2 사각형

# 6-2. 색상, 라벨 추가
pie(p1, radius = 1, init.angle = 90, 
    col = rainbow(length(p1)), 
    labels = c('w1','w2','w3','w4'))

# 6-3. 퍼센트(수치값) 표시 : paste() 이용
pct = round(p1/sum(p1)*100, 1)
lab = paste(pct, '%')
pie(p1, radius = 1, init.angle = 90, 
    col = rainbow(length(p1)), 
    labels = lab)

# 6-4. 범례 추가
legend(0.8, 1.1, 
       c('w1','w2','w3','w4'), 
       cex = 0.5, 
       fill = rainbow(length(p1)))


# 6-5. 이름 + 비율 표시
lab1 = c('w1','w2','w3','w4')
lab2 = paste(lab1, '\n', pct, '%')
pie(p1, radius = 1, init.angle = 90, 
    col = rainbow(length(p1)), 
    labels = lab2)

# =====================================================
# 7. 입체 원형 그래프 : pie3D()
# =====================================================
# - pie3D(데이터, 옵션)
install.packages("plotrix")
library(plotrix)

pct = round(p1/sum(p1)*100,1)
lab1 = c('w1','w2','w3','w4')
lab2 = paste(lab1, '\n', pct,'%')

# pie랑 같지만 init.angle은 없음 , 
pie3D(p1, radius = 1, 
      col = rainbow(length(p1)), 
      labels = lab2, 
      explode = 0.05)     # explode: 조각조각 얼만큼 떨어지게 할꺼냐

# =====================================================
# 8. 상자 차트 : boxplot()
# =====================================================
# - 최소값, 최대값, 중앙값, 사분위수를 시각화
# - boxplot(데이터들, col = c("색1", "색2"), main = "제목", horizontal = T)

v1 = c(10, 12, 15, 11, 20)
v2 = c(5, 7, 15, 8, 9)
v3 = c(11, 20, 15, 18, 13)
boxplot(v1, v2, v3)

boxplot(v1, v2, v3, 
        col = c('blue', 'yellow', 'red'), 
        names = c('BLUE', 'YELLOW', 'RED'), 
        horizontal = T)


# =====================================================
# 9. 관계도 시각화 : igraph()
# =====================================================
# - 연관된 데이터들의 관계를 연결해 시각적으로 표현 (소셜 네트워크 등)
install.packages("igraph")
library(igraph)

# 9-1. 기본 관계도: 숫자 쌍 연결 1 -> 2
g1 = graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6))  
plot(g1)  # 5,5 자기 자신과의 연결(자기loop)

# 9-2. 사람 이름 기반 관계도
# - 직원 간의 상하 관계를 네트워크로 시각화
# - 각 직원과 상사의 관계를 엣지(edge)로 표현
# - 방향 있는 그래프(directed = T)로 상사 → 부하 관계를 나타냄

# 1. 직원 이름
name = c('홍길동대표', '일지매부장', '김유신과장', 
         '손흥민대리', '윤봉길대리', '이순신부장', 
         '유관순과장', '신사임당대리', '강감찬부장', 
         '광개토과장', '정몽주대리') 

# 2. 각 직원의 상사 이름
pemp = c('홍길동대표','홍길동대표', '일지매부장',
         '김유신과장','김유신과장','홍길동대표', 
         '이순신부장','유관순과장', '홍길동대표',
         '강감찬부장','광개토과장') 

# 3. 직원-상사 관계를 데이터프레임으로 생성
emp = data.frame(이름 = name, 상사이름 = pemp)
emp

# 4. igraph용 관계 그래프 생성
# - graph.data.frame(): 엣지 정보만 있어도 노드를 자동 생성
# - directed = TRUE : 화살표 방향 있는 네트워크 구성
g = graph.data.frame(emp, directed = T)

# 5. 관계 그래프 시각화 (이름 포함)
# - layout.fruchterman.reingold : 노드가 안겹치게 균형 배치
# - vertex.size : 노드 크기
# - edge.arrow.size : 화살표 크기
plot(g, layout = layout.fruchterman.reingold, vertex.size = 5, edge.arrow.size = 0.3)

# 6. 관계 그래프 시각화 (이름 생략)
# - vertex.label = NA : 노드 이름 없이 관계만 시각화
plot(g, 
     layout = layout.fruchterman.reingold, 
     vertex.size = 5, 
     edge.arrow.size = 0, 
     vertex.label = NA)

# 9-3. 그래프 새 창으로 열기
dev.new()
plot(g, 
     layout = layout.fruchterman.reingold, 
     vertex.size = 5, 
     edge.arrow.size = 0.3)

# 9-4. 이미지 저장
# - savePlot(): R GUI 환경에서만 사용 가능
savePlot('network.png', type = 'png')

# 9-5. 웹 브라우저 기반 시각화 (d3Network 패키지)
install.packages("devtools") 
library(devtools)   # GitHub 설치용
install_github("christophergandrud/d3Network")
install.packages("RCurl") 
library(RCurl)      #통신 지원용
library(d3Network)  #실제 그래프 출력용

# HTML 파일로 저장 및 브라우저에서 확인
d3SimpleNetwork(emp, 
                width = 600, 
                height = 600, 
                file = 'c:/r_workdata/d3.html')


# =====================================================
# 데이터 정제 : 불필요하거나 잘못된 정보를 수정·삭제·변환하는 과정
# =====================================================
# 🟦 1. 결측치 처리 (Missing Values)
# =====================================================

# 결측치란?
# - 누락된 값 (NA)
# - 함수 사용 불가, 분석 결과 왜곡
# - 제거 또는 적절한 값으로 대체 필요

df = data.frame(gender = c('M', 'F', NA, 'M', 'F'), score = c(5, 4, 3, 4, NA))
df

# ========================
# 1-1. 결측치 제거
# ========================
# (1)결측치 확인
is.na(df)                  # 각 요소가 NA인지 확인 (TRUE/FALSE)
table(is.na(df))           # 전체 데이터에서 NA 개수 확인
table(is.na(df$gender))    # gender 변수의 NA 개수
table(is.na(df$score))     # score 변수의 NA 개수

# (2)결측치 포함된 상태에서 함수→ 결과도 NA
mean(df$score)             # NA 포함 시 평균 계산 불가 (결과도 NA)
 

# (3)결측치 제거-행 기준
df %>%
  filter(is.na(score))    # score가 NA인 행만 추출 (결측치 확인)

df %>%
  filter(!is.na(score))   # score가 NA가 아닌 행만 추출 (결측치 제거)


# (4)결측치 제거한 데이터로 분석
df1 = df %>%
  filter(!is.na(score))   # 결측치 제거된 데이터프레임 저장

mean(df1$score)           # 결측치 없는 상태의 평균
sum(df1$score)            # 결측치 없는 상태의 합계

df1

# (5) 여러 변수에서 동시에 결측치 제거
df1 = df %>% 
  filter(!is.na(score) & !is.na(gender))
df1

df

# (6)하나라도 결측치가 있으면 제거
df2 = na.omit(df)
df2

# (7) 함수에 결측치 제외 기능 : na.rm = T
mean(df$score, na.rm = T)


# (8) csv 파일 불러와서 결측치 넣어보기
exam = read.csv("csv_exam.csv")
exam

exam[c(3,8,15), 'math'] = NA
exam

# (9) summarise로 NA 제외 평균 계산
exam %>%
  summarise(mean_math = mean(math, na.rm = T))

# ========================
# 1-2. 결측치 대체
# ========================

# (1) 결측치가 많을 경우 제외하면 데이터 손실이 큼
# - 대안 : 다른 값을 채워 넣음

# (2) 결측치 대체 방법
# - 대표값으로 일괄 대체: 평균, 최빈값, 중앙값 등
# - 통계분석기법이나 예측값 추정으로 대체하는 방법

# (3) 평균 값으로 결측치 대체 예시
mean(exam$math, na.rm = T) # math 평균 계산

exam$math = ifelse(is.na(exam$math), 55, exam$math) # 평균값으로 NA 대체
exam$math

mean(exam$math) # 대체 후 평균 계산

# =====================================================
# 🟥 2. 이상치 처리 (Outlier Handling)
# =====================================================
# 이상치란?
# - 정상 범주에서 크게 벗어난 값
# - 포함 시 분석 결과 왜곡 가능
# - 결측 처리 후 제외하고 분석

# 이상치 종류
# ▶️존재할 수 없는값 : 결측처리
#  - 의미상 불가능한 값 (예: gender = 3, age = -1)
#  - 통계 기준과 상관없이 말이 안되는 값
#  - 데이터 오류 → 결측 처리
#  - 처리: ifelse(..., NA, ...)로 직접 NA로 변환

# ▶️극단적인 값 : 이상치 제거
#  - 정상범주에서 크게 벗어나는 값
#  - 정상 데이터지만 분석 왜곡 가능 → 제거
#  - 기준: 논리적 판단, 통계적 판단
#  - 처리: boxplot() 또는 조건 수식으로 NA 처리

# >> 둘 다 최종적으로 NA 처리 → 분석에서 제외

# ========================
# 2-1. 존재할 수 없는 값 처리
# ========================

# (1) 예시 데이터
out = data.frame(gender = c(1, 2, 1,3, 2,1), score=c(5,4,3,4,2,6))
out

# (2) 이상치 확인
table(out$gender)  # gender에 3 → 존재할 수 없는 값
table(out$score)   # score에 6 → 기준 초과값

# (3) gender에서 이상치 NA 처리 → 결측 처리
out$gender = ifelse(out$gender == 3, NA, out$gender)

# (4) 여러 이상치 값이 들어오는 경우 → 조건문으로 처리(이게 더 좋음)
out$gender = ifelse(out$gender %in% c(1, 2), out$gender, NA)

# (5) score가 5 초과이면 이상치로 간주 → NA 처리
out$score = ifelse(out$score > 5, NA, out$score)
out

# (6) 결측처리 후 그룹별 평균 분석
out %>% 
  filter(!is.na(gender) & !is.na(score)) %>%
  group_by(gender) %>% 
  dplyr::summarise(mean_score = mean(score))

# ========================
# 2-2. 극단적인 값 처리
# ========================
# 기준: 정상범주에서 크게 벗어나면 이상치 제거 (너무 크거나 작음)
# - 판단 기준:
#   ① 논리적 판단 : ifelse() 
#   ② 통계적 판단 : boxplot() 

library(ggplot2)
mpg  # ggplot2 내장 연비 데이터 확인

# (1) boxplot으로 연비(hwy)의 이상치 시각화
boxplot(mpg$hwy)             # 이상치 시각화
boxplot(mpg$hwy)$stats       # Q1, Q3 등 사분위수 값 확인

# (2) 통계적 기준으로 벗어난 값 → NA 처리
mpg$hwy = ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))        # NA 처리된 이상치 개수 확인

# (3) 결측치 제거 후 그룹별 평균 연비 분석
mpg %>% 
  filter(!is.na(hwy)) %>%         # 이상치(NA) 제외
  group_by(drv) %>%               # 구동 방식별 그룹화
  dplyr::summarise(mean_hwy = mean(hwy))  # 평균 연비 계산


# =============================================================================
# 실습
mpg
mpg[c(65, 124, 131, 153, 212), 'hwy'] = NA

# Q1. drv(구동방식)별로 hwy(고속도로 연비) 평균이 어떻게 다른지 알아보려고 합니다. 
# 분석을 하기 전에 우선 두 변수에 결측치가 있는지 확인해야 합니다. 
# drv 변수와 hwy 변수에 결측치가 몇 개 있는지 알아보세요.





# Q2. filter()를 이용해 hwy 변수의 결측치를 제외하고, 
# 어떤 구동박식의 hwy 평균이 높은지 알아보세요. 
# 하나의 dplyr 구문으로 만들어야 합니다.





