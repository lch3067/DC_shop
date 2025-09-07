<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/setting/setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>상품관리 - 독캣배송</title>
  <script src="https://cdn.tailwindcss.com/3.4.16"></script>
  <style>
    .hero-section1{width:100%;background:white;padding:.5rem 0;padding-top:5rem}
    .table-scroll { max-height: 60vh; overflow: auto; }
    @media (min-height: 900px) { .table-scroll { max-height: 70vh; } }
  </style>
</head>
<body class="bg-gray-100">

  <%@ include file="../setting/header.jsp" %>

  <section class="hero-section1"></section>

  <div class="min-h-screen flex justify-center py-8">
    <div class="w-full max-w-6xl bg-white shadow rounded-xl overflow-hidden flex">

      <!-- 사이드바 -->
      <aside class="w-72 bg-white border-r p-6 flex flex-col items-center">
        <img src="${path}/resources/img_main/mypage_default.png" alt="Profile" class="rounded-full w-28 h-28 object-cover mb-4">
        <h2 class="text-lg font-semibold">${session_u_nickname}</h2>
        <p class="text-gray-500 text-sm mb-4">${session_u_email}</p>
        <a href="${path}/mypage/profile" class="px-4 py-2 bg-blue-500 text-white rounded-lg mb-6 hover:bg-blue-600">정보수정</a>

        <nav class="w-full space-y-2 text-sm">
          <a href="${path}/admin_board"   class="block py-2 px-3 rounded hover:bg-gray-100">게시판관리</a>
          <a href="${path}/admin_order"   class="block py-2 px-3 rounded hover:bg-gray-100">주문관리</a>
          <a href="${path}/admin_product" class="block py-2 px-3 rounded bg-gray-900 text-white">상품관리</a>
          <a href="${path}/admin_qna"     class="block py-2 px-3 rounded hover:bg-gray-100">문의관리</a>
          <a href="${path}/admin_review"  class="block py-2 px-3 rounded hover:bg-gray-100">리뷰관리</a>
          <a href="${path}/admin_user"    class="block py-2 px-3 rounded hover:bg-gray-100">회원관리</a>
          <a href="${path}/logout" class="block py-2 px-3 rounded hover:bg-gray-100 text-red-500">로그아웃</a>
        </nav>
      </aside>

      <!-- 메인 콘텐츠 -->
      <main class="flex-1 p-8 bg-gray-50">
        <h1 class="text-2xl font-bold mb-2">${sessionid}님의 마이페이지</h1>
        <p class="text-gray-500 mb-6">상품을 검색하고 상태를 일괄 변경하거나 등록/수정/삭제할 수 있습니다.</p>

        <section class="bg-white border rounded-xl shadow-sm">
          <div class="p-4">
            <h2 class="text-lg font-semibold mb-3">상품관리</h2>

            <!-- 검색줄 -->
            <form action="${path}/admin_product" method="get" class="flex gap-2 w-full mb-3 flex-wrap">
              <!-- 상태 필터 -->
              <select name="status" class="w-36 border rounded-lg px-3 py-2">
                <option value="">상태 전체</option>
                <option value="ON" ${param.status == 'ON' ? 'selected' : ''}>판매중</option>
                <option value="OFF" ${param.status == 'OFF' ? 'selected' : ''}>품절</option>
                <option value="WAIT" ${param.status == 'WAIT' ? 'selected' : ''}>재입고대기</option>
              </select>

              <!-- 카테고리 필터 -->
              <select name="category" class="w-72 border rounded-lg px-3 py-2">
                <option value="">카테고리 전체</option>
                <optgroup label="강아지">
                  <option value="1100">의류</option>
                  <option value="1101"> └ 대형</option>
                  <option value="1102"> └ 중형</option>
                  <option value="1103"> └ 소형</option>
                  <option value="1200">미용/위생</option>
                  <option value="1201"> └ 샴푸</option>
                  <option value="1202"> └ 미용가위</option>
                  <option value="1203"> └ 구강관리</option>
                  <option value="1204"> └ 타올</option>
                  <option value="1205"> └ 발톱깎이</option>
                  <option value="1300">화장실</option>
                  <option value="1301"> └ 배변패드</option>
                  <option value="1302"> └ 기저귀</option>
                  <option value="1400">장난감</option>
                  <option value="1401"> └ 공</option>
                  <option value="1402"> └ 원반</option>
                  <option value="1403"> └ 터그</option>
                  <option value="1404"> └ 인형</option>
                  <option value="1500">목줄/리드줄</option>
                  <option value="1501"> └ 목줄</option>
                  <option value="1502"> └ 하네스</option>
                  <option value="1503"> └ 리드줄</option>
                  <option value="1504"> └ 자동줄</option>
                </optgroup>
                <optgroup label="고양이">
                  <option value="2100">의류</option>
                  <option value="2101"> └ 대형</option>
                  <option value="2102"> └ 중형</option>
                  <option value="2103"> └ 소형</option>
                  <option value="2200">미용/위생</option>
                  <option value="2201"> └ 샴푸</option>
                  <option value="2202"> └ 미용가위</option>
                  <option value="2203"> └ 구강관리</option>
                  <option value="2204"> └ 타올</option>
                  <option value="2205"> └ 발톱깎이</option>
                  <option value="2300">화장실</option>
                  <option value="2301"> └ 응고형두부모래</option>
                  <option value="2302"> └ 흡수형실리카겔모래</option>
                  <option value="2400">장난감</option>
                  <option value="2401"> └ 낚시대</option>
                  <option value="2402"> └ 공</option>
                  <option value="2403"> └ 막대</option>
                  <option value="2500">스크래쳐</option>
                  <option value="2501"> └ 캣타워형</option>
                  <option value="2502"> └ 패드형</option>
                  <option value="2503"> └ 하우스형</option>
                </optgroup>
              </select>

              <!-- 검색창 -->
              <input type="text" name="q" value="${fn:escapeXml(param.q)}" placeholder="상품명/코드 검색" class="flex-1 md:w-72 border rounded-lg px-3 py-2" />
              <button type="submit" class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-black">검색</button>
            </form>

            <!-- 버튼 줄 -->
            <div class="flex flex-wrap gap-2 mb-3">
              <form id="bulkOffForm" action="${path}/admin_product/bulkStatus" method="post">
                <input type="hidden" name="to" value="OFF" />
                <button type="button" id="bulkOffBtn" class="px-3 py-2 border rounded-lg hover:bg-gray-50">비활성</button>
              </form>
              <form id="bulkOnForm" action="${path}/admin_product/bulkStatus" method="post">
                <input type="hidden" name="to" value="ON" />
                <button type="button" id="bulkOnBtn" class="px-3 py-2 border rounded-lg hover:bg-gray-50">활성</button>
              </form>
              <form id="bulkWaitForm" action="${path}/admin_product/bulkStatus" method="post">
                <input type="hidden" name="to" value="WAIT" />
                <button type="button" id="bulkWaitBtn" class="px-3 py-2 border rounded-lg hover:bg-gray-50">재입고대기</button>
              </form>
              <form id="bulkDelForm" action="${path}/admin_product/bulkDelete" method="post">
                <button type="button" id="bulkDelBtn" class="px-3 py-2 border rounded-lg text-red-600 hover:bg-red-50">삭제</button>
              </form>
              <a href="${path}/admin_product/new" class="px-3 py-2 border rounded-lg bg-blue-600 text-white hover:bg-blue-700 text-center">상품등록</a>
            </div>
          </div>
        </section>

        <!-- 리스트 -->
        <section class="mt-4 bg-white border rounded-xl shadow-sm">
          <div class="table-scroll">
            <table class="min-w-full text-sm">
              <thead class="bg-gray-50 sticky top-0 z-10">
                <tr class="text-left text-gray-600">
                  <th class="px-4 py-3 w-10"><input id="checkAll" type="checkbox" class="accent-gray-800" /></th>
                  <th class="px-4 py-3 w-24">썸네일</th>
                  <th class="px-4 py-3 w-36 whitespace-nowrap">상품번호</th>
                  <th class="px-4 py-3 text-center whitespace-nowrap">상품명</th>
                  <th class="px-4 py-3 w-28 text-right whitespace-nowrap">가격</th>
                  <th class="px-4 py-3 w-24 text-right whitespace-nowrap">재고</th>
                  <th class="px-4 py-3 w-28 text-center whitespace-nowrap">상태</th>
                </tr>
              </thead>
              <tbody>
                <c:choose>
                  <c:when test="${empty list}">
                    <tr>
                      <td colspan="7" class="px-4 py-10 text-center text-gray-400">등록된 상품이 없습니다.</td>
                    </tr>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="p" items="${list}">
                      <tr class="border-t hover:bg-gray-50">
                        <td class="px-4 py-3"><input name="rowCheck" value="${p.pd_id}" type="checkbox" class="rowCheck accent-gray-800" /></td>
                        <td class="px-4 py-3">
                          <c:choose>
                            <c:when test="${not empty p.thumbnail_url}">
                              <img src="${p.thumbnail_url}" alt="thumb" class="w-14 h-14 object-cover rounded" />
                            </c:when>
                            <c:otherwise>
                              <div class="w-14 h-14 bg-gray-100 border rounded grid place-items-center">-</div>
                            </c:otherwise>
                          </c:choose>
                        </td>
                        <td class="px-4 py-3 text-gray-600 whitespace-nowrap">${p.pd_id}</td>
                        <td class="px-4 py-3 text-center whitespace-nowrap">
                          <a href="${path}/product/${p.pd_id}" class="text-gray-900 hover:underline font-medium">${p.pd_name}</a>
                          <div class="text-xs text-gray-400">${p.pd_code}</div>
                        </td>
                        <td class="px-4 py-3 text-right whitespace-nowrap">
                          <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₩" />
                        </td>
                        <td class="px-4 py-3 text-right whitespace-nowrap">${p.stock}</td>
                        <td class="px-4 py-3 text-center whitespace-nowrap">
                          <span class="inline-flex items-center gap-1 px-2 py-1 rounded-full text-xs ${p.status == 'ON' ? 'bg-green-50 text-green-700 border border-green-200' : (p.status == 'WAIT' ? 'bg-yellow-50 text-yellow-700 border border-yellow-200' : 'bg-gray-100 text-gray-500 border border-gray-200')}">
                            ${p.status == 'ON' ? '판매중' : (p.status == 'WAIT' ? '재입고대기' : '품절')}
                          </span>
                        </td>
                      </tr>
                    </c:forEach>
                  </c:otherwise>
                </c:choose>
              </tbody>
            </table>
          </div>
        </section>
      </main>
    </div>
  </div>

  <%@ include file="../setting/footer.jsp" %>

  <script>
    const checkAll = document.getElementById('checkAll');
    const rowChecks = () => Array.from(document.querySelectorAll('.rowCheck'));
    if (checkAll) {
      checkAll.addEventListener('change', () => {
        rowChecks().forEach(chk => chk.checked = checkAll.checked);
      });
    }
    function collectIds() {
      return rowChecks().filter(chk => chk.checked).map(chk => chk.value);
    }
    function submitBulk(formId) {
      const ids = collectIds();
      if (ids.length === 0) { alert('선택된 상품이 없습니다.'); return; }
      const form = document.getElementById(formId);
      const hidden = document.createElement('input');
      hidden.type = 'hidden';
      hidden.name = 'ids';
      hidden.value = ids.join(',');
      form.appendChild(hidden);
      form.submit();
    }
    document.getElementById('bulkOffBtn')?.addEventListener('click', () => submitBulk('bulkOffForm'));
    document.getElementById('bulkOnBtn')?.addEventListener('click', () => submitBulk('bulkOnForm'));
    document.getElementById('bulkWaitBtn')?.addEventListener('click', () => submitBulk('bulkWaitForm'));
    document.getElementById('bulkDelBtn')?.addEventListener('click', () => { if (confirm('선택한 상품을 삭제하시겠습니까?')) submitBulk('bulkDelForm'); });
  </script>

</body>
</html>
