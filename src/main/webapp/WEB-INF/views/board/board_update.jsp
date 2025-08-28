<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" href="${path}/resources/css/board.css">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300;500&display=swap"
	rel="stylesheet">



<script type="text/javascript">
	function confirmUpdateCheck() {
		return confirm("게시글을 수정하시겠습니까?");
	}
</script>
</head>
<body class="board-update">

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
		<br><br><br><br><br>
		
		<div class="container">
		<h1>게시글 수정</h1>

		<form action="${path}/board_updateAction" method="post"
			enctype="multipart/form-data" onsubmit="return confirmUpdateCheck();">
			<input type="hidden" name="b_num" value="${board.b_num}">

			<div class="form-group">
				<label for="b_title">제목</label> <input type="text" name="b_title"
					id="b_title" value="${board.b_title}">
			</div>

			<div class="form-group">
				<label for="b_contents">내용</label>
				<textarea name="b_contents" id="b_contents">${board.b_contents}</textarea>
			</div>

			<div class="form-group">
				<label for="b_category">카테고리</label> <select name="b_category"
					id="b_category" size="5" class="category-select">
					<option value="자유" ${board.b_category == '자유' ? 'selected' : ''}>자유</option>
					<option value="꿀팁" ${board.b_category == '꿀팁' ? 'selected' : ''}>꿀팁</option>
					<option value="리뷰" ${board.b_category == '리뷰' ? 'selected' : ''}>리뷰</option>
					<option value="질문" ${board.b_category == '질문' ? 'selected' : ''}>질문</option>


				</select>
			</div>

			<button type="submit" class="btn">
				<i class="fas fa-paw"></i> 수정완료
			</button>
		</form>
	</div>
		
		<br><br><br><br><br>
		<!-- footer 부분 -->
		<%@ include file="/WEB-INF/views/setting/footer.jsp" %>
	</div>

	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
