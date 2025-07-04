getwd()
setwd("C:/r_workdata")

Sys.setlocale("LC_ALL","Korean")

library(lubridate)
library(dplyr)
library(ggplot2)
library(googleVis)

library(plyr)

# =====================================================
# 그래픽 기초 : 데이터를 시각적으로 표현하는 다양한 그래프 활용
# =====================================================
# =========================
# 1. 기본 그래프 plot()
# =========================
# - 산점도, 꺾은선 그래프 등을 그릴 수 있음
# - 형식: plot(y), plot(x, y), plot(x, y, 옵션)

# 1-1. y축 데이터만(x축은 자동 설정)
v1 = c(2, 2, 2)
plot(v1)

# 1-2. x, y축 모두 지정
x = 1:3
y = 3:1
plot(x, y)

# 1-3. x축, y축의 한계값 설정 (xlim, ylim)
plot(x, y, xlim = c(1, 10), ylim = c(1, 5))

# 1-4. 축 이름(xlab, ylab) , 그래프 제목(main) 추가
plot(x, y, xlim = c(1, 10), ylim = c(1, 5),
     xlab = "x축값", ylab = "y축값", main = "PLOT TEST")

plot(x, y, xlim = c(1, 10), ylim = c(1, 5),
     xlab = "x축값", ylab = "y축값", main = "PLOT TEST")

# 1-5. 기존 그래프 창 초기화: plot.new()
plot.new()

# 1-6. 새로운 그래프 창 열기: dev.new()
dev.new()

# 1-7. 축과 제목 없이 그리기 (type, col, axes, ann 옵션 사용)
v1 = c(100, 130, 120, 160, 150)
plot(v1, type = 'o', col = 'red', ylim = c(0, 200), axes = F, ann = F)

# 1-8. 사용자 정의 축 추가 (axis), 제목 추가 (title)
axis(1, at = 1:5, lab = c('MON', 'TUE', 'WED', 'THU', 'FRI'))   # x축
axis(2, ylim = c(0, 200))                                      # y축
title(main = 'FRUITS', col.main = 'red', font.main = 4)        # 그래프 제목
title(xlab = 'DAY', col.lab = 'black')                         # x축 제목
title(ylab = 'PRICE', col.lab = 'blue')                        # y축 제목


# =========================
# 2. 그래프 배치 및 여백 조정
# =========================

# 2-1. 여러 그래프 배치: par(mfrow = c(행, 열))
# - 여러 그래프를 한 화면에 행×열 형태로 배치
par(mfrow = c(3, 3))
plot(v1, type = 'b')  # 점 + 선
plot(v1, type = 's')  # 왼쪽 시작 계단형
plot(v1, type = 'S')  # 오른쪽 시작 계단형
plot(v1, type = 'l')  # 선형
plot(v1, type = 'p')  # 점만
plot(v1, type = 'c')  # 'b'에서 점 생략
plot(v1, type = 'o')  # 점과 선 중첩
plot(v1, type = 'h')  # 수직선(각 점에서 x축까지)
plot(v1, type = 'n')  # 축만 표현 (그래프는 없음)

# 2-2. 그래프 배치 예시: 파이, 선, 막대 그래프 함께 출력
par(mfrow = c(1, 3))
pie(v1)              # 원형 그래프
plot(v1, type = 'o') # 꺾은선 그래프
barplot(v1)          # 막대 그래프

# 2-3. 배치 복원: 1행 1열
par(mfrow=c(1,1))

# 2-4. 내부 여백 조정: par(mgp = c(제목, 눈금값, 눈금선))
# - 각 축 내부 요소들의 위치 조정 (margin line 위치)
a = c(1, 2, 3)
par(mgp = c(1, 2, 0))
plot(a, xlab = 'aaa')

# 2-5. 외부 여백 조정: par(oma = c(아래, 왼쪽, 위, 오른쪽))
# - 그래프 영역 밖의 여백 설정 (outside margin area)
par(oma = c(2, 2, 2, 2))
plot(a, xlab = 'aaaa')

# =========================
# 3. 그래프 중첩 및 범례
# =========================
# 3-1. 그래프 중첩 그리기
# - 방법 1: par(new = TRUE)로 덮어그리기
# - 방법 2: lines() 함수로 추가 그래프 그리기

#   예제 데이터
v1=c(1,2,3,4,5)
v2=c(5,4,3,2,1)
v3=c(3,4,5,6,7)

# - 방법 1: par(new = TRUE) → 완전 새로 그리기
#   - 기존 그래프를 지우지 않고 새로운 그래프를 덧그림
#   - axes, labels 겹칠 수 있어 주의 필요
plot(v1, type = 's', col = 'red', ylim = c(1, 5))  # 첫 그래프
par(new = T)
plot(v2, type = 'o', col = 'blue', ylim = c(1, 5)) # 두 번째 그래프
par(new = T)
plot(v3, type = 'l', col = 'green')               # 세 번째 그래프

# - 방법 2: lines()
#   - 기존 plot() 위에 새로운 선을 그리는 안전한 방식
#   - ylim은 첫 plot()에서 전체 y축 범위를 넉넉하게 설정해야 함
plot(v1, type = 's', col = 'red', ylim = c(1, 10))         # 첫 그래프 (전체 y범위 확보)
lines(v2, type = 'o', col = 'blue', ylim = c(1, 5))        # 점 + 선 추가
lines(v3, type = 'l', col = 'green', ylim = c(1, 100))     # 선만 추가

# 3-2. 범례 추가: legend()
# - 형식: legend(x, y, 범례이름들, cex = 글자크기, col = 선색상, lty = 선모양)
legend(4,9,c('v1','v2','v3'), 
       cex=0.9, 
       col=c('red','blue','green'),
       lty=1) #1: 직선 #선모양: 0~6

# =========================
# 4. 막대 그래프 barplot()
# =========================
# - 기본형식: barplot(데이터, 옵션들)

# 4-1. 기본 막대 그래프
x = c(1, 2, 3, 4, 5)
barplot(x)                 # 세로 막대 그래프
barplot(x, horiz = T)      # 가로 막대 그래프

# 4-2. 그룹 막대 그래프: beside=T (여러 막대 나란히)
x = matrix(c(5, 4, 3, 2), 2)     # matrix 구조 필수
barplot(x, beside = T,           # 옆으로 나란히 막대 출력
        names = c(5, 3), 
        col = c('green', 'yellow'))

# 4-3. 그룹 가로 막대
barplot(x, beside = TRUE, 
        names = c(5, 3), 
        col = c('green', 'yellow'), 
        horiz = TRUE)

# 4-4. 하나의 막대로 가로 출력
barplot(x, 
        names = c(5, 3), 
        col = c('green', 'yellow'), 
        horiz = TRUE, 
        xlim = c(0, 12))         # x축 범위 지정

# 4-5. 데이터프레임 기반 그룹 막대 그래프
# - 여러 막대그룹으로 한번에 출력
v1 = c(100, 120, 140, 160, 180)
v2 = c(120, 130, 150, 140, 170)
v3 = c(140, 170, 120, 110, 160)
qty = data.frame(BANANA = v1, CHERRY = v2, ORANGE = v3) #data.frame(열 = 행벡터)
qty # 요일별 과일 판매량
class(qty) # data.frame 임

# barplot 그룹막대는 matrix 구조만 가능 → 전환 필요
barplot(as.matrix(qty),         # data.frame → as.matrix() 행렬로 변환
        main = 'FRUITS SALES',
        beside = TRUE, 
        col = rainbow(nrow(qty)),
        ylim = c(0, 400))

# 4-6. 범례 추가: 범례값이 행임→(행:요일,열:과일)
legend(14, 400, 
       c('MON', 'TUE', 'WED', 'THU', 'FRI'), 
       cex = 0.8, 
       fill = rainbow(nrow(qty))) # fill: 막대 색상과 일치

# 4-7. 전치 행렬(행/열 바뀜): t()
t(qty)                            # 행(범례값):과일, 열: 요일
barplot(t(qty), 
        main = 'FRUITS SALES', 
        col = rainbow(length(qty)), 
        ylim = c(0, 400),
        names.arg = c('MON', 'TUE', 'WED', 'THU', 'FRI'), 
        cex.axis = 0.8, 
        las = 1,                 # las(축이름 방향):
        cex = 0.8,               # 0-축평행,1-가로,2-세로,3-축수직 
        beside = TRUE)


# ▶️ 응용: 조건을 주고 그래프 그리기
# peach 값이 200 이상 red, 180~199 yellow, 그 이하 green
peach = c(180, 200, 250, 198, 170)

# 1. 조건별 색상 벡터 만들기
colors=c()
for(i in 1:length(peach)){
  if(peach[i]>=200){
    colors=c(colors, 'red') #기존벡터=C(기존벡터, "업데이트값")
  } else if (peach[i]>=180){
    colors=c(colors,'yellow')
  }else{
    colors=c(colors, 'green')
  }
}

# 색상 벡터를 적용한 막대 그래프
barplot(peach, 
        main = 'PEACH SALES', 
        names.arg = c('MON','TUE','WED','THU','FRI'),
        col = colors)

# 2. 조건부 색상을 함수로 처리
# - 매개변수로 받은 값 벡터에 따라 색상 자동 결정
f1=function(f){
  colors=NULL
  for(i in 1:length(f)){
    if(f[i]>=200){
      colors[i]='blue'
    } else if (f[i]>=180){
      colors[i]='pink'
    }else{
      colors[i]='green'
    }
  }
  return(colors)
}

# 함수 확인
f1(peach)

# 함수 결과를 적용한 막대 그래프
barplot(peach, 
        col = f1(peach), 
        names.arg = c('MON', 'TUE', 'WED', 'THU', 'FRI'))

# =============================================================================
# 실습
x1=c(100,130,190,160,150,220)

# 1. 한 화면에 6개의 그래프를 나타내어라


# 2. 점과 선의 조합으로 이루어진 그래프 출력


# 3. 가로출력


# 4. 그룹으로 묶어서 출력



# 5. 그룹으로 묶어서 가로 출력


# 6. 하나의 막대 그래프로 가로로 출력


# 7. 하나의 막대 그래프로 세로로 출력


# 8. 조건을 주고 그래프 그리기 : 한 화면에 하나의 그래프로 표현
# v1 값이 200 이상 red, 180~199 yellow, 그 이하 green