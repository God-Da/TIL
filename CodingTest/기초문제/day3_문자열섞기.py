# 문제 설명
# 길이가 같은 두 문자열 str1과 str2가 주어집니다.
# 두 문자열의 각 문자가 앞에서부터 서로 번갈아가면서 한 번씩 등장하는 문자열을 만들어 return 하는 solution 함수를 완성해 주세요.
# 입출력 예
# str1	str2	result
# "aaaaa"	"bbbbb"	"ababababab"

# # 문제 풀이 팁?
# 문자열의 각 문자를 번갈아가면서 등장하게 하는 게 핵심
# 반복문을 활용해서 각 인덱스의 문자를 차례로 꺼내고, 이를 새로운 문자열에 이어 붙이는 방식으로 접근

# 내 풀이
def solution(str1, str2):
    result=[]
    
    for i in range(len(str1)):
        result.append(str1[i])
        result.append(str2[i])
        
    return ''.join(result)
    
# 다른 사람의 풀이
# 딱히 매력적인게 없네
