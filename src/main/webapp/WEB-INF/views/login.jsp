<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link type="text/css" href="./resources/css/login.css" rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl -->
<!--부트스트랩 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!--폰트style  -->
  <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginPage</title>
</head>

<body>
	<div class="mx-auto">
		<a href="mainPage"><img class="logo" src="./resources/imgs/Logo.png"></a>
		
		<form action="loginDo" method="post">
			<input type="text" class="input-box" name="id" placeholder="아이디"><br>
			<img class="input-IMG id-IMG" src="./resources/imgs/ID-Icon.svg">
			<img class="input-IMG pw-IMG" src="./resources/imgs/PW-Icon.svg">
			<input type="password" class="input-box password-input" name="password" placeholder="비밀번호"><br>
			<input type="submit" value="로 그 인" class="loin-submit">
		</form>
	<ul>
		<li><a href="#" class="foot-menu">아이디•비밀번호 찾기</a></li>
		<li><a href="join">회원가입</a></li>
	</ul>	
	</div>
	<c:choose>
		<c:when test="${loginFail}"><script>alert('로그인에 실패했습니다.');</script></c:when>
		<c:when test="${block}"><script>alert('접근이 제한된 계정입니다.');</script></c:when>
	</c:choose>
</body>
</html>