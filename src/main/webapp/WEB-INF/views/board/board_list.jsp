<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>board_list</title>
</head>
<body>
	<div class="wrap">
		<!-- 헤더부분 -->
		
		<!-- 컨텐츠부분 -->
		<div id="container">
			<div id="contests">
				<div class="titleArea">
					<h1 align="center"> 게시판 </h1>
				</div>
				<div>
					<form name="boardList">
						<table>
							<tr>
								<th> 번호 </th>
								<th> 구분 </th>
								<th> 제목 </th>
								<th> 작성자 </th>
								<th> 추천 </th>
								<th> 조회 </th>
								<th> 작성일 </th>
							</tr>
							
							<!-- 게시글이 있으면 -->
							<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.}</td>
									<td>${dto.}</td>
									<td>
										<a href="${path}/board_detail?b_num=${dto.}"> 
											${dto.} 
											<c:if test="${dto. != 0}">
												[${dto.}]
											</c:if>
										</a>
									</td>
									<td>${dto.}</td>
									<td>${dto.}</td>
									<td>${dto.}</td>
									<td>${dto.}</td>
								</tr>
							</c:forEach>
						</table>
						<div>
							<ul class="pagination">
								<!-- 페이징 처리 -->
								<!-- 이전 버튼 활성화 -->
								<c:if test="${paging.startPage > 10}">
									<li>
										<a href="${path}/board_list?pageNum=${paging.prev}" class="prevPage"> [이전] </a>
									</li>
								</c:if>
								
								<!-- 페이지 번호 처리 -->
								<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
									<li>
										<a href="${path}/board_list?pageNum=${num}" class="<c:if test='${num == paging.currentPage}'> active </c:if>"> ${num} </a>
									</li>
								</c:forEach>
								
								<!-- 다음 버튼 활성화 -->
								<c:if test="${paging.endPage < paging.pageCount}">
									<li>
										<a href="${path}/board_list?pageNum=${paging.next}" class="nextPage"> [다음] </a>
									</li>
								</c:if>
							</ul>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- footer부분 -->
	</div>
</body>
</html>