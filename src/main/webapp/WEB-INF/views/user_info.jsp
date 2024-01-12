<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="./resources/css/user_info.css" rel="stylesheet" />
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
		<a href="mainPage"><img src="./resources/imgs/Logo.png"></a>
		<form action="usermodifyDo" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>프로필</td>
					<td>
						<div class="profile_img_box">
							<img src="${member.profile_img_path }">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="customFile" name="uploadFile" accept="image/gif,image/jpeg,image/png">
							 <label class="custom-file-label" for="customFile">이미지 파일선택</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${member.id }</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="password" name="password" value="${member.password }"></td>
				</tr>
				<tr><td colspan="2"><p id="error-pw">· 비밀번호는 총 8~16자, 대/소문자,숫자,특수문자를 1개 이상 사용해 주세요.</p></td></tr>
				<tr>
					<td>이름</td>
					<td>${member.name }</td>
				</tr>
				<tr>
					<td>생일</td>
					<td>${member.birthdate }</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" id="nickname" name="nickname" value="${member.nickname }"></td>
				</tr>
				<tr><td colspan="2"><p id="error-nickname">· 닉네임은 2~16자의 길이로 입력해야하며, 특수 기호는 사용할 수 없습니다. </p></td></tr>
				<tr>
					<td>가입일</td>
					<td>${member.join_date }</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정하기" id="modifysubmit" class="modifysubmit"><input type="hidden" value="${member.id }" name="id"  ><input type="hidden" value="${member.profile_img_path} "></td>		
				</tr>
			</table>
		</form>
	</div>
</body>
    <script src="./resources/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="./resources/js/user_info.js"></script>

</html>