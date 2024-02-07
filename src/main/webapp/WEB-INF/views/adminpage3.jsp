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
		<div>
			<div><button type="button" onclick="getList()">유저 리스트보기</button></div>
			<div>
				<select>
					<option>1</option>
					<option>2</option>
					<option>3</option>
				</select>
				<input type="text">
			</div>
			<div ><button type="button" onclick="getList()">유저 리스트접기</button></div>		
		</div>
		<table class="member-table" border="2">
			<thead>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
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
			</tr>
			</thead>
			<tbody id="member-list-body">
			
			</tbody>
		</table>
	</div>
</body>
<script src="./resources/js/jquery-3.6.0.min.js"></script>
    <!--  <script type="text/javascript" src="./resources/js/user_info.js"></script>-->
    
	<script type="text/javascript">
/* 		function getList() {
			$.ajax({
				url: "getMemberListDo", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				type: "post", // HTTP 요청방식 (get/post)
				dataType: 'json', // 서버에서 보내줄 데이터의 타입
				success: function (result) {
					console.log("에이젝스 값" + result.result);
					let members = result.result;

					if (Array.isArray(members)) {
						let tableBody = $("#member-list-body");
						tableBody.empty();
						let properties = ["id", "password", "name", "birthdate", "mail", "nickname", "join_date", "block_info", "profile_img_path", "sex", "account_permissions", "nationality"];

						members.forEach(function (member) {
							let row = $("<tr></tr>");
							properties.forEach(function (property) {
								
								if(property=="profile_img_path"){
									console.log(member[property]);
									var cell = $("<td><img src='" + member[property] + "' alt='프로필 이미지' class='profile'></td>");

								}else{
								var cell = $("<td></td>").text(member[property]);
								}
								row.append(cell);
							});
							tableBody.append(row);
						});
					} else {
						console.error("서버로부터 올바른 형식의 데이터가 전달되지 않았습니다.");
					}
				},
				error: function () {
					alert("서버요청실패");
				}
			})
		} */
	</script>

</html>