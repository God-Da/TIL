# 문제 설명
# 연산 ⊕는 두 정수에 대한 연산으로 두 정수를 붙여서 쓴 값을 반환합니다. 예를 들면 다음과 같습니다.
# 12 ⊕ 3 = 123
# 3 ⊕ 12 = 312
# 양의 정수 a와 b가 주어졌을 때, a ⊕ b와 b ⊕ a 중 더 큰 값을 return 하는 solution 함수를 완성해 주세요.
# 단, a ⊕ b와 b ⊕ a가 같다면 a ⊕ b를 return 합니다.

# 내 풀이
def solution(a, b):
    ab=int(str(a)+str(b))
    ba=int(str(b)+str(a))
    
    if(ab>=ba):
        return ab
    else:
        return ba
    

# 다른 사람의 풀이
# 1
def solution(a, b):
    return int(max(f"{a}{b}", f"{b}{a}"))

# 2
def solution(a, b):
    a, b = str(a), str(b)
    return int(max(a+b, b+a))
