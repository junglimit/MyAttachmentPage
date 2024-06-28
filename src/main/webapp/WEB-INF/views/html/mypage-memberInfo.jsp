<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <link rel="stylesheet" href="/assets/css/mypage-memberInfo.css">
    <!-- fontawesome css: https://fontawesome.com -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
  </head>
  <body>

    <!-- header  -->
    <header>
      <nav class="menu">
        <div class="inner">
          <div class="logo point">
            <a href="/">나의 애착 페이지</a>
          </div>
          <ul class="gnb">
            <li class="login point"><a href="/login">LOGIN</a></li>
            <li><i class="fas fa-bars"></i></li>
          </ul>
        </div>
      </nav>
    </header>
  
    <!-- main -->
    <main>
      <section class="mainpage">
        <div class="tr">

          <!-- left -->
          <div class="tr-left">

            <div class="profile-container">
              <div class="profile-box">
                <div class="profile">
                  <img src="/assets/img/profile.jpg" alt="profile">
                </div>
                <div class="profile-icon">
                  <i class="fas fa-user-cog"></i>
                  <!-- <a href="#" class="btn-gradient yellow mini">사진수정<i class="fas fa-user-cog"></i></a> -->
                  <input type="file" class="upload-img" accept="image/*" style="display: none" name="profileImage"/>
                </div>
              </div>
              <p class="profile-name">키티 님</p>
            </div>

            <div class="left-Menu">
              <a href="#"><p class="Menu-title">포인트 충전 </p></a>
            </div>
            <div class="left-Menu">
              <a href="/mypage-memberinfo"><p class="Menu-title">회원정보 수정 </p></a>
            </div>
            <div class="left-Menu">
              <a href="/mypage-password"><p class="Menu-title">비밀번호 수정 </p></a>
            </div>
            <div class="left-Menu">
              <a href="/mypage-cancel"><p class="Menu-title">회원탈퇴 </p></a>
            </div>
            <div class="left-logout">
              <a href="#" class="btn-gradient yellow mini">로그아웃<i class="fas fa-user-cog"></i></a>
            </div>

          </div>

          <!-- right -->
          <div class="tr-right">

            <div class="right-title">
              <p>회원 정보 수정</p>
            </div>

            <div class="right-contents">

              <div class="right-content">
                <p>소중한 개인정보를 최신으로 관리하세요.</p>
              </div>

              <form action="/memberInfo" method="post">
                <div class="right-input id">
                  <h2>아이디* </h2>
                  <input type="text" placeholder="아이디" readonly>
                  <p>"아이디는 변경할 수 없습니다."</p>
                </div>
                <div class="right-input">
                  <h2>이름*</h2>
                  <input type="text" placeholder="이름">
                  <p>"이름은 한글만 입력할 수 있습니다. (2자 이상)"</p>
                </div>
                <div class="right-input">
                  <h2>이메일*</h2>
                  <input type="text" placeholder="이메일">
                  <p></p>
                </div>
                <div class="right-input">
                  <h2>생년월일*</h2>
                  <input type="date" placeholder="생년월일">
                  <p></p>
                </div>
                <div class="input-check">
                  <button class="btn-gradient yellow large">확인</button>
                </div>
              </form>

            </div>
          </div>

        </div>
      </section>
    </main>

    <footer></footer>
    
    <script src="/assets/js/Mypage.js"></script>
  
</body>
</html>