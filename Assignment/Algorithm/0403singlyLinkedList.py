class SList:  # 외부 클래스: 전체 연결 리스트를 담당함
    class Node:  # 내부 클래스: 실제 데이터를 저장하는 한 조각(노드)
        def __init__(self, item, link):  # Node의 생성자 (객체 만들 때 실행됨)
            self.item = item     # 데이터 저장 (예: 'apple')
            self.next = link     # 다음 노드의 주소(참조)를 저장 (연결 리스트니까!)

    def __init__(self):  # SList 클래스 생성자
        print("난 SList의 생성자") 
        self.head = None   # 첫 노드를 가리키는 포인터 (없으면 빈 리스트)
        self.size = 0      # 리스트의 노드 개수

    def isEmpty(self):  # 리스트가 비었는지 확인
        return self.size == 0

    def insert_front(self, item):  # 맨 앞에 새 노드 삽입
        if self.isEmpty():  # 리스트가 비었으면
            self.head = self.Node(item, None)  # head에 새 노드 연결 (다음 없음)
        else:
            self.head = self.Node(item, self.head)  # 새 노드를 head로 지정하고, 원래 head를 뒤로 밀음
        self.size += 1  # 노드 개수 증가

    def insert_after(self, item, p):  # 특정 노드 p 뒤에 새 노드 삽입
        p.next = self.Node(item, p.next)  # p 다음에 새로운 노드를 연결
        self.size += 1

    def search(self, target):  # 특정 값을 가진 노드의 위치(index) 찾기
        p = self.head  # head부터 탐색 시작
        for k in range(self.size):  # 노드 개수만큼 반복
            if target == p.item:  # 원하는 값을 찾으면
                return k  # 인덱스 반환
            p = p.next  # 다음 노드로 이동

    def delete_after(self, p):  # 노드 p 뒤의 노드를 삭제
        if self.isEmpty():  # 빈 리스트면 삭제 불가
            print("리스트가 비어있어 삭제 불가")
            return None
        else:
            t = p.next  # 삭제할 노드
            p.next = t.next  # p가 t를 건너뛰고 그 다음 노드를 가리키게 함
            del t  # 메모리에서 삭제
            self.size -= 1  # 노드 개수 감소

    def delete_front(self):  # 맨 앞 노드 삭제
        if self.isEmpty():  # 리스트가 비어있으면
            print("리스트가 비어있어 삭제 불가")
            return None
        else:
            t = self.head  # 현재 head 저장
            self.head = self.head.next  # head를 다음 노드로 변경
            del t  # 기존 head 삭제

    def insert_index(self, index, item):  # 인덱스 위치에 새 노드 삽입 
        #index가 범위 밖일 때
        if index<0 or index>self.size:
            print("유효 범위를 넘어 해당 index에 삽입할 수 없습니다.")
            return 
        
        #0번째 일때
        if index==0:
            self.insert_front(item)
            return
        
        else:
            # index 앞 노드까지 이동(index-1번째)
            p=self.head
            for i in range(index-1):
                p=p.next
            
            newNode=self.Node(item,p.next)
            p.next=newNode
            self.size+=1

    def delete_index(self,index):  # 인덱스 위치의 노드 삭제 
        #index가 범위 밖일 때
        if index<0 or index>self.size:
            print("유효 범위를 넘어 해당 index에 삭제할 수 없습니다.")
            return 
        #0번째 일때
        if index==0:
            self.delete_front()
            return
        else:
            # index 앞 노드까지 이동(index-1번째)
            p=self.head
            for i in range(index-1):
                p=p.next
            # 삭제할 노드를 t로 저장
            t=p.next
            p.next=t.next #(=p.next.next)
            del t
            self.size -=1
                       

    def delete_final(self):  # 마지막 노드 삭제 
        #리스트가 비어있을 때
        if self.isEmpty():
            print("리스트가 비어있어 마지막 노드를 삭제할 수 없습니다.")
            return

        #노드가 하나일 때: head만 지움
        if self.head.next is None:
            t=self.head
            self.head=None
            del t
            self.size-=1
            return

        else:
            #마지막 노드 앞까지 이동
            p=self.head
            while p.next.next is not None:            #for i in range(self.size-2)로 쓸 수도 있음
                p=p.next
            # 삭제할 노드를 t로 저장
            t=p.next #마지막 노드
            p.next=None
            del t
            self.size-=1


    def printList(self):  # 연결 리스트 출력
        p = self.head  # head부터 출력 시작
        while p:  # None이 나올 때까지 반복
            if p.next is not None:
                print(p.item, "=>", end="")  # 중간 노드는 화살표 출력
            else:
                print(p.item)  # 마지막 노드는 그냥 출력
            p = p.next  # 다음 노드로 이동

# 전역 함수 예시 (클래스 밖에 있음)
def globalFunc():  
    pass

# 메인 함수 실행 영역
if __name__ == "__main__":  
    s = SList()  # 연결 리스트 객체 생성
    s.insert_front("apple")  # apple 앞에 삽입 (첫 노드)
    s.insert_front("orange")  # orange 앞에 삽입 → orange → apple
    s.printList()

    s.insert_after("cherry", s.head.next)  # apple 뒤에 cherry 삽입
    s.printList()

    # 계속해서 앞에 데이터 삽입
    s.insert_front('pear')
    s.insert_front('melon')
    s.insert_front('strawberry')
    s.insert_front('grape')
    s.insert_front('peach')
    s.insert_front('banana')
    s.printList()

    print("cherry는 %d번쨰 노드에 있다." % (s.search("cherry") + 1))  # cherry 위치 출력

    s.delete_after(s.head)  # head 다음 노드 삭제
    s.printList()

    s.delete_front()  # 맨 앞 노드 삭제
    print("첫번째 노드 삭제후 \t\t")
    s.printList()

    # 과제하기~
    s.insert_index(2, "melon")  
    s.delete_index(3)
    s.delete_final()
    s.printList()
