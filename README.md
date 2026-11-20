# 39-COLLABORATION-iOS-CATCHTABLE
> 39기 합동 세미나 모바일 앱 2조 캐치테이블 🍱

<br>
<br>

<img width="800" alt="표지" src="https://github.com/user-attachments/assets/fa39c6f3-ccc6-4c6d-99ba-d302848b6a38" />

<img width="800" alt="01 Backgrond _ 메인 개선 플로우" src="https://github.com/user-attachments/assets/46d8e736-4b7a-4aac-a07b-ddc62646146b" />

<br>

#### 🔺 Pain Point 1 ∙ 홈 화면 접속
과도하게 많은 카테고리가 나열되어 정보 탐색 시 피로감을 유발해요

#### 🔺 Pain Point 2 ∙ 매장 선택 및 담기
기능 명칭이 직관적이지 않아요
대표 메뉴 파악이 어려워요

#### 🔺 Pain Point 3 ∙ 투표 생성 및 링크 공유
투표 페이지에 접근할 수 있는 경로가 제한적이에요

#### 🔺 Pain Point 4 ∙ 각자 투표
투표할 때마다 이름을 매번 직접 입력해야 해요

#### 🔺 Pain Point 5 ∙ 결과 확인
투표 결과를 확인하기 위해 외부 링크에 재접속해야 해요

<br>

## Redesign Point
<img width="800" alt="홈 (Home)" src="https://github.com/user-attachments/assets/36b3d28c-1d69-4013-bdf6-4e5fcf86145f" />

<img width="800" alt="가게 상세정보 (Store)" src="https://github.com/user-attachments/assets/13aa35c1-3a47-463f-ac37-161840e4af21" />

<img width="800" alt="함께 고르기 (Vote)" src="https://github.com/user-attachments/assets/650107d5-9651-4261-9d29-3dc693a01100" />

<img width="800" alt="함께 고르기 (Vote) (1)" src="https://github.com/user-attachments/assets/4abd9e4b-196a-4408-9b89-23e2600c2c0e" />

<br> <br>

---

## 🍒 시연 영상

| 홈 | 가게 상세 | 함께 고르기 |
| :---: | :---: | :---: |
| <video src="https://github.com/user-attachments/assets/99073ee0-2cfd-40d0-8f8f-157b70e164dd" controls width="100%"></video> | <video src="https://github.com/user-attachments/assets/cd3c4807-ff2a-4f22-a23d-5e109c3e0d68" controls width="100%"></video> | <video src="https://github.com/user-attachments/assets/b46e74ba-a429-4c2c-a986-5f6436e83472" controls width="100%"></video> |

<br> <br>

---

<br> <br>
##  iOS Developer
| 최주희 | 허다연 |
| :---: | :---: |
| `iOS Lead`<br>`Developer` | `iOS Developer` |
| <img width="150" height="150" alt="image" src="https://github.com/user-attachments/assets/ce14f544-7284-4978-90c1-3bceae67bb48" /> | <img width="150" height="150" alt="image" src="https://github.com/user-attachments/assets/82836271-a29f-4a57-b72c-8af782a9095c" /> |
| `Home View`<br>`RestaurantDetail View` | `CompareRestaurant View` |

<br>

## 🥟 Tech Stack

### Language & Library
![Swift](https://img.shields.io/badge/-SWIFT-F05138?style=for-the-badge&logo=swift&logoColor=white)
![Kingfisher](https://img.shields.io/badge/-KINGFISHER-D9B900?style=for-the-badge)

### Architecture
![MVVM](https://img.shields.io/badge/-MVVM-512BD4?style=for-the-badge&logoColor=white)

### Network
![URLSession](https://img.shields.io/badge/-URLSESSION-000000?style=for-the-badge&logo=apple&logoColor=white)

### Collaboration
![Git](https://img.shields.io/badge/-GIT-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/-GITHUB-181717?style=for-the-badge&logo=github&logoColor=white)
![Figma](https://img.shields.io/badge/-FIGMA-F24E1E?style=for-the-badge&logo=figma&logoColor=white)
![Notion](https://img.shields.io/badge/-NOTION-000000?style=for-the-badge&logo=notion&logoColor=white)

<br>

## 🍙 Convention
### Branch
`태그/#이슈번호`
```
feat/#1
refactor/#3
```

### Tag
| 태그 | 사용 |
| :---: | :--- |
| `feat` | 새로운 기능 구현 시 사용 |
| `fix` | 버그나 오류 해결 시 사용 |
| `docs` | README, 템플릿 등 프로젝트 내 문서 수정 시 사용 |
| `setting` | 프로젝트 관련 설정 변경 시 사용 |
| `add` | 사진 등 에셋이나 라이브러리 추가 시 사용 |
| `refactor` | 기존 코드를 리팩토링하거나 수정할 시 사용 |
| `chore` | 별로 중요하지 않은 수정 시 사용 |
| `style` | UI 수정 시 사용 |


### Commit Message
`[prefix] #이슈번호 커밋 메시지`
```
[feat] #1 작업 로직 분리
```

<br>

## 🍕 Foldering
```
CatchTable/
├─ App/
│   ├─ CatchTableApp.swift
│   ├─ RootView.swift
│   └─ MainTabView.swift
│
├─ Core/
│   ├─ Network/
│   │   ├─ APIClient.swift
│   │   ├─ Endpoint.swift
│   │   ├─ BaseResponse.swift
│   │   ├─ NetworkError.swift
│   │   └─ AuthInterceptor.swift
│   └─ Extension/
│       ├─ Font+.swift
│       └─ View+.swift
│
├─ DesignSystem/
│   ├─ Component/
│   │   ├─ CatchTableButton.swift
│   │   ├─ CatchTableSearchBar.swift
│   │   └─ CatchTableNavigationBar.swift
│   └─ Modifier/
│       └─ ConfirmAlertModifier.swift
│
├─ Feature/
│   ├─ Home/
│   │   ├─ View/
│   │   ├─ ViewModel/
│   │   ├─ Model/
│   │   └─ Network/
│   │       ├─ HomeEndpoint.swift
│   │       ├─ HomeService.swift
│   │       └─ DTO/
│   ├─ RestaurantDetail/
│   └─ CompareRestaurant/
│
└─ Resource/
    ├─ Assets.xcassets
    ├─ Fonts/
    └─ Config.xcconfig
```
