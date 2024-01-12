<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link type="text/css" href="./resources/css/MainPage.css" rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>mainCommunityPage</title>
</head>

<body>

	<div class="container">
		<nav class="navbar navbar-expand-md">
			<a class="navbar-brand" href="mainPage"><img src="./resources/imgs/Logo.png"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"><img class="moreMenu" src="./resources/imgs/justify.svg"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="Testok">지도확인</a></li>
					<li class="nav-item"><a class="nav-link" href="#">커뮤니티</a></li>
					<li class="nav-item"><a class="nav-link" href="#">문의하기</a></li>
					<c:choose>
						<c:when test="${empty  member.id}">
							<li class="nav-item"><a class="nav-link" href="login">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item login-nav"><a class="nav-link" href="#">마이페이지</a></li>
							<li class="nav-item "><a class="nav-link" href="logoutDo">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
		<div class="row">
			<div class="col-md-5 community-freeBoard" style="background-color:lavender;">zz</div>
			<div class="col-md-5 community-gathering" style="background-color:lavender;">zz</div>
			<div class="col-md-5 community-info" style="background-color:lavender;">zz</div>
			<div class="col-md-5 community-notice" style="background-color:lavender;">zz</div>
		</div>
	</div>

</body>
</html>