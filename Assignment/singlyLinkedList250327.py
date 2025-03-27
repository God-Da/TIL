class SList: # 중첩클래스 밖에 있어서 outer class
    class Node: # 멤버클래스 안쪽에 있어서 inner class
        #클래스명과 똑같은 함수: 생성자
        #메소드: 클래스 안쪽에 선언한 함수
        def __init__(self, item, link): #__init__ 메서드는 멤버 클래스(Inner) 가 생성될 때 실행되는 생성자
            self.item=item  #객체의 신분증 역할 java의 this python의 self 
            self.next=link
    def __init__(self): #SList의 생성자 함수
        print("난 SList의 생성자") 
        self.head=None
        self.size=0

    def isEmpty(self):
        return self.size == 0
    
    def insert_front(self, item):
        if self.isEmpty():
            self.head = self.Node(item,None)
        else:
            self.head=self.Node(item,self.head)
        self.size+=1

    def printList(self):
        p=self.head
        while p:
            if p.next is not None:
                print(p.item,"=>",end="")
            else:
                print(p.item)
            p = p.next


def globalFunc(): #전역 함수임, 메소드 아니양
    pass

if __name__ == "__main__":#생성자 함수 실행 시 메모리 변화: 메모리에 SList의 복사본이 생김<이게 객체(object)=instance
    s=SList() #SList클래스 안의 생성자 함수를 호출하라
    s.insert_front("apple")
    s.insert_front("orange")
    s.printList()
