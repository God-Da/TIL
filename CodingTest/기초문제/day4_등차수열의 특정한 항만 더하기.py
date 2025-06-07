# 문제 설명
# 두 정수 a, d와 길이가 n인 boolean 배열 included가 주어집니다. 
# 첫째항이 a, 공차가 d인 등차수열에서 included[i]가 i + 1항을 의미할 때, 
# 이 등차수열의 1항부터 n항까지 included가 true인 항들만 더한 값을 return 하는 solution 함수를 작성해 주세요.

# 내 풀이
def solution(a, d, included):
    result=0
    for i in range(len(included)):
        if included[i]:
            result+=a+d*i
        
    return result

# ✨ 오답 노트
# - for문을 사용하여 included 배열을 순회하면서 조건에 맞는 항들만 더하는 방식으로 구현
# - 각 항의 값을 계산할 때 a와 d를 이용하여 간단하게 계산
# - 등차수열의 일반항을 떠올리는 것이 어려웠음