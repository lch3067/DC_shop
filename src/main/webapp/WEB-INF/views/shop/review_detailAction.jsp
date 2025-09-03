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
            <form name="reviewDetailForm" method="post">
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
                    <td>
                      <span class="rating-stars" aria-label="별점 ${rv.r_score}점">
                        <c:forEach var="i" begin="1" end="5">
                          <i class="${i <= rv.r_score ? 'fa-solid' : 'fa-regular'} fa-star"></i>
                        </c:forEach>
                      </span>
                    </td>
                    <th>좋아요</th>
                    <td>
                      <span class="like-count">${rv.r_like_cnt}</span>
                      <form action="${path}/review_like.bc" method="post" class="inline">
                        <input type="hidden" name="r_num" value="${rv.r_num}">
                        <button type="submit" class="btn btn-primary">좋아요</button>
                      </form>
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
				      <img class="rv-image" src="${rv.r_img}" alt="review image">
				    </td>
				  </tr>
				</c:if>
			 </tbody>
           </table>
          </form>
				
			<!-- 버튼 영역 (테이블 바깥) -->
			<div class="actions-right">
			  <a href="${path}/review_list.bc?pd_id=${rv.pd_id}" class="btn btn-light">목록</a>
			
			  <c:if test="${sessionScope.session_u_member_id == rv.u_member_id || sessionScope.role eq 'ADMIN'}">
			    <form method="post" action="<c:url value='/review_chkAction.bc'/>" class="inline">
			      <input type="hidden" name="r_num" value="${rv.r_num}"/>
			      <button type="submit" class="btn btn-dark">수정</button>
			    </form>
			    <form method="post" action="<c:url value='/review_deleteAction.bc'/>"
			          class="inline" onsubmit="return confirm('정말 삭제하시겠습니까?');">
			      <input type="hidden" name="hidden_r_num" value="${rv.r_num}"/>
			      <button type="submit" class="btn btn-dark">삭제</button>
			    </form>
			  </c:if>
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
