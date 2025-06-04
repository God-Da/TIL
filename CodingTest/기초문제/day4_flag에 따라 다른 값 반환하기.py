# 문제 설명
# 두 정수 a, b와 boolean 변수 flag가 매개변수로 주어질 때, 
# flag가 true면 a + b를 false면 a - b를 return 하는 solution 함수를 작성해 주세요.

# 내 풀이
def solution(a, b, flag):
    return a + b if flag else a - b

# 다른 사람의 풀이
#1
def solution(a, b, flag):
    if flag: return a+b
    return a-b

#2
solution=lambda a,b,f:[a-b,a+b][f]