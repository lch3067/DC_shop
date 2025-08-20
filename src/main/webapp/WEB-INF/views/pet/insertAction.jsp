<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		<c:if test="${insertCnt == 1}">
		
			<script type="text/javascript">
				alert("반려동물 등록 성공!!");
			</script>
		</c:if>
		
		<c:if test="${insertCnt != 1}">
			<script type="text/javascript">
				alert("반려동물 등록 실패!!");
			</script>
		</c:if>
		<!-- 컨텐츠 끝 -->
	</div>
</body>
</html>
