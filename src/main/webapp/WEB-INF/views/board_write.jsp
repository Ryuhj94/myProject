<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_views</title>
<link type="text/css" href="./resources/css/board_write.css" rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl -->

<!--부트스트랩 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="./resources/js/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!--폰트style  -->
  <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
  <!-- Summernote -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>

	<div class="container" >
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
	<!-- 상단 매뉴 -->
	<form method="post" action="insertBoardDo" enctype="multipart/form-data">
		<div class="form-group">
  			<label for="title">제목 </label>
 			 <input type="text" class="form-control" id="title" name="title" required>
		</div>
		<div class="form-group">
  			<label for="content">내용 </label>
 			<textarea id="content" name="content" required></textarea>
		</div>
			<input type="hidden" value="${board_class }" name="board_class">
			<input type="hidden" value="${member.id }" name="id">
			<input type="submit" value="작성하기" class="write_button" onclick="closeSummernote()">
	</form>
	</div>
	<!--  $('#summernote').summernote('destroy'); 꼭 닫아주어야된다.-->
<script>
    $(document).ready(function () {
        $('#content').summernote({
            lang: 'ko-KR',
            height: 300,
            placeholder: '내용을 입력하세요',
            toolbar: [
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                ['color', ['forecolor', 'color']],
                ['table', ['table']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['insert', ['picture', 'link']],
                ['view', ['help']]
            ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체',
                '굴림', '돋음체', '바탕체'],
            fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36',
                '50', '72'],
            callbacks: {
                onImageUpload: function (files) {
                    sendFile(files[0], this);
                }
            }
        });
		function closeSummernote() {
			$('#summernote').summernote('destroy');
		}
        function sendFile(file, editor) {
            var data = new FormData();
            data.append("file", file);
            
            $.ajax({
                data: data,
                type: "POST",
                url: "insertBoardimgDo",
                enctype:"multipart/form-data",
                contentType: false,
                processData: false,
                success: function (board_img_path) {
                	console.log(board_img_path);
                    $(editor).summernote("insertImage", board_img_path);
                }
            });
        }
            $('#content').on('summernote.change', function () {
                if ($(this).val().length > 4000) {
                    alert("작성 한도를 초과하였습니다.");
                }
            });
        });
</script>
</body>
</html>