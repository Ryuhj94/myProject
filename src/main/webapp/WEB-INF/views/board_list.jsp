<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_list</title>
<link type="text/css" href="./resources/css/board_list.css" rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<br>
		<h2>${board_class_kr }</h2>
		
		<table  class="list_body">
			<tr>
				<td colspan="6" class="list_num" style="border: none">
					<select name="pageSize" id="pageSize">
						<option value="30" ${board.pageSize eq '30' ? 'selected' : ''}>30 개</option>
						<option value="40" ${board.pageSize eq '40' ? 'selected' : ''}>40 개</option>
						<option value="50" ${board.pageSize eq '50' ? 'selected' : ''}>50 개</option>
						<option value="70" ${board.pageSize eq '70' ? 'selected' : ''}>70 개</option>
					</select>
				</td>
			</tr>
			<tr class="thead">
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>등록일</th>
				<th>추천</th>
				<th>조회수</th>
			</tr>
			<tbody id="tbody">
				<c:forEach items="${boardList }" var="board">
					<tr class="tbody_item">
						<td>${board.seq }</td>
						<td>
						<a href="board_views?board_class=${board.board_class}&seq=${board.seq}" class="view_link">
							<c:choose>
								<c:when test="${fn:length(board.title)>20}">
									${fn:substring(board.title,0,20) }...
								</c:when>
								<c:otherwise>
										${board.title}
								</c:otherwise>
							</c:choose>
						</a>
						</td>
						<td>${board.id }</td>
						<td>${board.write_date}</td>
						<td>${board.hit }</td>
						<td>${board.views }</td>
					</tr>
				</c:forEach>
			</tbody>
			<c:choose>
				<c:when test="${board.board_class eq 'notice_board'&& member.account_permissions eq 'admin'}">
						<td colspan="6" class="write_area"><a href="board_write?board_class=${board.board_class }" class="write_link">글쓰기</a></td>
				</c:when>
				<c:when test="${!empty member.id && board.board_class != 'notice_board'}">
						<td colspan="6" class="write_area"><a href="board_write?board_class=${board.board_class }" class="write_link">글쓰기</a></td>
				</c:when>
			</c:choose>
				
			<tr>
				<td colspan="6" style="border: none">
					<fmt:parseNumber var= "total_blockSize" integerOnly= "true" value= "${(board.totalPage / board.pageSize)+(1-(board.totalPage/board.pageSize)%1)} " />
					
					<c:choose>
    					 <c:when test="${board.pagingNum eq 0}">
        					<c:set var="startBlock" value="1" />
   						 </c:when>
    					<c:otherwise>
      						  <fmt:parseNumber var= "startBlock" integerOnly= "true" value= "${(board.pagingNum div board.pageSize)-(board.pagingNum div board.pageSize)%10+1 } " />
    					</c:otherwise>
						</c:choose>
				
					<c:choose>
						<c:when test="${startBlock+9 ge total_blockSize}">
							<fmt:parseNumber var="endBlock" integerOnly="true" value="${total_blockSize}"  />
						</c:when>
						<c:otherwise>
							<c:set var="endBlock" value="${startBlock+9 }"/>
						</c:otherwise>
					</c:choose>
					
	 				 <a href="board_list_link?pagingNum=0&board_class=${board.board_class}&searchCondition=${board.searchCondition}&searchKeyword=${board.searchKeyword}&pageSize=${board.pageSize}"  class="pagingItems pageLink"><img src="./resources/imgs/double-left-Icon.svg"></a> 
	 				 <c:if test="${startBlock != 1}">
	 				 	<a href="board_list_link?pagingNum=${(startBlock-9)*board.pageSize+0 }&board_class=${board.board_class}&searchCondition=${board.searchCondition}&searchKeyword=${board.searchKeyword}&pageSize=${board.pageSize}"  class="pagingItems pageLink"><img src="./resources/imgs/left-Icon.svg"></a>
	 				 </c:if>
	 				 
		 			<c:forEach var="pagingNumber" begin="${startBlock }" end="${endBlock}" step="1">
 						<c:choose>
							 <c:when test="${(pagingNumber-1)*board.pageSize eq board.pagingNum}">
								<a href="board_list_link?pagingNum=${(pagingNumber-1) * board.pageSize}&board_class=${board.board_class}&searchCondition=${board.searchCondition}&searchKeyword=${board.searchKeyword}&pageSize=${board.pageSize}" class="curentPage pageLink">${pagingNumber}</a>	
							</c:when>
						<c:otherwise>
								<a href="board_list_link?pagingNum=${(pagingNumber-1) * board.pageSize}&board_class=${board.board_class}&searchCondition=${board.searchCondition}&searchKeyword=${board.searchKeyword}&pageSize=${board.pageSize}"  class="pagingItems pageLink">${pagingNumber}</a>	
						</c:otherwise>
					</c:choose>
					</c:forEach> 
					
					<c:if test="${startBlock+9 < total_blockSize}">
	 				 	<a href="board_list_link?pagingNum=${(startBlock+9)*board.pageSize }&board_class=${board.board_class}&searchCondition=${board.searchCondition}&searchKeyword=${board.searchKeyword}&pageSize=${board.pageSize}"  class="pagingItems pageLink"><img src="./resources/imgs/right-Icon.svg"></a>
	 				 </c:if>
					 <a href="board_list_link?pagingNum=${(total_blockSize-1)*board.pageSize}&board_class=${board.board_class}&searchCondition=${board.searchCondition}&searchKeyword=${board.searchKeyword}&pageSize=${board.pageSize}"  class="pagingItems pageLink"><img src="./resources/imgs/double-right-Icon.svg"></a>
					</td>
			</tr>
			<tr class="search_area">
				<td colspan="6" style="border: none">
		<form  method="post" action="board_list">
					<select name="searchCondition" id="searchCondition">
						<option value="title" ${board.searchCondition eq 'title' ? 'selected' : ''}>제목</option>
						<option value="content" ${board.searchCondition eq 'content' ? 'selected' : ''}>내용</option>
						<option value="all" ${board.searchCondition eq 'all' ? 'selected' : ''}>제목+내용</option>
					</select>
					<input type="text" name="searchKeyword" id="searchKeyword" value="${board.searchKeyword}">
					<input type="hidden" name="board_class" id="board_class" value="${board.board_class }">
					<input type="hidden" name="hiddenPageSize" id="hiddenPageSize">
					<input type="submit" value="검색">
		</form>
				</td>
			</tr>
		</table>
	</div>
	
	<script src="./resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="./resources/js/board_list.js"></script>
</body>
</html>