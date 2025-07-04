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

# 3.11 Flexbox Part Two (09:02)

### Flexbox 심화 (축 방향과 요소 배치 제어)

1. 기본 축 방향 변경:  
   - `flex-direction` 속성으로 주축(main axis)과 교차축(cross axis)을 변경할 수 있다.  
   - 기본값은 `row` (가로 방향).  
   - `flex-direction: column;`을 사용하면 주축이 세로로 바뀌고, 교차축은 가로가 된다.

2. flex-direction의 다양한 옵션:  
   - `row` (기본값): 왼쪽 → 오른쪽  
   - `row-reverse`: 오른쪽 → 왼쪽  
   - `column`: 위 → 아래  
   - `column-reverse`: 아래 → 위

3. 요소 감싸기 제어:  
   - `flex-wrap: nowrap;` (기본값): 줄바꿈 없이 한 줄에 배치  
   - `flex-wrap: wrap;`: 공간이 부족하면 다음 줄로 이동  
   - `flex-wrap: wrap-reverse;`: 줄바꿈 시 반대 방향으로 감쌈

4. Flexbox의 크기 계산 방식:  
   - Flexbox는 자식 요소의 `width`를 초기 크기로만 인식  
   - 모든 요소를 한 줄에 배치하려고 할 때, 자동으로 크기를 조정할 수 있음

5. 부모-자식 구조 자유롭게 생성 가능:  
   - Flexbox는 여러 개의 자식 요소를 유연하게 배치할 수 있도록 설계됨

```css
/* 예시 */
.container {
  display: flex;
  flex-direction: column-reverse;
  flex-wrap: wrap-reverse;
}
```

물론이죠! 아래는 요청하신 형식에 맞춰 정리한 내용입니다:

---

# 3.12 Fixed (08:19)

### 📌 position: fixed (스크롤과 무관한 고정 위치)

1. 요소를 브라우저 화면(뷰포트)에 고정시킨다.  
   - 스크롤을 해도 항상 같은 자리에 머무름  
   - 문서 흐름에서 벗어나 별도의 레이어에 위치함

2. 초기 위치에 고정되지만, 위치 속성(top, left, right, bottom)을 지정하면 해당 위치로 이동  
   - 예: `top: 0; left: 0;` → 화면 왼쪽 상단에 고정  
   - 아무 속성도 지정하지 않으면 처음 배치된 위치에 고정됨

3. 다른 요소들과 겹칠 수 있음  
   - fixed 요소는 별도의 레이어에 존재하므로 이후 요소들과 겹침 가능  
   - 필요 시 `z-index`로 겹침 순서 조정 가능

4. 항상 화면 상단에 위치하는 것처럼 보임  
   - 기본적으로 가장 앞쪽(z축 위)에 렌더링됨

```css
/* position: fixed 예시 */
.fixed-header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background-color: #fff;
  z-index: 1000;
}
```

5. 주의할 점  
   - fixed 요소는 부모 요소의 위치와 무관하게 브라우저 전체를 기준으로 위치함  
   - 다른 요소들과의 레이아웃 충돌을 방지하려면 적절한 마진 또는 패딩 조정 필요

# 3.13 Relative & Absolute (07:45)
### 📍 Position 속성 정리 (static, relative, absolute, fixed)

1. **position: static (기본값)**  
   - 모든 요소의 기본값  
   - top, left, right, bottom 속성 무시됨  
   - 문서 흐름에 따라 배치됨

2. **position: fixed**  
   - 브라우저 화면(뷰포트)을 기준으로 고정  
   - 스크롤해도 위치가 변하지 않음  
   - top, left, right, bottom 속성으로 위치 지정 가능  
   - 문서 흐름에서 제거되며, 별도의 레이어(z-index 상단)에 위치함

3. **position: relative**  
   - 요소의 원래 위치를 기준으로 이동  
   - top, left, right, bottom 속성 사용 가능  
   - 문서 흐름에는 영향을 주지 않음 (공간은 그대로 차지함)  
   - 기준점 역할을 하며, 자식 요소의 absolute 기준이 될 수 있음

4. **position: absolute**  
   - 가장 가까운 조상 중 `position`이 static이 아닌 요소를 기준으로 위치함  
   - 기준이 되는 조상이 없으면 `viewport`(화면 전체)를 기준으로 함  
   - top, left, right, bottom 속성으로 위치 지정  
   - 문서 흐름에서 제거됨 (공간 차지하지 않음)
### 💡 추가 설명

- `absolute`는 종종 혼동을 일으키는데, 기준이 되는 요소가 없을 경우 body가 아닌 **초기 컨테이닝 블록(viewport)** 을 기준으로 삼습니다.  
- 기준이 되는 조상 요소는 `position: relative`, `absolute`, `fixed`, `sticky` 중 하나여야 합니다.  
- `relative`는 요소 자체의 위치를 기준으로 이동하지만, 여전히 문서 흐름에 공간을 차지합니다.  
- `absolute`와 `fixed`는 문서 흐름에서 제거되며, 겹침 현상이 발생할 수 있습니다.
### 🧪 예시 코드

```css
.parent {
  position: relative;
}

.child {
  position: absolute;
  top: 10px;
  left: 20px;
}
이 경우 `.child`는 `.parent`를 기준으로 위치가 지정
```

# 3.14 Pseudo Selectors Part One (08:57)

### Pseudo Selectors (가상 선택자)
기존의 선택 방식(태그, ID `#`, 클래스 `.`)보다 더 세밀하게 요소를 선택할 수 있는 CSS 기능
HTML 구조를 변경하지 않고도 특정 요소만 스타일링할 수 있어 매우 유용
### 주요 Pseudo Selectors

1. **:first-child**  
   - 부모의 첫 번째 자식 요소를 선택  
   ```css
   div:first-child {
     background-color: tomato;
   }
   ```

2. **:last-child**  
   - 부모의 마지막 자식 요소를 선택  
   ```css
   div:last-child {
     background-color: teal;
   }
   ```

3. **:nth-child(n)**  
   - 부모의 자식 중 n번째 요소를 선택  
   - `n`은 1부터 시작  
   ```css
   span:nth-child(2) {
     background-color: teal;
   }
   ```

4. **:nth-child(even / odd)**  
   - 짝수(even) 또는 홀수(odd) 번째 자식 요소 선택  
   ```css
   span:nth-child(even) {
     background-color: teal;
   }
   ```

5. **:nth-child(5n + 1)**  
   - 수학적 패턴을 이용한 선택  
   - `n`에 0부터 정수를 대입하여 해당 순서의 요소 선택  
   ```css
   span:nth-child(5n + 1) {
     background-color: silver;
   }
   ```

### 💡 장점

- HTML 구조를 수정하지 않고도 정교한 스타일링 가능  
- ID나 클래스를 추가하지 않아도 특정 요소만 선택 가능  
- 반복되는 패턴에 매우 유용 (ex. 테이블 줄무늬, 리스트 강조 등)
