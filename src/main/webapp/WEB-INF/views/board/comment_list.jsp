<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댓글목록</title>

<link rel="stylesheet" href="${path}/resources/css/board.css">

</head>
<body>
	<div id="right">
		<div class="table_div">
			<form name="boardList">
				<table border="1" width="1000px">		
					<!-- 게시글이 있으면 -->
					<c:forEach var="dto" items="${list}">
					<tr>
						<td align="left">${dto.c_writer}</td>
						<td align="right" style="width:120px;" rowspan="3">
							<button type="button" class="inputButton btnCommentEdit" value="${dto.c_num}">수정</button>
							<br><br>
							<button type="button" class="inputButton btnCommentDelete" value="${dto.c_num}">삭제</button>
						</td>
					</tr>
					<tr>
						<td align="left">${dto.c_content}</td>
					</tr>
					<tr>
						<td align="left">${dto.c_regDate}</td>
					</tr>
					</c:forEach>
				</table>
			</form>
		</div>
	</div>
</body>
</html>