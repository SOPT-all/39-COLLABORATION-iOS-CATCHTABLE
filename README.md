# 39-COLLABORATION-iOS-CATCHTABLE
39기 합동 세미나 모바일 앱 2조 캐치테이블 🍱
<br> <br>
##  iOS Developer
| 최주희 | 허다연 |
| :---: | :---: |
| `iOS Lead`<br>`Developer` | `iOS Developer` |
| <img width="150" height="150" alt="image" src="https://github.com/user-attachments/assets/ce14f544-7284-4978-90c1-3bceae67bb48" /> | <img width="150" height="150" alt="image" src="https://github.com/user-attachments/assets/82836271-a29f-4a57-b72c-8af782a9095c" /> |

<br>

## 🥟 Tech Stack

### Language & Library
![Swift](https://img.shields.io/badge/-SWIFT-F05138?style=for-the-badge&logo=swift&logoColor=white)
![Kingfisher](https://img.shields.io/badge/-KINGFISHER-D9B900?style=for-the-badge)
<br>
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