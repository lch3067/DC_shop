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

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#recommendBtn").click(function() {
		    var btn = $("#recommendBtn");
		    var b_num = btn.data("bnum");
		    var u_member_id = btn.data("uid");
		    
		    if (!btn.hasClass("active")) {
		        // 추천 추가
		        $.ajax({
		            url: "${path}/recommend/add",
		            type: "POST",
		            data: { b_num: b_num, u_member_id: u_member_id },
		            success: function(result) {
		                if (parseInt(result) === 1) {
		                    btn.addClass("active"); // 이미지 교체
		                }
		            },
		            error: function() {
		                alert("추천 처리 중 오류가 발생했습니다.");
		            }
		        });
		    } else {
		        // 추천 취소
		        $.ajax({
		            url: "${path}/recommend/remove",
		            type: "POST",
		            contentType: "application/json",
		            data: JSON.stringify({ b_num: b_num, u_member_id: u_member_id }),
		            success: function(result) {
		                if (result.success) {
		                    btn.removeClass("active"); // 이미지 원복
		                }
		            },
		            error: function() {
		                alert("추천 취소 중 오류가 발생했습니다.");
		            }
		        });
		    }
		});
	});
</script>
</head>
<body>

	<div class="wrap">
		<!-- 헤더 부분 -->
		
		<!-- 컨텐츠 부분 -->
		<div id="container">
			<div id="contents">
				<div class="titleArea">
					<h1 align="center"> 상세페이지 </h1>
				</div>
				<c:set var="board" value="${user.boardDTO[0]}"/>
				<div>
					<div class="table_div">
						<form name="insertForm" method="post" >
							<table>
								<tr>
									<td colspan="2" align="left">
										<p style="font-size: 25px">[${board.b_category}] ${board.b_title}</p> 
										<p style="font-size: 15px" align="right">작성자 : ${user.u_nickname}</p>
									</td>
								</tr>
								<tr>
									<th colspan="2" align="left">
										♥ ${board.b_recommend} 조회 ${board.b_views}
									</th>
								</tr>
								<tr>
									<td colspan="2" > 
										<div style="height: 700px">
											${board.b_contents} 
											<img src="${board.b_image}">
										</div>
										<div align="right" style="height: 20px">
											<p style="font-size: 15px"> 등록일 : ${board.b_dateposted} </p> 
											<c:if test="${board.b_updateDate != null}">
												<p style="font-size: 15px"> 수정일 : ${board.b_updateDate} </p>
											</c:if>
										</div>
										<c:if test="${board.b_updateDate != null}">
											<div align="right" style="height: 20px">
											<p style="font-size: 15px"> 수정일 : ${board.b_updateDate} </p>
											</div>
										</c:if>
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" class="recommendButton" id="recommendBtn" data-bnum="${board.b_num}" data-uid="${user.u_member_id}">
									</td>
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