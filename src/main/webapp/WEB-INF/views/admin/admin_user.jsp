<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Page - 독캣배송</title>
  <script src="https://cdn.tailwindcss.com/3.4.16"></script>
  <!-- Chart.js + datalabels 플러그인 -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2"></script>

  <style type="text/css">
    .hero-section1 {
      width: 100%;
      background: white;
      padding: .5rem 0;
      padding-top: 5rem;
    }
    .fixed-table {
      width: 800px;
      table-layout: fixed;
      border-collapse: collapse;
      white-space: nowrap;
    }
    .fixed-table td, .fixed-table th {
      border: 1px solid #ddd;
      padding: 8px;
      vertical-align: middle;
    }
    .cell-scroll {
      max-width: 100%;
      white-space: nowrap;
      overflow-x: auto;
      overflow-y: hidden;
      -webkit-overflow-scrolling: touch;
    }
    .cell-scroll::-webkit-scrollbar { height: 6px; }
  </style>
</head>
<body class="bg-gray-100">

  <!-- 헤더 시작 -->
  <%@ include file="../setting/header.jsp" %>
  <!-- 헤더 끝 -->

  <section class="hero-section1"></section>
  
  <!-- 전체 컨테이너 -->
  <div class="min-h-screen flex justify-center py-8">
    <!-- 메인 래퍼 -->
    <div class="w-full max-w-6xl bg-white shadow rounded-xl overflow-hidden flex">
      
      <!-- 사이드바 -->
      <aside class="w-72 bg-white border-r p-6 flex flex-col items-center">
        <!-- 프로필 -->
        <img src="resources/img_main/mypage_default.png" alt="Profile" class="rounded-full w-28 h-28 object-cover mb-4">
        <h2 class="text-lg font-semibold">${session_u_nickname}</h2>
        <p class="text-gray-500 text-sm mb-4">${session_u_email}</p>
        <button class="px-4 py-2 bg-blue-500 text-white rounded-lg mb-6 hover:bg-blue-600">정보수정</button>

        <!-- 네비게이션 -->
        <nav class="w-full space-y-2 text-sm">
          <a href="./admin_board"   class="block py-2 px-3 rounded hover:bg-gray-100">게시판관리</a>
          <a href="./admin_order"   class="block py-2 px-3 rounded hover:bg-gray-100">주문관리</a>
          <a href="./admin_product" class="block py-2 px-3 rounded hover:bg-gray-100">상품관리</a>
          <a href="./admin_qna"     class="block py-2 px-3 rounded hover:bg-gray-100">문의관리</a>
          <a href="./admin_review"  class="block py-2 px-3 rounded hover:bg-gray-100">리뷰관리</a>
          <a href="./admin_user"    class="block py-2 px-3 rounded hover:bg-gray-100">회원관리</a>
          <a href="#" class="block py-2 px-3 rounded hover:bg-gray-100 text-red-500">로그아웃</a>
        </nav>
      </aside>

      <!-- 메인 콘텐츠 -->
      <main class="flex-1 min-w-0 p-8 bg-gray-50">

        <!-- 반려동물 통계 -->
        <section class="mb-10">
          <div class="flex items-center justify-between mb-4">
            <h2 class="text-xl font-bold">반려동물 통계</h2>
            <div class="flex gap-2">
              <button type="button" id="btnAll" class="px-3 py-1 rounded-lg border bg-white hover:bg-gray-100 text-sm">전체</button>
              <button type="button" id="btnDog" class="px-3 py-1 rounded-lg border bg-white hover:bg-gray-100 text-sm">강아지</button>
              <button type="button" id="btnCat" class="px-3 py-1 rounded-lg border bg-white hover:bg-gray-100 text-sm">고양이</button>
            </div>
          </div>

          <!-- 요약 카드 -->
          <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
            <div class="bg-white rounded-xl border p-4">
              <p class="text-sm text-gray-500">강아지 수</p>
              <p class="text-2xl font-bold">
                ${empty dogCount ? 0 : dogCount}
              </p>
            </div>
            <div class="bg-white rounded-xl border p-4">
              <p class="text-sm text-gray-500">고양이 수</p>
              <p class="text-2xl font-bold">
                ${empty catCount ? 0 : catCount}
              </p>
            </div>
            <div class="bg-white rounded-xl border p-4">
              <p class="text-sm text-gray-500">총 반려동물</p>
              <p class="text-2xl font-bold">
                ${ (empty dogCount ? 0 : dogCount) + (empty catCount ? 0 : catCount) }
              </p>
            </div>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
            <div class="bg-white rounded-xl border p-4">
              <p class="text-sm text-gray-500">수컷</p>
              <p class="text-2xl font-bold">
                ${empty maleCount ? 0 : maleCount}
              </p>
            </div>
            <div class="bg-white rounded-xl border p-4">
              <p class="text-sm text-gray-500">암컷</p>
              <p class="text-2xl font-bold">
                ${empty femaleCount ? 0 : femaleCount}
              </p>
            </div>
            <div class="bg-white rounded-xl border p-4">
              <p class="text-sm text-gray-500">중성화</p>
              <p class="text-2xl font-bold">
                ${empty neuteredCount ? 0 : neuteredCount}
              </p>
            </div>
          </div>

          <!-- 원형 그래프 -->
          <div class="bg-white rounded-xl border p-6">
            <h3 class="text-lg font-semibold mb-4">강아지 vs 고양이 비율</h3>
            <div class="w-full max-w-xl">
              <canvas id="speciesChart" height="220"></canvas>
            </div>
          </div>
        </section>

        <!-- 회원관리 -->
        <section class="mb-8">
          <h2>회원관리</h2>

          <h2 class="text-lg font-semibold mb-3">가입 회원 <font size="1">최신순</font></h2>
          <form>
            <table border="1" class="fixed-table">
              <thead>
                <tr>
                  <th class="border border-gray-200 px-3 py-2">회원번호</th>
                  <th class="border border-gray-200 px-3 py-2">아이디</th>
                  <th class="border border-gray-200 px-3 py-2">이름</th>
                  <th class="border border-gray-200 px-3 py-2">주소</th>
                  <th class="border border-gray-200 px-3 py-2">이메일</th>
                  <th class="border border-gray-200 px-3 py-2">생년월일</th>
                  <th class="border border-gray-200 px-3 py-2">닉네임</th>
                  <th class="border border-gray-200 px-3 py-2">가입일</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="dto" items="${list}">
                <tr>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_member_id}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_id}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_name}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_address}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_email}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_birthday}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_nickname}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_regdate}</div></td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </form>

          <h2 class="text-lg font-semibold mb-3 mt-8">탈퇴 회원 <font size="1">탈퇴순</font></h2>
          <form>
            <table border="1" class="fixed-table">
              <thead>
                <tr>
                  <th class="border border-gray-200 px-3 py-2">회원번호</th>
                  <th class="border border-gray-200 px-3 py-2">아이디</th>
                  <th class="border border-gray-200 px-3 py-2">이름</th>
                  <th class="border border-gray-200 px-3 py-2">주소</th>
                  <th class="border border-gray-200 px-3 py-2">이메일</th>
                  <th class="border border-gray-200 px-3 py-2">생년월일</th>
                  <th class="border border-gray-200 px-3 py-2">닉네임</th>
                  <th class="border border-gray-200 px-3 py-2">가입일</th>
                  <th class="border border-gray-200 px-3 py-2">탈퇴일</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="dto" items="${list}">
                <tr>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_member_id}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_id}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_name}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_address}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_email}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_birthday}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_nickname}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">${dto.u_regdate}</div></td>
                  <td class="border border-gray-200 px-3 py-2"><div class="cell-scroll">null</div></td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </form>
        </section>
      </main>
    </div>
  </div>

  <!-- 푸터 시작 -->
  <%@ include file="../setting/footer.jsp" %>
  <!-- 푸터 끝 -->

  <!-- 통계 스크립트 -->
  <script>
    // 서버에서 온 값이 없으면 0 처리
    const dogCount = Number('${empty dogCount ? 0 : dogCount}');
    const catCount = Number('${empty catCount ? 0 : catCount}');
    const total = (isNaN(dogCount) ? 0 : dogCount) + (isNaN(catCount) ? 0 : catCount);

    // 도넛 차트
    const ctx = document.getElementById('speciesChart');
    if (ctx && window.Chart) {
      new Chart(ctx, {
        type: 'doughnut',
        data: {
          labels: ['강아지', '고양이'],
          datasets: [{
            data: [dogCount || 0, catCount || 0]
          }]
        },
        options: {
          responsive: true,
          cutout: '55%',
          plugins: {
            legend: {
              position: 'bottom',
              labels: { boxWidth: 12, usePointStyle: true }
            },
            tooltip: {
              callbacks: {
                label: function(c) {
                  const val = c.parsed || 0;
                  const pct = total ? Math.round((val / total) * 100) : 0;
                  return `${c.label}: ${val} (${pct}%)`;
                }
              }
            },
            // 차트 위에 퍼센트 표시
            datalabels: {
              color: '#333',
              font: { weight: 'bold' },
              formatter: (val, ctx) => {
                const sum = (ctx.chart.data.datasets[0].data || []).reduce((a, b) => (Number(a)||0) + (Number(b)||0), 0);
                if (!sum) return '0%';
                const pct = Math.round((val / sum) * 100);
                return pct + '%';
              }
            }
          }
        },
        plugins: [ChartDataLabels]
      });
    }

    // (옵션) 필터 버튼 - 실제 동작은 서버 연동 시 구현
    document.getElementById('btnAll')?.addEventListener('click', () => {});
    document.getElementById('btnDog')?.addEventListener('click', () => {});
    document.getElementById('btnCat')?.addEventListener('click', () => {});
  </script>
</body>
</html>
