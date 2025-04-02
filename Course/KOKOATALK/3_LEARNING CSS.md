# 3_LEARNING CSS
## 3.0 How to Add CSS to HTML
### 1. 같은 파일에 HTML 코드와 CSS 코드 쓰기
head 태그 아래 'style'태그를 이용한다.   
인라인 형식
### 2. CSS와 HTML을 분리하기
- css파일 만들기(styles.css)   
`<link href="styles.css" rel="stylesheet">`    
- styles.css와 이 HTML과의 관계를 말할 때,     
styles.css는 스타일시트라 한다.
- rel(relationship 관계)에 대해 명시해야 한다.
## 3.1 Writing Our First CSS Lines 
- CSS가 하는 일은 HTML 태그를 가리키는 일.    
(이 태그는 초록색이다. 이 가리키는 것 자체를 'selector')
- CSS 작성에선 띄어쓰기를 하지 않는다.
```
속성이름 : 속성값 ;
font-size:20px; 콜론으로 이어주고 세미콜론으로 닫아준다.
```
- 하이픈(-) 만 사용 가능
- 밑줄(_) , 슬래쉬(/) 사용해선 안된다.
    font-size(o) font size(x)
- css 또한 어떤 값이든 쓸 수 있다. 하지만 속성에 맞는 값을 써야 브라우저에서 적용이 된다.
- css 또한 모든 속성을 일일이 다 기억할 필요 없다. 기본적으로 어떻게 동작하는지만 기억하면 된다.

동작 원리
1. 태그를 지정
2. 원하는 속성값을 쓴다.
## 3.2 What Does Cascading Mean (05:31)
CSS:Cascading Style Sheet   
cascading: 종속, 위->아래로 가는 이미지   
- 브라우저는 css를 읽을 때 위에서 부터 순서대로 읽는다.
- 따라서 중복되는 속성일 땐 맨 마지막에 적용 된 것이 출력력
- **inline CSS** : css를 코드에 직접 적는 것   
- **external CSS** : css 파일을 include 하는 것 
## 3.3 Blocks and Inlines (09:28)
Block: 옆에 다른 요소가 오지 못함   
Inline: (in the same line)옆에 다른 요소가 올 수 있다.   
- div 옆에 div가 오지 못함   
- span은 옆에 span이 올 수 있다.
**inline태그: span, a(link), img**
**대부분의 코드는 block이다**

## 3.4 Margin Part One (12:18)
block <-> inline 상호변경이 가능하다.   
display 속성이라 한다.   
span의 display 기본 속성은 inline이다.   
```css
태그 {
    display: block;
    display: inline;
}
```
- Inline: width,height를 가질 수 없음
- Block: width, height를 가질 수 있다

Block는 border, padding, margin 3가지를 가지고 있다.
1. border: 테두리
2. padding: border ㅡ inside의 여백
3. margin: border ㅡ outside의 여백
    - margin-left, bottom, right 등 사방으로 다 값 줄 수 있음
