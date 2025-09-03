<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>리뷰 수정/삭제</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/header.css">
<link rel="stylesheet" href="${path}/resources/css/footer.css">
<link rel="stylesheet" href="${path}/resources/css/product/reviewList.css">

<!-- js -->
<script src="https://kit.fontawesome.com/7e22bb38b7.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="${path}/resources/js/common/main.js" defer></script>

<script>
$(function(){
  var loggedIn = ${not empty sessionScope.session_u_member_id};

  $('#btnList').on('click', function(){
    const pdId = $('#pd_id').val();
    location.href = pdId ? ('${path}/review_list.bc?pd_id=' + pdId) : '${path}/review_list.bc';
  });

  $('#btnEdit').on('click', function(){
    if (!loggedIn) {
      if (confirm('로그인이 필요합니다. 로그인 페이지로 이동할까요?')) location.href='${path}/login_main.do';
      return;
    }
    const score = $('#r_score').val();
    const content = $('#r_content').val().trim();
    if(!score){ alert('평점을 선택해주세요.'); $('#r_score').focus(); return; }
    if(!content){ alert('리뷰 내용을 입력해주세요.'); $('#r_content').focus(); return; }
    document.editForm.action = '${path}/review_updateAction.bc';
    document.editForm.submit();
  });

  $('#btndelete').on('click', function(){
    if (!loggedIn) {
      if (confirm('로그인이 필요합니다. 로그인 페이지로 이동할까요?')) location.href='${path}/login_main.do';
      return;
    }
    if(!confirm('이 리뷰를 삭제하시겠습니까?')) return;
    document.editForm.action = '${path}/review_deleteAction.bc';
    document.editForm.submit();
  });
});
</script>
</head>

<body>
<div class="wrap">
  <%@ include file="/WEB-INF/views/setting/header.jsp" %>

  <div id="container">
    <div id="contents">
      <h1 class="page-title">리뷰 수정/삭제</h1>

      <div id="section2">
        <div id="right">
          <div class="table_div">
            <!-- 이미지 교체를 위해 multipart -->
            <form name="editForm" method="post" enctype="multipart/form-data">
              <!-- 수정/삭제에 필요한 키 값들 -->
              <input type="hidden" name="r_num"        id="r_num"        value="${dto.r_num}">
              <input type="hidden" name="pd_id"        id="pd_id"        value="${dto.pd_id}">
              <input type="hidden" name="u_member_id"  id="u_member_id"  value="${dto.u_member_id}">
              <input type="hidden" name="origin_r_img" id="origin_r_img" value="${dto.r_img}">

              <table class="table-detail">
                <tbody>
                  <tr>
                    <th style="width:200px">리뷰번호</th>
                    <td style="width:200px; text-align:center">${dto.r_num}</td>

                    <th style="width:200px">상품번호</th>
                    <td style="width:200px; text-align:center">${dto.pd_id}</td>
                  </tr>

                  <tr>
                    <th>작성자</th>
                    <td style="text-align:center">
                      <c:choose>
                        <c:when test="${not empty dto.u_nickname}"><c:out value="${dto.u_nickname}"/></c:when>
                        <c:otherwise><c:out value="${sessionScope.session_u_nickname}"/></c:otherwise>
                      </c:choose>
                    </td>

                    <th>작성일</th>
                    <td style="text-align:center">
                      <fmt:formatDate value="${dto.r_regDate}" pattern="yyyy-MM-dd"/>
                    </td>
                  </tr>

                  <tr>
                    <th>평점</th>
                    <td colspan="3" style="text-align:center">
                      <select name="r_score" id="r_score">
                        <option value="">-- 평점 선택 --</option>
                        <option value="5" <c:if test="${dto.r_score == 5}">selected</c:if>>★★★★★ (5)</option>
                        <option value="4" <c:if test="${dto.r_score == 4}">selected</c:if>>★★★★☆ (4)</option>
                        <option value="3" <c:if test="${dto.r_score == 3}">selected</c:if>>★★★☆☆ (3)</option>
                        <option value="2" <c:if test="${dto.r_score == 2}">selected</c:if>>★★☆☆☆ (2)</option>
                        <option value="1" <c:if test="${dto.r_score == 1}">selected</c:if>>★☆☆☆☆ (1)</option>
                      </select>
                    </td>
                </tr>

                  <tr>
                    <th>리뷰 내용</th>
                    <td colspan="3" style="text-align:center">
                      <textarea rows="6" cols="80" name="r_content" id="r_content"
                                placeholder="리뷰 내용을 입력하세요.">${dto.r_content}</textarea>
                    </td>
                  </tr>

                  <tr>
                    <th>현재 이미지</th>
                    <td colspan="3" style="text-align:center">
                      <c:choose>
					    <c:when test="${not empty dto.r_img}">
					      <%-- r_img가 파일명만 저장돼 있다면 /resources/upload/review/ 를 붙여서 --%>
					      <c:set var="imgSrc" value="/resources/upload/review/${dto.r_img}"/>
					        <c:set var="imgSrc" value="${dto.r_img}"/>
					      <img src="<c:url value='${imgSrc}'/>" alt="리뷰 이미지" style="max-width:300px; height:auto;">
					    </c:when>
					    <c:otherwise>등록된 이미지가 없습니다.</c:otherwise>
					  </c:choose>
                    </td>
                  </tr>

                  <tr>
                    <th>이미지 교체</th>
                    <td colspan="3" style="text-align:center">
                      <input type="file" name="r_imgFile" id="r_imgFile" accept="image/*">
                      <div style="font-size:12px; color:#666; margin-top:4px;">
                        * 새 이미지를 선택하지 않으면 기존 이미지를 유지합니다.
                      </div>
                    </td>
                  </tr>

                  <!-- 버튼: 테이블 안, 우측 정렬 / 목록(흰/검정), 수정·삭제(검정/흰) -->
                  <tr>
                    <td colspan="4" class="td-actions">
                      <div class="actions-right">
						 <a href="${path}/review_list.bc?pd_id=${dto.pd_id}" class="btn btn-light" id="btnList">목록</a>
						 <button type="button" class="btn btn-dark" id="btnEdit">수정</button>
						 <button type="button" class="btn btn-dark" id="btndelete">삭제</button>
					</div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </form>
          </div>
        </div>

      </div>
    </div>
  </div>

  <%@ include file="/WEB-INF/views/setting/footer.jsp" %>
</div>
</body>
</html>
