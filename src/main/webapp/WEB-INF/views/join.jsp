<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link type="text/css" href="./resources/css/join.css" rel="stylesheet" />
<!--부트스트랩 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!--폰트style  -->
  <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<title>JoinPage</title>
</head>
<body>
  <div class="mx-auto">
      <div class="logo-area">
        <a href="mainPage"><img src="./resources/imgs/Logo.png" class="logo" /></a>
      </div>
      <div class="input-area">
      <form method="post" action="joinDO" >
        <input type="text" name="id" id="user-id" class="input-item" placeholder="아이디" required/>
        <img src="./resources/imgs/ID-Icon.svg"  class="input-img">
        <input type="password" id="user-pw" name="password" class="input-item" placeholder="비밀번호" required/>
        <img src="./resources/imgs/PW-Icon.svg" class="input-img">
        <input type="text" id="user-email" class="input-item" name="mail" placeholder="이메일" required/>
        <img src="./resources/imgs/mail-Icon.svg" class="input-img">
        <div class="error-massage1">
          <p>· 아이디는 4~12자의 소문자, 숫자만 사용해주세요.</p>
          <p>· 비밀번호 총 8~16자, 대/소문자,숫자,특수문자를 1개 이상 사용해 주세요.</p>
          <p>· 이메일 형식이 아닙니다.</p>
          <p id="idCheck-false">· 사용할 수 없는 아이디입니다.</p>
          <p id="idCheck-true" style="color: blue;">· 사용할 수 있는 아이디 입니다.</p>
        </div><br>
        <input type="text" id="check-id" class="input-item"  placeholder="아이디확인" required/>
        <img src="./resources/imgs/ID-Icon.svg" class="input-img">
        <input type="password" id="check-pw" class="input-item" placeholder="비밀번호확인" required/>
        <img src="./resources/imgs/PW-Icon.svg" class="input-img">
        <div class="error-massage2">
          <p>아이디가 다릅니다. 다시 입력해주세요</p>
          <p>비밀번호가 다릅니다. 다시 입력해주세요</p>
        </div>
        <input type="text" id="user-name" name="name" class="input-item" placeholder="이름" required/>
        <img src="./resources/imgs/ID-Icon.svg" class="input-img">
        <input type="date" id="user-birthdate" class="input-item" name="birthdate" placeholder="생년월일" required/>
        <div id="sex-nationality-area">
          <input type="radio" name="sex" value="men" id="men">
          <label for="men">남자</label>
          <input type="radio" name="sex" value="girl" id="girl">
          <label for="girl">여자</label>
          <input type="radio" name="nationality" value="local" id="local" checked>
          <label for="local">내국인</label>
         <input type="radio" name="nationality" value="foreigner" id="foreigner">
          <label for="foreigner">외국인</label>
        </div>
        <div class="error-massage3">
          <p>· 이름은 한글, 영문 대/소문자를 사용해 주세요. (특수기호, 공백 사용 불가).</p>
          <p>· 생년월일 입력해 주세요.</p>
          <p>. 성별 및 국적을 선택해주세요</p>
        </div>
        
       <div id="imput-area">
        <button type="submit" class="input-item" id="join-edn" >가입 하기</button>
      </div>
         </form>
      </div>

    </div>
    <script src="./resources/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="./resources/js/join.js"></script>
</body>
</html>