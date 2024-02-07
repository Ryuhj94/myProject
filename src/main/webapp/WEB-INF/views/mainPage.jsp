<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainPage</title>
<link type="text/css" href="./resources/css/MainPage.css" rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- jstl -->
<!--부트스트랩 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!--폰트style  -->
  <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

</head>

<body style="height:1500px">

	<div class="container">
		<nav class="navbar navbar-expand-md">
			<a class="navbar-brand" href="mainPage"><img src="./resources/imgs/Logo.png"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"><img class="moreMenu" src="./resources/imgs/justify.svg"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="board_list?board_class=notice_board">공지 사항</a></li>
					<li class="nav-item"><a class="nav-link" href="board_list?board_class=free_board">자유 게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="board_list?board_class=gathering_board">소모임 게시판</a></li>
					<c:choose>
						<c:when test="${empty member.id}">
							<li class="nav-item"><a class="nav-link" href="login">로그인</a></li>
						</c:when>
						<c:otherwise>
						<li class="nav-item">
							<button type="button" class="btn"  data-toggle="modal" data-target="#myModal"><img src="${member.profile_img_path }" class="rounded-circle profile"/></button>
							<div class="modal fade" id="myModal">
								<div class="modal-dialog modal-sm">
									<div class="modal-content">
										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">${member.nickname }님 안녕하세요!</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
										<div class="modal-body">
											<a class="nav-link" href="user_info">● 마이페이지</a>
											<a class="nav-link" href="logoutDo">● 로그아웃</a>
											<c:if test="${member.account_permissions eq 'admin'}">
												<a class="nav-link" href="adminpage">● 관리자페이지</a>
											</c:if>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
										</div>

									</div>
								</div>
							</div>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
	</div>
	<div class="imgbox">
		<div id="demo" class="carousel slide" data-ride="carousel">
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="./resources/imgs/MainImage1.jpg">
					<div class="carousel-caption">
					</div>
				</div>
				<div class="carousel-item">
					<img src="./resources/imgs/MainImage2.jpg">
					<div class="carousel-caption">
					</div>
				</div>
				<div class="carousel-item">
					<img src="./resources/imgs/MainImage3.jpg">
					<div class="carousel-caption">
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
		</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<table>
					<tr>
						<th colspan="2">공지사항</th>
					</tr>
				<c:forEach items="${noticeList }" var="notice">
					<tr>
							<td>${notice.seq}</td>
					<c:choose>
						<c:when test="${fn:length(notice.title)>10}">
			 					<td>${fn:substring(notice.title,0,10) }...</td>
			 			</c:when>
						<c:otherwise>
							<td>${notice.title}</td>
						</c:otherwise>
					</c:choose>
					</tr>
				</c:forEach>
				</table>
			</div>

			<div class="col-sm-3">
				<table>
				<tr>
					<th colspan="2">자유게시판 베스트</th>
				</tr>
				<c:forEach items="${freeList }" var="free">
				<tr>
					<td>${free.seq}</td>
					<c:choose>
						<c:when test="${fn:length(free.title)>10}">
										<td>${fn:substring(free.title,0,10)}...</td>	
						</c:when>
						<c:otherwise>
								<td>${free.title }</td>
						</c:otherwise>
					</c:choose>
				</tr>	
				</c:forEach>
				</table>
			</div>
			
			<div class="col-sm-3">
				<table>
					<tr>
						<th colspan="2">소모임게시판 베스트</th>
					</tr>
				<c:forEach items="${gateringList }" var="gatering">
					<tr>
						<td>${gatering.seq}</td>
					<c:choose>
						<c:when test="${fn:length(gatering.title)>10}">
			 				<td>${fn:substring(gatering.title,0,10) }...</td>
			 		</c:when>
						<c:otherwise>
							<td>${gatering.title}</td>
						</c:otherwise>
					</c:choose>
					</tr>
				</c:forEach>
				</table>
			</div>
			
		</div>
	</div>

</body>
</html>