<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="./resources/css/adminpage.css" rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl -->
<!--부트스트랩 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!--폰트style  -->
  <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<title>user_modify</title>
</head>

<body>
	<div class="container">
		<h1>관리자 페이지</h1>
		<h3><a href="mainPage">메인페이지로</a></h3>
		<h3>회원 정보</h3>
		<table class="member-table" border="2">
			<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생일</th>
				<th>이메일</th>
				<th>닉네임</th>
				<th>가입일</th>
				<th>정지여부</th>
				<th>프로필</th>
				<th>성별</th>
				<th>관리 권한</th>
				<th>국적</th>
				<th>벤처리</th>
			</tr>
			</thead>
			<tbody id="member-list-body">
				<c:forEach items="${memberList }" var="member">
					<tr>
						<td>${member.id }</td>
						<td>${member.name }</td>
						<td>${member.birthdate }</td>
						<td>${member.mail }</td>
						<td>${member.nickname }</td>
						<td>${member.join_date }</td>
						<td>${member.block_info }</td>
						<td><img src=" ${member.profile_img_path }" class="profile"> </td>
						<td>${member.sex }</td>
						<td>${member.account_permissions }</td>
						<td>${member.nationality }</td>
					<c:choose>
					    <c:when test="${!member.block_info}">
					       		<td><a href="blockDO?id=${member.id }" style="color: red;">밴처리</a></td>
					    </c:when>
					    <c:otherwise>
					   			 <td><a href="blockClear?id=${member.id }" style="color:orange;">밴해제</a></td>
					    </c:otherwise>
					</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h3>신고 정보</h3>
		<table class="reportTable" border="2">
			<tr>
					<th>게시물 번호</th>
					<th>댓글 번호</th>
					<th>댓글 종류</th>
					<th>보드 종류</th>
					<th>작성자</th>
					<th>신고자</th>
					<th>신고 내용</th>
					<th>신고 유형</th>
					<th>신고일자</th>
					<th>삭제처리</th>
			</tr>
			<c:forEach items="${reportList }" var="report">
			<tr>
					<td>${report.seq }</td>
					<td>${report. seq_comment}</td>
					<td>${report.comment_class}</td>
					<td>${report.board_class }</td>
					<td>${report.id }</td>
					<td>${report.reporter }</td>
					<td>${report.content}</td>
					<td>${report.report_type}</td>
					<td>${report.report_date }</td>
					<td>
					<form action="reportDeletDo" method="post">
					<input type="hidden" value="${report.seq }" name="seq">
					<input type="hidden" value="${ report. seq_comment}" name="seq_comment">
					<input type="hidden" value="${report.comment_class }" name="comment_class">
					<input type="hidden" value="${report.board_class }" name="board_class">
					<input type="hidden" value="${report.id }" name="id">
					<input type="hidden" value="${report.reporter }" name="reporter">
					<input type="hidden" value="${report.content }" name="content">
					<input type="hidden" value="${report.report_type }" name="report_type">
					<input type="hidden" value="${report.report_date }" name="report_date">
					<input type="hidden" value="${report.no }" name="no">
					<input type="submit" value="삭제처리" class='reportsubmit"'>
					</form>
					</td>
			</tr>	
			</c:forEach>
		</table>
		</div>
</body>
<script src="./resources/js/jquery-3.6.0.min.js"></script>
</html>