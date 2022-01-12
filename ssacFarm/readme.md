
# 🌱 새싹 커뮤니티

![Badge](https://img.shields.io/badge/Xcode-13.0-blue) 
![Badge](https://img.shields.io/badge/iOS-13.0-green)
![Badge](https://img.shields.io/badge/Swift-5-orange)
![Badge](https://img.shields.io/badge/SnapKit-5.0.1-blue)
![Badge](https://img.shields.io/badge/Toast-5.0.1-yellow)
![Badge](https://img.shields.io/badge/IQKeyboardManager-6.5.9-important)

<br>


- 서버와 iOS 클라이언트 통신 (iOS 클라이언트 개발 담당)

- 회원가입/로그인 후 게시글과 게시글에 대한 댓글을 작성/수정/삭제 기능 구현



<br>
<br>


## 🌱 기간별 일정

<br>

기간: 21.12.31 - 22.01.06  **(총 5일)**

<br>

| 진행사항 | 진행기간 | 세부사항 |
|:---:| :--- | :--- |
| UI | 2021.12.31 | 앱 전체적인 View 개발 |
| Auth | 2022.01.03 | 회원가입 및 로그인 기능 개발 |
| Post, Comment | 2022.01.04~22.01.06 | Post, Comment CRUD 개발 |
 
<br>
<br>

## 🌱 View 시연 영상

<br>

<details>
<summary>Auth</summary>
 
<br>

 - 회원가입, 로그인

https://user-images.githubusercontent.com/93528918/149186739-361524ef-8019-489c-b1b1-92105b7e74a8.mov

<br>


- 비밀번호 변경, 로그아웃
	
https://user-images.githubusercontent.com/93528918/149187957-8a460709-5f88-4096-b4b5-b83d5f0ce201.mov


</div>
</details>

<br>

<details>
<summary>Post</summary>
 
<br>

- Post 작성
	
https://user-images.githubusercontent.com/93528918/149188233-e25d92b6-3922-4557-88dd-2b47ab02c072.mov


<br>

- Post 수정

https://user-images.githubusercontent.com/93528918/149188242-bf08da41-7dc4-435c-a16e-3f0b11e18cf8.mov

<br>

- Post 삭제

https://user-images.githubusercontent.com/93528918/149188255-edfcd8f4-e2ef-409e-8583-0791c1463352.mov


</div>
</details>

<br>

<details>
<summary>Comment</summary>
 
<br>

- Comment 작성
	
https://user-images.githubusercontent.com/93528918/149188487-cac62e0f-c75a-44da-bdfe-9153352dd45d.mov



<br>

- Comment 수정


https://user-images.githubusercontent.com/93528918/149188496-71a26733-ba54-48dc-b5f8-c10df0828fbf.mov



<br>

- Comment 삭제


https://user-images.githubusercontent.com/93528918/149188506-9745fae7-3390-4f93-a84f-576922f460ae.mov



</div>
</details>

<br>
<br>

## 🌱 구현 이슈

<br>

> ViewModel에서 API 호출 로직 작성


<br>

**ViewModel** → 비즈니스 로직을 처리

**ViewModel**에서 API호출하는 로직을 처리하고, **Controller**에서 알람이나 화면 전환 등 화면 처리를 해주는 걸로 이해.

❓ 그런데 아래 코드처럼 처리할 비즈니스 로직이 없는 경우, **ViewModel에서 API호출하는 코드를 작성하면 괜히 코드만 많아지는 거같아서 그냥 Controller에서 API호출을 하는 게 좋겠다는 생각**과 그래도 **MVVM을 적용한거라면 ViewModel에서 호출하는게 맞는가** 라는 생각이 듬.

<br>

![3C78364E-07BB-4C25-A823-B4188DD8A253_4_5005_c](https://user-images.githubusercontent.com/93528918/149189072-ee9a7923-11b2-4c06-aad5-171f04c2796a.jpeg)

![98287277-E478-4E1F-8FD9-7B1B0105EADD_4_5005_c](https://user-images.githubusercontent.com/93528918/149189078-a25e3cdc-97d2-4168-b398-56164ec9eb7c.jpeg)

<br>
	
결국 아키텍쳐 설계 역시 사용법, 방법론적인 것이고, 본인만의 기준을 세워 조금 변경된 패턴이나 새로운 패턴을 적용해보는 것도 아키텍처 설계에 해당.

질문의 목적을 전환해본다면 **"MVVM으로 적용하는 것이 적합할까?"**

프로젝트에서 구성된 모든 패턴이 MVVM이라고 가정한다면, 일관적인 형태로 코드의 Flow가 흘러가는 것이 중요

지금은 비즈니스 로직이 없는 뷰일지라도, 새로운 기능이 생기고, 유지보수를 하고, 여러 화면을 하나의 화면으로 합하게 될 경우 등을 고려해본다면 특정 화면만 API 호출이 뷰컨트롤러에서 이루어진다면 코드의 패턴을 파악하기가 타인이 바라볼 때는 어려울 수도 있음!
