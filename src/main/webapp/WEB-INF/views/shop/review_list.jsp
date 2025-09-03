<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>reviewList</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/header.css">
<link rel="stylesheet" href="${path}/resources/css/footer.css">
<link rel="stylesheet" href="${path}/resources/css/product/reviewList.css">

<!-- js -->
<script src="https://kit.fontawesome.com/7e22bb38b7.js" crossorigin="anonymous"></script>
<script src="${path}/resources/js/common/main.js" defer></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>
  $(function(){
    $('#btnInsert').on('click', function(){
      location.href = "${path}/review_insert.bc";
    });
  });

  // 행 클릭으로 이동 (a/button/input 등 클릭은 기본 동작 유지)
  document.addEventListener('click', function(e) {
    const tr = e.target.closest('tr.row-link');
    if (!tr) return;
    if (e.target.closest('a, button, input, select, textarea, label')) return;
    const url = tr.dataset.url;
    if (url) window.location.href = url;
  });
</script>

<c:set var="pdId" value="${not empty param.pd_id ? param.pd_id : requestScope.pd_id}" />

<%-- 리뷰 작성 폼으로 가는 URL --%>
<c:url var="reviewWriteUrl" value="/review_insert.bc">
  <c:if test="${not empty pdId}">
    <c:param name="pd_id" value="${pdId}" />
  </c:if>
</c:url>

<%-- 세션 회원번호를 숫자로 파싱(타입 불일치 대비) --%>
<fmt:parseNumber var="sessMemId" value="${sessionScope.session_u_member_id}" integerOnly="true" />

</head>

<body>
<div class="wrap">
  <%@ include file="/WEB-INF/views/setting/header.jsp" %>

  <div id="container">
    <div id="contents">
      <!-- 상단 -->
      <div>
        <h1 class="page-title">리뷰 목록</h1>
      </div>

      <div id="section2">
        <!-- 우측 -->
        <div id="right">
          <div class="table_div">
            <form name="reviewList">
              <table>
                <tr>
                  <th>리뷰번호</th>
                  <th>상품번호</th>
                  <th>이미지</th>
                  <th>내용</th>
                  <th>별점</th>
                  <th>작성자</th>
                  <th class="th-date">작성일</th>
                </tr>

                <tbody>
                <c:choose>
                  <c:when test="${not empty list}">
                    <c:forEach var="dto" items="${list}">
                      <tr class="row-link"
                          data-url="<c:url value='/review_detailAction.bc'/>?r_num=${dto.r_num}"
                          tabindex="0" role="link"
                          aria-label="리뷰 상세: ${fn:escapeXml(dto.r_content)}">
                        <td>${dto.r_num}</td>
                        <td>${dto.pd_id}</td>
                        
                        <!-- 썸네일 -->
                        <td>
                          <c:if test="${not empty dto.r_img}">
                            <a href="<c:url value='/review_detailAction.bc'/>?r_num=${dto.r_num}">
                              <img class="rv-thumb"
                                   src="<c:url value='/resources/upload/review/${dto.r_img}'/>"
                                   alt="리뷰 썸네일">
                            </a>
                          </c:if>
                        </td>
                        
                        <td class="text-left">
                          <a href="<c:url value='/review_detailAction.bc'/>?r_num=${dto.r_num}">
                            <c:out value="${fn:length(dto.r_content) > 60
                                               ? fn:substring(dto.r_content, 0, 60)
                                               : dto.r_content}"/>
                            <c:if test="${fn:length(dto.r_content) > 60}">...</c:if>
                          </a>
                        </td>
                        <td>
                          <span class="rating-stars" aria-label="별점 ${dto.r_score}점"><c:forEach var="i" begin="1" end="5"><i class="${i <= dto.r_score ? 'fa-solid' : 'fa-regular'} fa-star"></i></c:forEach></span>
                        </td>
                        
                        <td>
						  <c:choose>
						    <c:when test="${not empty dto.u_nickname}">
						      <c:out value="${dto.u_nickname}"/>
						    </c:when>
						    <c:otherwise>
						      회원번호: <c:out value="${dto.u_member_id}"/>
						    </c:otherwise>
						  </c:choose>
						</td>
						
                        <td class="date-cell">
				            <fmt:formatDate value="${dto.r_regDate}" pattern="yyyy-MM-dd"/>
				          </td>
				          
                      </tr>
                    </c:forEach>
                  </c:when>
                  <c:otherwise>
                    <tr>
                      <td colspan="7" align="center">등록된 리뷰가 없습니다.</td>
                    </tr>
                  </c:otherwise>
                </c:choose>
                </tbody>

                <!-- 페이징 -->
                <tr>
                  <td colspan="7" align="center">
                    <ul class="pagination">
                      <!-- 처음 -->
                      <c:if test="${paging.startPage > 10}">
                        <li><a href="${path}/review_list.bc?pageNum=1&pd_id=${pdId}" class="firstPage">처음</a></li>
                      </c:if>

                      <!-- 이전 -->
                      <c:if test="${paging.startPage > 10}">
                        <li><a href="${path}/review_list.bc?pageNum=${paging.prev}&pd_id=${pdId}" class="prevPage">이전</a></li>
                      </c:if>

                      <!-- (선택) 현재 블록 시작 번호 표시 -->
                      <c:if test="${paging.endPage >= 10}">
                        <li><a href="${path}/review_list.bc?pageNum=${paging.startPage}&pd_id=${pdId}" class="startNum">현재첫번호</a></li>
                      </c:if>

                      <!-- 번호들 -->
                      <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                        <li>
                          <a href="${path}/review_list.bc?pageNum=${num}&pd_id=${pdId}"
                             class="<c:if test='${num == paging.currentPage}'> active </c:if>">${num}</a>
                        </li>
                      </c:forEach>

                      <!-- 현재 블록 끝 번호 표시 -->
                      <c:if test="${paging.endPage <= paging.pageCount}">
                        <li><a href="${path}/review_list.bc?pageNum=${paging.endPage}&pd_id=${pdId}" class="endNum">현재끝번호</a></li>
                      </c:if>

                      <!-- 다음 -->
                      <c:if test="${paging.endPage < paging.pageCount}">
                        <li><a href="${path}/review_list.bc?pageNum=${paging.next}&pd_id=${pdId}" class="nextPage">다음</a></li>
                      </c:if>

                      <!-- 끝 -->
                      <c:if test="${paging.endPage < paging.pageCount}">
                        <li><a href="${path}/review_list.bc?pageNum=${paging.pageCount}&pd_id=${pdId}" class="endPage">끝</a></li>
                      </c:if>
                    </ul>
                  </td>
                </tr>

                <!-- 글쓰기 버튼 -->
                <tr>
                  <td colspan="7" align="center">
                    <a href="${reviewWriteUrl}" class="btn btn-dark">리뷰작성</a>
                  </td>
                </tr>
              </table>
            </form>
          </div>
        </div><!-- /right -->
      </div><!-- /section2 -->
    </div><!-- /contents -->
  </div><!-- /container -->

  <%@ include file="/WEB-INF/views/setting/footer.jsp" %>
</div><!-- /wrap -->
</body>
</html>
