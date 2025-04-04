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
- 밑줄(\_) , 슬래쉬(/) 사용해선 안된다.
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

# 3.5 Margin Part Two (06:20)

### Margin 값 방향

value 1개 - 사방에 적용 [위,오른쪽,아래,왼쪽]  
value 2개 - [위/아래,오른쪽/왼쪽]
value 3개 - [위,오른쪽/왼쪽,아래]
value 4개 - 시계 방향으로 [위,오른쪽,아래,왼쪽]

### collapsing margin (마진 상쇄)

- 두 box의 border가 겹칠때 일어난다.
- 수직으로만 발생한다.
  ==> padding 속성을 사용하여 해결할 수 있다.

# 3.6 Paddings and IDs (10:39)

### Paddings

- margin과 반대 개념
- margin은 경계 '바깥'의 공간, padding은 경계 '안쪽'의 공간
- 값의 개수에 따라 적용되는 방향은 margin과 동일하다.

### ID(고유의 값, 하나만 존재 가능)

- 여러 div(태그들)를 생성했을때 **id**를 이용하여 dib를 구분할 수 있고, 각각 다른 속성을 적용 시킬 수 있다.
- CSS 코드의 id명은 HTML 코드에서 썼던 id명과 같아야 하낟.

```
tag - tag {} (ex: h2 {font-size: 22px;})
id - #id {} (ex: #div {margin: 20px 10px;})
1class - .class {.list item {list-style-type: none;}
```

### borderStyle

- border style MDN 참고하기
- inline인 span에도 적용 된다.

```
*{
    css코드 // *은 전체 태그들에 적용하는 것
}
```

# 3.8 Classes (11:27) **CSS diner게임해보기**

### inline 태그 (ex. span)

- 높이와 너비를 가질 수 없어 위, 아래에만 margin 적용
- padding은 사방에 적용가능
- margin을 사방에 적용하고 싶다면, inline요소를 block로 바꿔줘야함

### class

- 온점(.)은 class명이라는 뜻.

- id와 달리 class는 유일하지 않아도 된다. 중복 사용 가능

```
#tomato{} id="tomato"
.tomato{} class="tomato"
<span class="btn tomato"> class를 여러개 사용하여 각기 다른 class 속성을 동시에 부여할 수 있다.
```

# 3.9 Inline Block (07:37)

### display속성

- block, inline, inline-block 이 있다.
  - block: 옆에 아무것도 올 수 없음
  - inline: 너비, 높이 무시로 타 요소 추가 전엔 안보임
  - inline-block: 원치않는 공백과 반응형 디자인 불가

# 3.10 Flexbox Part One (12:08)

### Flexbox (반응형 디자인 지원)

1. 적용시킬 element의 부모에게 명시한다.
2. 두가지 축을 따라 움직인다.  
   -main axis(주축) : 기본값이 수평  
   -cross axis(교차) : 기본값이 수직
3. justify-content: 주축을 따라 움직임
4. align-items: 교차축을 따라 움직임

```
Display:Flex;를 이용한 다양한 속성들
Justify-content: center; (중심)
Justify-content: end; (우측 끝으로)
Justify-content: start; (기본값default)
Justify-content: space-evenly; (자동 간격 정렬)
lign-item: stretch (늘어남)
    // 요소(element)의 높이(height)를 고정시키면 적용 안됨
```

5. vh는 viewpoint height 줄임말 / 화면높이의 %를 지정
