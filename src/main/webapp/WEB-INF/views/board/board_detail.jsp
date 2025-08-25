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
		    
		    if (!btn.hasClass("active")) {
		        // 추천 추가
		        $.ajax({
		            url: "${path}/recommend",
		            type: "POST",
		            data: { b_num: b_num, click: 1 },
		            success: function(result) {
		                if (parseInt(result.success) === 1) {
		                    btn.addClass("active"); // 이미지 교체
			                $("#recommendTotal").text(result.b_recommend); 
		                }
		            },
		            error: function() {
		                alert("추천 처리 중 오류가 발생했습니다.");
		            }
		        });
		    } else {
		        // 추천 취소
		        $.ajax({
		            url: "${path}/recommend",
		            type: "POST",
		            data: { b_num: b_num, click: 0 },
		            success: function(result) {
		                if (parseInt(result.success) === 1) {
		                    btn.removeClass("active"); // 이미지 원복
		                    $("#recommendTotal").text(result.b_recommend); 
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
		<%@ include file="/WEB-INF/views/setting/header.jsp" %>
		
		<section class="hero-section1">
		<!-- <div class="hero-container">
			<div class="hero-content">
				<h1 class="hero-title">랜딩 페이지 제목</h1>
				<p class="hero-description">실용성 있는 디자인과 직관적이며 대담한 추상적 조합으로, 사용하기
					자연스럽고 유용한 소프트웨어를 초점에 맞춘다.</p>
				<button class="hero-btn">더보기</button>
			</div>
		</div> -->
		</section>
		
		<!-- 컨텐츠 부분 -->
		<div id="container">
			<div id="contents">
				<div class="titleArea">
					<h1 align="center"> 상세페이지 </h1>
				</div>
				
				<c:set var="user" value="${board.userDTO[0]}"/>
				<div>
					<div class="table_div">
						<form name="insertForm" method="post" >
							<table>
								<tr>
									<td align="left">
										<div style="font-size: 25px">[${board.b_category}] ${board.b_title}</div> 
										<div style="font-size: 15px" align="right">작성자 : ${user.u_nickname}</div>
									</td>
								</tr>
								<tr>
									<th align="left">
										<div class="inline">
											<img src="/DCShop/resources/image/board/추천_total.png">
										 	<span  id="recommendTotal"> ${board.b_recommend} </span> 
										 </div> 
										<div class="inline"> 조회 ${board.b_views} </div>
									</th>
								</tr>
								<tr>
									<td> 
										<div style="min-height: 700px" align="left">
											${board.b_contents} 
											<img src="${board.b_image}">
										</div>
										<div align="right" style="height: 20px">
											<div style="font-size: 15px"> 등록일 : ${board.b_dateposted} </div> 
											<c:if test="${board.b_updateDate != null}">
												<div style="font-size: 15px"> 수정일 : ${board.b_updateDate} </div>
											</c:if>
										</div>
										<c:if test="${board.b_updateDate != null}">
											<div align="right" style="height: 20px">
											<div style="font-size: 15px"> 수정일 : ${board.b_updateDate} </div>
											</div>
										</c:if>
									</td>
								</tr>
								<tr>
									<td>
										<c:if test="${isRecommended == 0}">
											추천하기 <input type="button" class="recommendButton" id="recommendBtn" data-bnum="${board.b_num}">
										</c:if>
										<c:if test="${isRecommended == 1}">
											추천하기 <input type="button" class="recommendButton active" id="recommendBtn" data-bnum="${board.b_num}">
										</c:if>
									</td>
								</tr>
							</table>
							<div align="right">
								<br>
								<input type="button" class="inputButton" value="수정" id="">
								<input type="reset" class="inputButton" value="삭제" id="">
								<input type="button" class="inputButton" value="목록" onclick="window.location='${path}/comm_main.do'">
							</div>
						</form>
					</div>
				</div>
				
				<!-- 댓글 부분 -->
				
				
			</div>
		</div>
		<!-- 컨텐츠 끝 -->
		
		<!-- footer 부분 -->
		<%@ include file="/WEB-INF/views/setting/footer.jsp" %>
		
	</div>
</body>
</html>