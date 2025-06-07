# 문제 설명
# 정수 배열 arr와 2차원 정수 배열 queries이 주어집니다. queries의 원소는 각각 하나의 query를 나타내며, [i, j] 꼴입니다.
# 각 query마다 순서대로 arr[i]의 값과 arr[j]의 값을 서로 바꿉니다.
# 위 규칙에 따라 queries를 처리한 이후의 arr를 return 하는 solution 함수를 완성해 주세요.

# 내 풀이
def solution(arr, queries):
    for i in range(len(queries)):
        x = queries[i][0]
        y = queries[i][1]
        arr[x], arr[y] = arr[y], arr[x]
    return arr
