# 문제 설명
# 문자열에 따라 다음과 같이 두 수의 크기를 비교하려고 합니다.

# 두 수가 n과 m이라면
# ">", "=" : n >= m
# "<", "=" : n <= m
# ">", "!" : n > m
# "<", "!" : n < m
# 두 문자열 ineq와 eq가 주어집니다. ineq는 "<"와 ">"중 하나고, eq는 "="와 "!"중 하나입니다. 
# 그리고 두 정수 n과 m이 주어질 때, n과 m이 ineq와 eq의 조건에 맞으면 1을 
# 아니면 0을 return하도록 solution 함수를 완성해주세요.

# 입출력 예 #1
# 20 <= 50은 참이기 때문에 1을 return합니다.

# 내 풀이
def solution(ineq, eq, n, m):
    answer = 0
    if (ineq==">"):
        if (eq=="="):
            answer=n>=m
        elif (eq=="!"):
            answer=n>m
    elif(ineq=="<"):
        if (eq=="="):
            answer=n<=m
        elif (eq=="!"):
            answer=n<m
        
    if answer:
        return 1
    else:
        return 0

# ✨ 오답 노트
# - 기존 풀이에서 answer 변수에 True/False 값을 할당했지만, Python에서는 int()를 사용하여 바로 반환하는 것이 더 깔끔합니다.
# - if-else 문을 여러 번 사용하면 불필요한 중첩이 발생하여 코드 가독성이 떨어집니다.
# - or 연산자를 활용해 조건을 결합하면 더욱 효율적인 코드 작성이 가능합니다.


# 다른 사람의 풀이
#1
def solution(ineq, eq, n, m):
    if ineq == '<':
        if eq == '=':
            return int(n <= m)
        else:
            return int(n < m)
    else:
        if eq == '=':
            return int(n >= m)
        else:
            return int(n > m)

# ✔ int()로 Boolean 값을 변환
# ✔ if 문을 활용하여 가독성을 높임

#2
def solution(ineq, eq, n, m):
    answer = 0
    if n > m and ineq ==">":
        answer = 1
    elif n < m and ineq == "<":
        answer = 1
    elif n == m and eq == "=":
        answer = 1

    return answer

# ✔ if-elif 문을 사용하여 각각의 조건을 명확하게 표현
# ✔ int() 변환 없이 명시적으로 answer 값을 설정

# 🚀 배운 점
# - 불필요한 중첩을 줄이는 것이 코드 가독성을 높인다.
# - Boolean 값을 직접 int()로 변환하면 더 깔끔한 코드 작성이 가능하다.
# - 조건문을 한 줄로 정리하면 보다 간결한 표현이 가능하다.
