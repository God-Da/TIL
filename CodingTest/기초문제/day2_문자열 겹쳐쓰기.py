# 문제 설명
# 문자열 my_string, overwrite_string과 정수 s가 주어집니다. 
# 문자열 my_string의 인덱스 s부터 overwrite_string의 길이만큼을 
# 문자열 overwrite_string으로 바꾼 문자열을 return 하는 solution 함수를 작성해 주세요.

# 입출력 예
# "Program29b8UYP"  "merS123"   7   "ProgrammerS123" <-result

# 🛠 접근 방식
# 1. 문자열 my_string에서 특정 부분을 overwrite_string으로 대체해야 함.
# 2. 문자열은 변경할 수 없는(immutable) 자료형이므로 슬라이싱을 이용해 새 문자열을 생성해야 함.
# 3. 슬라이싱을 활용하여 my_string[:s]는 바뀌지 않는 앞부분을 유지.
# 4. overwrite_string을 삽입하여 s부터 덮어쓰기.
# 5. my_string[s + len(overwrite_string):]은 overwrite_string 뒤의 기존 문자열을 유지.

# 내 풀이
def solution(my_string, overwrite_string, s):
    if len(my_string) > len(overwrite_string):
        return my_string[:s] + overwrite_string + my_string[s + len(overwrite_string):]
    else:
        return my_string[:s] + overwrite_string

# ✨ 오답노트
# 1. 기존 코드에서 `if` 조건문을 사용했지만, 사실 필요하지 않음.
#    - 문자열을 덮어쓰는 문제이므로 항상 `s` 위치부터 overwrite_string을 삽입하면 됨.
# 2. `else` 부분이 불필요함 → 바로 하나의 `return`문으로 처리 가능.
# 3. 다른 사람의 코드를 참고하면 불필요한 조건문 없이 간결하게 해결 가능.

# 다른 사람의 풀이
# 1
def solution(my_string, overwrite_string, s):
    return my_string[:s] + overwrite_string + my_string[s + len(overwrite_string):]

# my_string이 overwrite_string보다 짧다면, 
# my_string[s + len(overwrite_string):] 부분에서 슬라이싱 범위를 벗어나게 되는 경우가 발생
# 하지만 Python에서는 슬라이싱 범위를 벗어나더라도 오류가 발생하지 않음

# 🔍 배운 점
# - 문자열 슬라이싱을 활용하면 불필요한 조건문 없이 더 깔끔하게 해결할 수 있음.
# - 문제를 해결할 때 필요 없는 로직을 넣지 않는 것이 중요함.
# - 다음 문제에서는 더 간결한 해결 방법을 먼저 고민해 보기!
