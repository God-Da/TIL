# 문제 설명
# 두 정수 a, b와 boolean 변수 flag가 매개변수로 주어질 때, 
# flag가 true면 a + b를 false면 a - b를 return 하는 solution 함수를 작성해 주세요.

# 내 풀이
def solution(a, b, flag):
    return a + b if flag else a - b

# ✨ 오답 노트
# - 기존 풀이에서 if flag: return a+b; return a-b와 같이 명시적인 if 문을 사용했지만, 삼항 연산자로 더 간결하게 처리 가능
# - 리스트 인덱싱을 활용하면 flag 값에 따라 더 직관적인 방식으로 값 반환 가능
# - lambda를 사용하면 코드를 한 줄로 표현 가능

# 다른 사람의 풀이
#1
def solution(a, b, flag):
    if flag: return a+b
    return a-b

#2
solution=lambda a,b,f:[a-b,a+b][f]
# ✔ 리스트 인덱싱 활용해 flag 값 (0 또는 1)에 따라 결과 반환
# ✔ 람다 함수 사용으로 코드 길이 최소화

# 🚀 배운 점
# - 삼항 연산자를 활용하면 더 깔끔하고 간결한 코드 작성 가능
# - 리스트 인덱싱을 사용하면 조건문 없이 직접 값 반환 가능
# - 람다 표현식을 활용하면 더욱 효율적인 방식으로 문제 해결 가능
