# 문제 설명
# 문자열 code가 주어집니다.
# code를 앞에서부터 읽으면서 만약 문자가 "1"이면 mode를 바꿉니다. mode에 따라 code를 읽어가면서 문자열 ret을 만들어냅니다.
# mode는 0과 1이 있으며, idx를 0 부터 code의 길이 - 1 까지 1씩 키워나가면서 code[idx]의 값에 따라 다음과 같이 행동합니다.

# mode가 0일 때
# code[idx]가 "1"이 아니면 idx가 짝수일 때만 ret의 맨 뒤에 code[idx]를 추가합니다.
# code[idx]가 "1"이면 mode를 0에서 1로 바꿉니다.
# mode가 1일 때
# code[idx]가 "1"이 아니면 idx가 홀수일 때만 ret의 맨 뒤에 code[idx]를 추가합니다.
# code[idx]가 "1"이면 mode를 1에서 0으로 바꿉니다.
# 문자열 code를 통해 만들어진 문자열 ret를 return 하는 solution 함수를 완성해 주세요.

# 단, 시작할 때 mode는 0이며, return 하려는 ret가 만약 빈 문자열이라면 대신 "EMPTY"를 return 합니다.

# 내 풀이
def solution(code):
    mode=0
    ret=[]

    for i in range(len(code)):
        if code[i]=="1":
            mode=1-mode
        else:
            if mode==0 and i%2==0:
                ret.append(code[i])
            elif mode==1 and i%2!=0:
                ret.append(code[i])

    return "EMPTY" if len(ret)==0 else ''.join(ret)
# ✨ 오답 노트
# - mode를 0과 1로 바꾸는 부분에서 1-mode를 사용하여 간결하게 표현      
# - ret을 리스트로 초기화하고, 마지막에 join을 사용하여 문자열로 변환
# - 빈 문자열 체크를 간단하게 처리하여 가독성 향상

# 다른 사람의 풀이
#1
def solution(code):
    mode = 0
    ret = []

    for i in range(len(code)):
        if code[i] == "1":
            mode = 1 - mode
        elif (mode == 0 and i % 2 == 0) or (mode == 1 and i % 2 != 0):
            ret.append(code[i])

    return ''.join(ret) if ret else "EMPTY"
# ✔ 다른 사람의 풀이와 유사한 구조로, mode를 0과 1로 바꾸는 부분에서 1-mode를 사용하여 간결하게 표현
# ✔ ret을 리스트로 초기화하고, 마지막에 join을 사용하여 문자열로 변환
# ✔ 빈 문자열 체크를 간단하게 처리하여 가독성 향상

#2
def solution(code):
    answer = ''

    mode = 0
    for i in range(len(code)):
        if code[i] == '1':
            mode ^= 1
        else:
            if i % 2 == mode:
                answer += code[i]

    return answer if answer else 'EMPTY'
# - mode를 0과 1로 바꾸는 부분에서 XOR 연산자(^)를 사용하여 간결하게 표현
# - 문자열을 직접 이어붙이는 방식으로 ret을 생성
# - 빈 문자열 체크를 간단하게 처리하여 가독성 향상

# 🚀 배운 점
# - mode를 0과 1로 바꾸는 부분에서 1-mode 또는 XOR 연산자를 사용하여 간결하게 표현 가능
# - 문자열을 리스트로 초기화하고, 마지막에 join을 사용하여 문자열로 변환하는 방식이 가독성을 높임
# - 빈 문자열 체크를 간단하게 처리하여 가독성을 향상시킬 수 있음
# - 문자열을 직접 이어붙이는 방식으로 ret을 생성하는 것도 간결한 방법임





