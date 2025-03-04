# ☕ KOFI  

## 📌 목차  
- [프로젝트 요약](#📌-프로젝트-요약)  
- [진행 상황](#📅-진행-상황)  
- [구현 결과](#🖥-구현-결과)  
- [트러블 슈팅](#🛠-트러블-슈팅)  
- [학습한 내용](#📚-학습한-내용)  
- [느낀 점](#💬-느낀-점)  

---

## 📌 프로젝트 요약  

| 항목              | 상세 내용 |
|-----------------|--------------------------------------------------------------|
| **기여도**       | **100% (1인 개발)** |
| **프로젝트 목적** | 커피 주문 앱 개발을 통해 사용자 친화적인 앱 개발 |
| **구현 기간**    | **2024.02.16 ~ 2024.02.26** |
| **기술 스택**    | **Flutter / Dart** |
| **핵심 기능**    | ✅ 커피 메뉴 리스트  <br> ✅ 상세 정보 및 주문 기능  <br> ✅ 장바구니 & 결제 UI 구현  <br> ✅ 배달 및 픽업 옵션 선택  |

---

## 📅 진행 상황  

| 날짜          | 작업 내용 |
|--------------|-------------------------------------------|
| **2024.02.16** | 📌 **프로젝트 기획**  <br> - 앱 이름 **"KOFI"** 선정  <br> - 주요 기능 및 화면 구성 구상  <br> - 폴더 구조 설계 |
| **2024.02.19** | 📌 **프로젝트 구현**   <br> - 온보딩 화면 구현  <br> - 홈 화면 구현(도시 선택, 배경) |
| **2024.02.20** | 📌 **프로젝트 구현**   <br> - 디테일 화면 구현  <br> - 홈 화면 구현(그리드 뷰, 서치 바) |
| **2024.02.24** | 📌 **프로젝트 구현**   <br> - 홈 화면 구현 (코드 리펙토링, UI 개선, 배너 온보딩)|
| **2024.02.25** | 📌 **프로젝트 구현**   <br> - 오더 뷰 : 배달 방식(예: 매장 픽업, 배달 등)에 따라 총 결제 금액이 자동으로 계산되도록 구현 <br> - 디테일 뷰 : UI 디자인 및 사용성 개선  |

---

## 🖥 구현 결과  

### 📌 앱 주요 화면  
|  |  |  |  
|:----------------------------:| :----------------------------:|  :----------------------------:|  
| ![Home view](https://github.com/user-attachments/assets/142fc134-4e05-4e06-9ff6-1b7bf0b9c73a) | ![Detail view](https://github.com/user-attachments/assets/95f2f4d9-9c34-41fc-8763-779fcf7fc0d2) | ![Order view](https://github.com/user-attachments/assets/65ba599d-3762-4928-9d13-f0981097e6b6) |  

---

## 🛠 트러블 슈팅  

### ❌ 문제 1: 검색 필터가 정상적으로 동작하지 않음  
#### 🔍 원인 분석  
- `_searchQuery` 상태 값이 변경될 때 `_filteredCoffees` 리스트가 올바르게 업데이트되지 않음  
- `setState()`를 호출하지 않거나, 필터링 로직이 올바르게 적용되지 않은 경우  

#### ✅ 해결 방법  
- `setState()` 내에서 `_searchQuery` 값을 업데이트하여 변경 사항을 즉시 반영  
- 필터링 조건을 추가하여 커피 이름이 검색어를 포함하는지 검사  
- `toLowerCase()`를 사용하여 대소문자 구분 없이 검색 가능하도록 개선  

---

## 📚 학습한 내용  

### 1️⃣ **Flutter에서 상태 관리 (State Management)**
- `setState()`의 역할과 상태 업데이트 과정 이해
- 검색 기능과 필터 기능을 위한 상태 관리 적용

### 2️⃣ **Flutter UI 구성 방법**
- `GridView.builder()`를 활용한 동적 리스트 UI 구현
- `Stack`과 `Positioned`를 이용한 배너 UI 디자인 적용

### 3️⃣ **Flutter에서 테마 적용**
- `ThemeData`를 활용한 앱 전반적인 색상 및 스타일 통일  
- `GoogleFonts` 패키지를 사용하여 텍스트 스타일링  

---

## 💬 느낀 점  

- 프로젝트를 진행하면서 **Flutter UI 구성과 상태 관리**에 대한 실전 경험을 쌓을 수 있었다.  
- `setState()`를 적절히 활용하는 것이 상태 업데이트에 중요하다는 점을 다시 한번 깨달았다.  
- 검색 필터링 기능 구현 과정에서 **사용자의 편의성을 고려한 검색 기능 최적화**가 중요하다는 점을 배웠다.  
- 앞으로 **Firebase 연동 및 결제 시스템 구현** 등을 추가하여 더욱 완성도 높은 앱을 만들고 싶다.  
