# 문제 설명
# 양의 정수 n이 매개변수로 주어질 때, 
# n이 홀수라면 n 이하의 홀수인 모든 양의 정수의 합을 return 하고 
# n이 짝수라면 n 이하의 짝수인 모든 양의 정수의 제곱의 합을 return 하는 solution 함수를 작성해 주세요.

# 입출력 예
# 예제 1번의 n은 7로 홀수입니다. 
# 7 이하의 모든 양의 홀수는 1, 3, 5, 7이고 이들의 합인 1 + 3 + 5 + 7 = 16을 return 합니다.
# 예제 2번의 n은 10으로 짝수입니다. 
# 10 이하의 모든 양의 짝수는 2, 4, 6, 8, 10이고 
# 이들의 제곱의 합인 22 + 42 + 62 + 82 + 102 = 4 + 16 + 36 + 64 + 100 = 220을 return 합니다.

# 내 풀이
def solution(n):
    total=0
    
    if (n%2!=0):
        for i in range(1,n+1,2):
            total+=i
        return total
    else:
        for i in range(0,n+1,2):
            total+=i*i
        return total

# ✨ 오답 노트
# - 기존 풀이에서 if문 내부에서 반복문을 돌려 total을 업데이트했지만, sum()을 사용하면 훨씬 간결하게 표현 가능
# - range()를 활용해 홀수와 짝수를 한 줄로 처리할 수 있음

# 다른 사람의 풀이
#1
def solution(n):
    if n % 2 == 0:
        return sum(i * i for i in range(2, n + 1, 2))
    else:
        return sum(i for i in range(1, n + 1, 2))
# ✔ sum()을 활용해 반복문 제거
# ✔ 가독성 높음

#2
def solution(n):
    if n%2:
        return sum(range(1,n+1,2))
    return sum([i*i for i in range(2,n+1,2)])
# ✔ sum(range(...)) 활용해 더욱 간결한 코드
# ✔ 조건을 if n % 2로 체크해 가독성 향상

# 🚀 배운 점
# - sum()을 활용하면 불필요한 반복문 없이 코드 최적화 가능
# - range()의 시작점을 다르게 설정하면 한 줄로 표현 가능
# - 조건문을 최소화하고 sum()과 range()를 조합하면 더욱 효율적인 코드 작성 가능
