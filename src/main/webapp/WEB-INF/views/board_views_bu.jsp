<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_views</title>
<link type="text/css" href="./resources/css/board_views.css" rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<%-- <h1>${board.className }</h1> --%>

	<h1>게시판 > ${board_class_kr}</h1>
	<div class="board_info">
		<div class="top">
 			 <span>${board.title }</span>
 			 <span>${board.hit }</span>
 			 <span>조회수 : ${board.views }</span>
 			 <span><fmt:formatDate pattern="yyyy-MM-dd" value="${board.write_date}"/></span>
		</div>
		<div class="middle">
			<p>${board.content }</p>
		</div>
		
		<form action="BoardHitDo" method="post">
		<input type="hidden" value="${board.seq }" name="seq" >
		<input type="hidden" value="${board.board_class }" name="board_class">
		<input type="hidden" value="${member.id }" name="id" >
		<div class="util_area">
		<c:choose>	
			<c:when test="${hitState==true }">
				 <button id="hit_button"><img src="./resources/imgs/hit-Ikon.png"></button>
			</c:when>
			<c:otherwise>			
				 <button id="hit_button"><img src="./resources/imgs/hitNone-Ikon.png"></button>
			</c:otherwise>
		</c:choose>
		</form>
		<div class="reportArea">
		 <img src="./resources/imgs/declaration_Icon.png" class="btnmodal">
		<div class="modal">
			<div class="modal_body">
				<form action="insertReport" method="post">
					<h2>신고하기</h2>
					<p>신고 분류</p>
					<select name="report_type" class="report_type">
						<option value="porno">음란물</option>
						<option value="cuss">비방·비하·욕설</option>
						<option value="advertisement">광고</option>
						<option value="etc">기타</option>
					</select>
					<p>신고내용</p>
					<textarea class="report_content" name="content"> </textarea>
					<input type="hidden" value="${board.board_class }" name="board_class">
					<input type="hidden" value="${board.id }" name="id">
					<input type="hidden" value="${board.seq }" name="seq">
					<input type="hidden" value="${member.id }" name="reporter">
					<div class="modal_footer">
						<input type="submit" value="제출" class="modal_submit">
						<button type="button" class="modal_close">닫기</button>
					</div>
				</form>
			</div>
			</div>
</div>
		</div>
		<div class="comment_area">
			<c:if test="${member.id eq board.id}">
 			<a href="board_modify?board_class=${board.board_class}&seq=${board.seq}"><button class="modifyBoard">수정하기</button></a>
 			<a href="boardDelete?board_class=${board.board_class}&seq=${board.seq}"><button class="modifyBoard">게시물 삭제</button></a>
			 </c:if>
		<div class="comment_list">
					<!-- 뎃글 리스트 가져오기 -->
					<c:forEach items="${comentList }" var="coment">
						<div class="coments">
						<div class="reportArea">
							<span><img src="${coment.profile_img_path }"></span>
							 <span>${coment.id }</span>
							<span>${coment.write_date}</span> 
							<span class="reply">답글쓰기</span>
							 <span class="btnmodal" >신고</span>
						<div class="modal">
							<div class="modal_body">
								<form action="insertReport" method="post">
									<h2>신고하기</h2>
									<p>신고 분류</p>
									<select name="report_type" class="report_type">
										<option value="porno">음란물</option>
										<option value="cuss">비방·비하·욕설</option>
										<option value="advertisement">광고</option>
										<option value="etc">기타</option>
									</select>
									<p>신고내용</p>
									<textarea class="report_content" name="content"> </textarea>
									<input type="hidden" value="${coment.comment_class }" name="comment_class">
									 <input type="hidden" value="${coment.id }" name="id"> 
									  <input type="hidden" value="${board.seq }" name="seq">
									 <input type="hidden" value="${coment.seq_comment }" name="seq_comment">
									 <input type="hidden" value="${member.id }" name="reporter">
									<div class="modal_footer">
										<input type="submit" value="제출" class="modal_submit">
										<button type="button" class="modal_close">닫기</button>
									</div>
								</form>
							</div>
						</div>
						</div>
						<p>
							 <c:forEach begin="1" end="${coment.indent_num}" >
							 &nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
							<c:if test="${coment.indent_num>0}">
							<img src="./resources/imgs/indentnum-Icon.svg">
							</c:if>
								${coment.content}
							</p>
						</div>
						<div class="replys" style="display: none;">
						<form action="replysWriteDo" method="post">
						<div class="replys_write">
							<div class="replys-area">
 							<textarea class="replys_content" name="content"></textarea>
 	 						<input type="submit" value="등록" class="replys_sumit" onclick="submitNewComment()"> 
 	 						</div>
 	 						<p class="replys_num" >0/2000자</p>
  						</div>
  							<input type="hidden" value="${member.id}" name="id">
 	 						<input type="hidden" value="${board.seq}" name="seq">
 							 <input type="hidden" value="${board.board_class}" name="comment_class">
 							 <input type="hidden" value="${coment.stap_num}" name="stap_num">
 							 <input type="hidden" value="${coment.indent_num}" name="indent_num">
 							 <input type="hidden" value="${coment.group_num}" name="group_num">
 							
						</form>
						</div>
					</c:forEach>

				</div>			
			<form action="comentWriteDo" method="post">
			<div class="comment_write">
				<textarea class="conment_content" class='"conment_content'  id="conment_content" name="content"></textarea>
				<input type="submit" value="등록" class="conment_sumit" id="conment_sumit"> 
			</div>	
				<input type="hidden" value="${member.id}" name="id">
				<input type="hidden" value="${board.seq}" name="seq">
				<input type="hidden" value="${board.board_class}" name="comment_class">
			</form>
			<p class="content_num" id="content_num">0/2000자</p>
				</div>
			</div>
		<script>
		$(document).ready(function() {
			let openReplys = null;
		    $("#conment_content").on("input", function() {
		        let content_num = $("#conment_content").val().length;
		        $("#content_num").text(content_num + " / 2000자");
		        if (content_num > 2000) {
		            $("#content_num").css("color", "red");
		            alert("글자수를 초과하였습니다.");
		            let content=$("#conment_content").val().slice(0,1999);
		            $("#conment_content").val(content);
		        } else {
		            $("#content_num").css("color", "black");
		        }
		    });
		    
		    $("#conment_sumit").click(function (event) {
				let loginId="${member.id}";
				if (loginId === null || loginId === undefined || loginId === "") {
					alert("댓글 작성을 위해 로그인 해주세요.");
				     window.location.href = "login";
			         event.preventDefault(); 
				}
			}); 
		    $(".reply").click(function (event) {
		        let loginId = "${member.id}";
		        if (loginId === null || loginId === undefined || loginId === "") {
		            alert("댓글 작성을 위해 로그인 해주세요.");
		            window.location.href = "login";
		            event.preventDefault();
		        } else {
		            let parentComents = $(this).closest(".comment_list");
		            console.log("parentComents", parentComents);
		            let nextReplys = parentComents.find(".replys"); 
		            console.log("nextReplys", nextReplys);
		            if (openReplys != null) {
		                openReplys.hide();
		            }
		            openReplys = nextReplys;
		            console.log("openReplys", openReplys);
		            openReplys.show();
		        }
		    });
		    
		   	 $(document).on("input", ".replys_content", function() {
		        let content_num = $(this).val().length;
		        let parentDiv = $(this).closest(".replys_write");
		        let numElement = parentDiv.find(".replys_num");
		        numElement.text(content_num + " / 2000자");
		        if (content_num > 2000) {
		            numElement.css("color", "red");
		            alert("글자수를 초과하였습니다.");
		            let content = $(this).val().slice(0, 1999);
		            $(this).val(content);
		        } else {
		            numElement.css("color", "black");
		        }
		    });

		   	
		    let modal = $(".modal");
		    let btnmodal = $(".btnmodal");
		    let modal_close = $(".modal_close");
			 let openReplysModal = null;
			 
		    btnmodal.on('click', function(event) {
		        <c:if test="${member.id == null}">
		            alert("로그인 후 이용해주세요.");
		            event.preventDefault();
		            window.location.href = "login";
		        </c:if>
		        $(this).closest('.reportArea').find('.modal').show();
		    });
		    modal_close.on('click', function() {
		    	 $(this).closest('.reportArea').find('.modal').hide();
		    });
		    
		    $("#hit_button").click(function(event) {
		        <c:if test="${member.id == null}">
		            alert("로그인 후 이용해주세요.");
		            event.preventDefault(); 
		            window.location.href = "login";
		            return; 
		        </c:if>

		        $.ajax({
		            type: "POST",
		            url: "BoardHitDo",
		            data: {
		                seq: "${board.seq}",
		                board_class: "${board.board_class}",
		                id: "${member.id}"
		            },
		            success: function(response) {
		                console.log(response);
		                if (response === "true") {
		                    $("#hit_button img").attr("src", "./resources/imgs/hit-Ikon.png");
		                } else if (response === "false") {
		                    $("#hit_button img").attr("src", "./resources/imgs/hitNone-Ikon.png");
		                }
		            },
		            error: function() {
		                console.error("에러발생");
		            }
		        });
		      event.preventDefault();
		  });
		}); 
		</script>
</body>
</html>