<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세페이지</title>
<link rel="stylesheet" href="${path}/resources/css/header.css">
<link rel="stylesheet" href="${path}/resources/css/footer.css">
<link rel="stylesheet" href="${path}/resources/css/product/reviewList.css">
<script src="https://kit.fontawesome.com/7e22bb38b7.js" crossorigin="anonymous"></script>
<script src="${path}/resources/js/common/main.js" defer></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<script>
$(function () {
  var loggedIn = ${not empty sessionScope.session_u_member_id};

  // 좋아요
  $('#recommendBtn').on('click', function (e) {
    e.preventDefault();
    if (!loggedIn) {
      if (confirm('로그인이 필요합니다. 로그인 페이지로 이동할까요?')) location.href='${path}/login_main.do';
      return;
    }
    var $btn = $(this);
    if ($btn.data('busy')) return;
    $btn.data('busy', true);
    $.get($btn.attr('href')).always(function(){ location.reload(); });
  });

  // 수정 버튼
  $('#btnEditLink').on('click', function (e) {
    if (!loggedIn) {
      e.preventDefault();
      if (confirm('로그인이 필요합니다. 로그인 페이지로 이동할까요?')) location.href='${path}/login_main.do';
    }
  });

  // 삭제(폼 제출)
  $('#deleteForm').on('submit', function (e) {
    if (!loggedIn) {
      e.preventDefault();
      if (confirm('로그인이 필요합니다. 로그인 페이지로 이동할까요?')) location.href='${path}/login_main.do';
      return false;
    }
    if (!confirm('정말 삭제하시겠습니까?')) { e.preventDefault(); return false; }
  });
});
</script>
<body>
<div class="wrap">
  <%@ include file="/WEB-INF/views/setting/header.jsp" %>
  <div id="container">
    <div id="contents">
      <h1 class="page-title">리뷰 상세</h1>

      <c:set var="rv" value="${empty review ? dto : review}" />

      <div id="section2">
        <div id="right">
          <div class="table_div">
              <input type="hidden" name="r_num" value="${rv.r_num}" />
              <table class="table-detail">
                <tbody>
                  <tr>
                    <th>리뷰번호</th>
                    <td>${rv.r_num}</td>
                    <th>상품번호</th>
                    <td>${rv.pd_id}</td>
                  </tr>

                  <tr>
                    <th>작성자</th>
                    <td><c:out value="${rv.u_nickname}"/></td>
                    <th>작성일</th>
                    <td><fmt:formatDate value="${rv.r_regDate}" pattern="yyyy-MM-dd"/></td> <!-- ★ -->
                  </tr>

                  <tr>
                  	<th>별점</th>
					  <td colspan="3" class="rating-cell">
					    <span class="rating-stars" aria-label="별점 ${rv.r_score}점">
					      <c:forEach var="i" begin="1" end="5">
					        <i class="${i <= rv.r_score ? 'fa-solid' : 'fa-regular'} fa-star"></i>
					      </c:forEach>
					    </span>
					  </td>
					</tr>

                  <tr>
                    <th>내용</th>
                    <td colspan="3" class="content-cell">
                      <pre class="rv-content"><c:out value="${rv.r_content}"/></pre>
                    </td>
                  </tr>

                  <c:if test="${not empty rv.r_img}">
				  <tr>
				    <th>이미지</th>
				    <td colspan="3" class="image-cell">
				      <img class="rv-image" 
				      src="<c:url value='/resources/upload/review/${rv.r_img}'/>" 
				      alt="review image">
				    </td>
				  </tr>
				</c:if>
			 </tbody>
           </table>
				
			<!-- 버튼들 -->
			<div class="actions-right">
			  <a href="${path}/review_list.bc?pd_id=${rv.pd_id}" class="btn btn-light">목록</a>
			
			  <a href="${path}/review_editForm.bc?r_num=${rv.r_num}"
			     id="btnEditLink"
			     class="btn btn-dark">수정</a>
			
			  <form id="deleteForm" method="post" action="<c:url value='/review_deleteAction.bc'/>" class="inline">
			    <input type="hidden" name="r_num" value="${rv.r_num}"/>
			    <button type="submit" class="btn btn-dark">삭제</button>
			  </form>
			</div>
			
          </div>
        </div>
      </div>

    </div>
  </div>
  <%@ include file="/WEB-INF/views/setting/footer.jsp" %>
</div>
</body>
</html>
