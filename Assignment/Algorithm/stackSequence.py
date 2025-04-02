n=int(input()) #수열의 개수
sequence=[] #수열 리스트 입력 받기
for i in range(n):
    num=int(input()) #num은 목표 수 만들어야하는 top과 같음음
    sequence.append(num)

stack=[] #스택
result=[] #+,- 연산결과
current=1 #다음에 push할 숫자
state=True # 수열 생성 가능여부

for num in sequence:
    while current<=num: # 현재 숫자보다 작거나 같을 때까지 push
        stack.append(current)
        current+=1
        result.append('+')
    
    if stack[-1]==num: # 스택의 top이 현재 숫자와 같으면 pop
        stack.pop()
        result.append('-')
    else: # 스택의 top이 목표 숫자(num)와 다르면 만들 수 없음
        state=False
        break

if state :
    for i in result:
        print(i)
else:
    print('No')
