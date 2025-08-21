<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>board_detail</title>

<link rel="stylesheet" href="${path}/resources/css/board.css">

</head>
<body>

	<div class="wrap">
		<!-- 헤더 부분 -->
		
		<!-- 컨텐츠 부분 -->
		<div id="container">
			<div id="contents">
				<div>
					<h1 align="center"> 상세페이지 </h1>
				</div>
				<div>
					<div class="table_div">
						<form name="insertForm" method="post" >
							<c:set var="board" value="${dto.boardDTO[0]}"/>
							<table>
								<tr>
									<td colspan="2" rowspan="2" align="left">
										<p style="font-size: 25px">[${board.b_category}] ${board.b_title}</p> 
										<p style="font-size: 15px" align="right">작성자 : ${dto.u_nickname}</p>
									</td>
								</tr>
								<tr>
								</tr>
								<tr>
									<th colspan="2" align="left">
										♥ ${board.b_recommend} 조회 ${board.b_views}
									</th>
								</tr>
								<tr>
									<td colspan="2" rowspan="2" style="height: 500px"> 
										${board.b_contents} 
										<img src="${board.b_image}">
									</td>
								</tr>
								<tr>
								</tr>
								<tr>
									<td align="right"> 등록일 : ${board.b_dateposted} </td>
								</tr>
							</table>
							<div align="right">
								<br>
								<input type="button" class="inputButton" value="수정" id="">
								<input type="reset" class="inputButton" value="삭제" id="">
								<input type="button" class="inputButton" value="목록" onclick="window.location='${path}/board_list'">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 컨텐츠 끝 -->
		
		<!-- footer 부분 -->
	</div>
</body>
</html>