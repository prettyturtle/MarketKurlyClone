# 마켓컬리 앱 클론코딩

## UI 구현
### 전체
- 스토리보드를 사용하지 않고, `SnapKit`으로 구현했다. 이미지는 `Assets`에서 적용하거나 또는 `Kingfisher`을 통해 url로 적용했다.
- SPM(Swift Package Manager)을 사용했다.
- 전체적으로 재사용 가능하게 만들려고 노력했다.
- 자주 등장하는 버튼이나 네비게이션 바와 메인 색상 등을 `Extension`으로 따로 만들었다.
- API로 앱에 있는 요소(상품 목록)를 만들고 싶었지만 일단은 `plist`에서 임시로 만들었다.
- 우선 탭은 총 4개이다.
- 홈
- 카테고리
- 검색(미구현)
- 마이컬리

### 홈 탭

![](https://images.velog.io/images/yc1303/post/16f6963a-3d4b-44ca-9d64-a31c48d2a53d/%E3%85%81%E3%85%81%E3%85%81.001.png)

- 가장 먼저 보이는 배너는 `UICollectionView`로 구현했다.
- `UICollectionViewFlowLayout`
- 그 밑으로 나오는 상품 목록들도 동일한 `UICollectionView`로 구현했다.
- 홈 탭은 `UIScrollView`로 스크롤 가능하게 만들었다.
- `UIScrollView` 안에 `UIStackView`가 있고
- 그 스택 뷰 안에 여러 개의 `UICollectionView`가 있는 것이다.

![](https://images.velog.io/images/yc1303/post/afead6ca-5bdf-4b0a-a861-39c192c98c64/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202022-01-14%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%2012.22.41.png)

- 상품 목록들은 가져오는 데이터의 개수에 따라 늘어나거나 줄고, 상품의 종류도 다 유동적이다.
- 배너의 이미지는 Assets에서 가져와 적용했고
- 상품 목록의 이미지들은
- plist에서 데이터를 받아 kingfisher로 적용

> 원래 마켓컬리 홈탭을 보면 상단에 Paging Tab Bar가 있다.
Paging Tab Bar에 대한 기능은 따로 구현해놨지만 아직 적용하지 못했다.

#### 상품 목록에 있는 동그란 카트 버튼을 눌렀을 때
![](https://images.velog.io/images/yc1303/post/7a5e38c3-6ea5-4734-815f-06d4e7621569/%E3%85%81%E3%85%81%E3%85%81.001.png)

- countStepper는 직접 구현했다.
- 수량을 늘리거나 줄일 때마다 하단의 버튼에 가격이 변경된다.
- `NumberFormatter`를 사용했다
- 수량이 1개보다 적으면 `UIAlertController`로 알림이 나온다.


### 카테고리 탭

![](https://images.velog.io/images/yc1303/post/0138eef0-335b-457e-800f-0dc6e689b406/%E3%85%81%E3%85%81%E3%85%81.001.png)

- 카테고리 탭은 테이블 뷰로 dropdown은 구현했지만
- 테이블 뷰 아래로 콜랙션뷰가 들어갈 예정이여서
- 이로인해 (AutoLayout, 스크롤이 되지 않는)문제로 아직 다 만들지 못했다.


### 검색 탭 (미구현)

### 마이컬리 탭

![](https://images.velog.io/images/yc1303/post/bd485369-7297-49b5-ba81-940a54e0ef27/%E3%85%81%E3%85%81%E3%85%81.001.png)

- 처음에 이 탭을 전부 테이블 뷰로 구현하려고 했다.
- 그래서 섹션의 개수를 3개로 하고
- 첫번째 섹션에 커스텀 셀로 만들었는데
- 셀 안에 있는 버튼이 안눌리는 현상이 생겨
- 그냥 따로 뷰를 만들었다.
- 셀 안의 버튼이 눌리게 하는 방법을 찾아봤는데 나중에 한번 도전해봐야겠다.
- 그래서 스크롤 뷰 안에 뷰 한 개와 테이블 뷰가 있는 구조이다.
- `refreshControl`도 만들어 일단 `print`만 했다.


#### 로그인/회원가입 버튼을 눌렀을 때
![](https://images.velog.io/images/yc1303/post/e1934cfd-1fb5-4bbc-b96b-fc3976800b3d/%E3%85%81%E3%85%81%E3%85%81.001.png)

- `Toast` 라이브러리를 사용했다.
> 로그인 기능은 아직 구현하지 않았다.
이후에 Firebase를 이용해 구현할 예정이다.



## 중간평가(22.01.14)
- 너무 UI에만 집중해서 만들었던 것 같다.
- 이제부턴 좀 더 기능에 집중해서 만들어야할 것 같다.
- UI를 구현하면서 왜 안되지? 가 너무 많았었다.
- 그래도 실패하면서 깨달은게 많다.

