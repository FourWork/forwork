# FORWORK
비 대면 업무 처리 그룹웨어   
   
#### 기간   
    2021.04.05 ~ 2021.04.16 (1차 스프린트)   
    2021.05.10 ~ 2021.05.12 (스프링 변환)   
    2021.05.12 ~ 2021.05.28 (2차 스프린트)   
**개발 : Spring Tool Suite 3.8.2.RELEASE, SQL Developer**   
**사용 언어 : JAVA (JDK 1.8), Oracle SQL, HTML5, CSS, JavaScript, JSP, JQuery**   
**사용 기술 : Spring Framwork, MyBatis**   
**디자인 프레임워크 : Bootstrap**   

#### 전체 기능 ⚙️
- 프로젝트 관리
    - PM용 프로젝트 진행 상황 확인 페이지 (전체 진행률, 멤버별 업무 진행률)
    - 개별 멤버가 프로필에서 자신의 포트폴리오 작성 가능 (자신이 수행한 프로젝트 및 기술 스택 목록)   
      ▷ PM과 전체 관리자가 조회하여 추후 프로젝트에 참고 가능
- 근태 관리
    - 출근일, 시간 통계 그래프
- 프로젝트 수행
    - TO DO LIST
    - 게시판
    - 스크럼 보드
    - 채팅
    - 캘린더

---
### 나의 역할   
- 게시판 
    - 프로젝트별 게시판 목록, 추가, 수정, 삭제
    - 게시판별 글 목록, 추가, 수정, 삭제, 검색
    - 게시글 내 첨부 파일 등록, 목록, 수정, 삭제, 다운로드
    - 댓글 - 댓글 목록, 추가, 수정, 삭제


- TO DO LIST 
    - TO DO / DONE 목록, 추가, 수정, 삭제

### 요구 사항
- 게시판
    - 새 프로젝트 생성 시 자동으로 공지 사항, 기본 게시판이 생성된다.
    - 게시판 관리를 통해 게시판을 추가, 수정, 삭제할 수 있다.
    - 공지 사항 게시판은 수정, 삭제할 수 없다.
    - 게시판 메인 화면에서 공지 사항, 최신 글 목록을 볼 수 있다.
    - 특정 게시판으로 이동하여 게시판별 게시글 목록을 볼 수 있다.
    - 게시판별 게시글 추가, 수정, 삭제가 가능하다.
    - 게시글 추가 시 파일을 첨부할 수 있다.
    - 게시글 수정 시 파일을 추가, 삭제할 수 있다.
    - 게시글별 댓글 추가, 수정, 삭제가 가능하다.


- TO DO LIST
    - 프로젝트 메인 페이지에 회원별 TO DO LIST가 제공된다.
    - 회원은 해야 할 일을 추가, 수정, 삭제할 수 있다.
    - 회원은 완료한 일을 체크, 삭제할 수 있다.
    - 완료된 일은 취소선이 생기고 밑으로 이동한다.   


---
### 구현

#### 프로젝트 메인 화면   
    TO DO LIST / 공지 사항

![프로젝트 메인](https://user-images.githubusercontent.com/73222541/120598090-cf6fca00-c480-11eb-92c5-115bae2e7520.jpg)
   

#### 게시판 메인 화면   
![forwork_board_main](https://user-images.githubusercontent.com/73222541/120595754-d812d100-c47d-11eb-8177-e1f8b4a31ec1.jpg)   

#### 게시판 관리
    게시판 추가, 수정, 삭제   
![forwork_board_manager](https://user-images.githubusercontent.com/73222541/120595995-288a2e80-c47e-11eb-9559-bc543ab03cdc.jpg)   

#### 게시판별 게시글 / 댓글
![forwork_post_list](https://user-images.githubusercontent.com/73222541/120596074-4192df80-c47e-11eb-9b6b-a77dbdfd53b0.jpg)   
![forwork_post_detail](https://user-images.githubusercontent.com/73222541/120596131-53748280-c47e-11eb-9090-6bfabc4173fa.jpg)

#### 게시글 첨부 파일
    게시글 작성 시 파일 추가, 삭제 가능   
    사진 파일은 클릭하면 미리 보기, 일반 파일은 다운로드   
![forwork_post_attach](https://user-images.githubusercontent.com/73222541/120596175-612a0800-c47e-11eb-9125-3c64a8e7a987.jpg)   
![forwork_post](https://user-images.githubusercontent.com/73222541/120596198-69824300-c47e-11eb-9a10-db6029116425.jpg)   
![forwork_post_photo](https://user-images.githubusercontent.com/73222541/120596229-756e0500-c47e-11eb-89d3-1d8617a57186.jpg)

#### 게시글 / 댓글 수정
![게시글 수정](https://user-images.githubusercontent.com/73222541/120598061-c3840800-c480-11eb-8038-3a436013ae2f.jpg)
![댓글 수정](https://user-images.githubusercontent.com/73222541/120598066-c5e66200-c480-11eb-8aa3-56ded51cac21.jpg)


#### 게시글 검색
    제목 / 내용 / 작성자 / 제목 + 내용 / 제목 + 작성자 / 제목 + 내용 + 작성자 검색 가능   
    검색 결과 내 게시글 조회, 수정, 삭제 후에도 검색 상태 유지   
![forwork_post_search](https://user-images.githubusercontent.com/73222541/120596584-e6adb800-c47e-11eb-8d29-2d16e642902c.jpg)
