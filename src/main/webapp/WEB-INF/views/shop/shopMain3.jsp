<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- [HEAD] 기본 메타 -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dog Food - Pet Store</title>

  <!-- [CSS] Tailwind (유틸리티 클래스) -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- [CSS] 아이콘/폰트 (메뉴 아이콘, 로고 폰트) -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css">

  <style>
    /* [CSS] 페이지네이션 버튼 모양(숫자·next) — 하단 버튼들에 적용 */
    .page-btn{
      display:inline-flex;align-items:center;justify-content:center;
      min-width:36px;height:36px;padding:0 10px;font-size:14px;
      border-radius:8px;border:1px solid #e5e7eb;background:#fff;color:#111827;
      transition:background .15s,box-shadow .15s,transform .05s;
    }
    .page-btn:hover{ background:#f9fafb; }
    .page-btn.active{ background:#111827;color:#fff;border-color:#111827; }
    .page-btn.disabled{ opacity:.4; pointer-events:none; }
    .logo-font{ font-family:'Pacifico',cursive; } /* 상단 로고에 적용 */
  </style>
</head>
<body class="bg-gray-50">

<!-- [NAV] 상단 메뉴바: 홈/카테고리/검색/장바구니 버튼을 띄워준다 -->
<nav class="bg-white border-b border-gray-200 sticky top-0 z-40">
  <div class="max-w-7xl mx-auto px-4">
    <div class="h-16 flex items-center justify-between">
      <!-- 로고(홈으로 이동을 띄워준다) -->
      <a href="/" class="logo-font text-xl text-gray-900">logo</a>

      <!-- 데스크톱 카테고리 메뉴(각 카테고리 페이지로 이동을 띄워준다) -->
      <ul class="hidden md:flex items-center space-x-6 text-sm text-gray-700">
        <li><a class="hover:text-gray-900" href="#">Dogs</a></li>
        <li><a class="hover:text-gray-900" href="#">Cats</a></li>
        <li><a class="hover:text-gray-900" href="#">Food</a></li>
        <li><a class="hover:text-gray-900" href="#">Supplies</a></li>
        <li><a class="hover:text-gray-900" href="#">Deals</a></li>
      </ul>

      <!-- 우측 유틸(검색/장바구니/모바일 메뉴 버튼을 띄워준다) -->
      <div class="flex items-center space-x-3">
        <button class="w-10 h-10 flex items-center justify-center rounded-lg hover:bg-gray-100" title="Search">
          <i class="ri-search-line text-xl text-gray-700"></i>
        </button>
        <a href="#" class="w-10 h-10 flex items-center justify-center rounded-lg hover:bg-gray-100" title="Cart">
          <i class="ri-shopping-cart-2-line text-xl text-gray-700"></i>
        </a>
        <button class="w-10 h-10 flex items-center justify-center rounded-lg hover:bg-gray-100 md:hidden" id="openMobile">
          <i class="ri-menu-line text-xl text-gray-700"></i>
        </button>
      </div>
    </div>
  </div>
</nav>

<!--
	컨트롤러에서 받아와야 하는 데이터!! 
model.addAttribute("products", pageSlice); // List<ProductDTO> 현재 페이지 분량
model.addAttribute("pageNum", pageNum);
model.addAttribute("totalPages", totalPages);
model.addAttribute("startPage", startPage); // 보통 1 또는 (블럭 시작)
model.addAttribute("endPage", endPage);     // 보통 min(totalPages, startPage+5)

 -->

<!-- [MAIN] 본문: 필터 + 상품 그리드 + 페이지네이션을 띄워준다 -->
<main class="max-w-7xl mx-auto px-4 py-6">
  <!-- 현재 위치(홈 > 카테고리)를 띄워준다 -->
  <div class="text-sm text-gray-600 mb-4">Home <span class="mx-2">›</span> Dog Food</div>

  <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
    <!-- [FILTER] 좌측 필터 패널(정적 UI; 실제 동작은 서버/JS로 구현) -->
    <aside class="lg:col-span-1 bg-white border border-gray-200 rounded-xl p-4 h-fit">
      <h2 class="text-lg font-semibold text-gray-900 mb-4">Filters</h2>

      <section class="mb-6">
        <h3 class="text-sm font-medium text-gray-800 mb-3">Category</h3>
        <!-- 카테고리 옵션을 띄워준다 -->
        <ul class="space-y-2 text-sm text-gray-700">
          <li><label class="flex items-center gap-2"><input type="checkbox"> Food</label></li>
          <li><label class="flex items-center gap-2"><input type="checkbox"> Treats</label></li>
          <li><label class="flex items-center gap-2"><input type="checkbox"> Supplies</label></li>
        </ul>
      </section>

      <section class="mb-6">
        <h3 class="text-sm font-medium text-gray-800 mb-3">Brand</h3>
        <!-- 브랜드 옵션을 띄워준다 -->
        <ul class="space-y-2 text-sm text-gray-700">
          <li><label class="flex items-center gap-2"><input type="checkbox"> Blue Buffalo</label></li>
          <li><label class="flex items-center gap-2"><input type="checkbox"> Pedigree</label></li>
          <li><label class="flex items-center gap-2"><input type="checkbox"> Purina</label></li>
        </ul>
      </section>

      <section>
        <h3 class="text-sm font-medium text-gray-800 mb-3">Price</h3>
        <!-- 가격 범위 슬라이더를 띄워준다(데모) -->
        <input type="range" min="10" max="200" value="60" class="w-full">
        <div class="text-sm text-gray-600 mt-1">Up to $60</div>
      </section>
    </aside>

    <!-- [RESULT] 우측 결과 영역 -->
    <section class="lg:col-span-3">
      <!-- 상단 툴바(총 개수/정렬) : 총 개수는 컨트롤러에서 따로 내려주거나 products.size()로 표시 가능 -->
      <div class="flex items-center justify-between mb-4">
        <div class="text-sm text-gray-600">
          <!-- 총 개수 텍스트를 띄워준다 (옵션) -->
          <c:if test="${not empty totalCount}">
            <strong>${totalCount}</strong> items found
          </c:if>
        </div>
        <select class="text-sm border border-gray-300 rounded-lg px-3 py-2 bg-white">
          <option value="popular">Most Popular</option>
          <option value="price-asc">Price: Low to High</option>
          <option value="price-desc">Price: High to Low</option>
          <option value="rating">Top Rated</option>
        </select>
      </div>

      <!-- 상품 카드 그리드: 컨트롤러가 넘긴 현재 페이지 분량(products)을 그대로 렌더링 -->
      <div class="grid grid-cols-2 md:grid-cols-3 gap-4 md:gap-6">
        <!-- 이 반복문은 '상품 카드'를 띄워준다 -->
        <c:forEach var="item" items="${products}">
          <article class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden hover:shadow-md transition-shadow">
            <!-- 상품 이미지를 띄워준다 -->
            <div class="aspect-square bg-gray-100">
              <img src="${item.image}" alt="${item.name}" class="w-full h-full object-cover object-center">
            </div>
            <div class="p-4">
              <!-- 브랜드명을 띄워준다 -->
              <div class="text-sm text-gray-600 mb-1">${item.brand}</div>
              <!-- 상품명을 띄워준다 -->
              <h3 class="font-medium text-gray-900 mb-2 line-clamp-2">${item.name}</h3>
              <!-- 가격을 띄워준다 -->
              <div class="text-lg font-bold text-gray-900 mb-2">${item.price}</div>
              <!-- 별점/리뷰 수를 띄워준다 (필요시 필드명 맞춰 변경) -->
              <div class="flex items-center">
                <div class="flex items-center text-yellow-400 mr-2">
                  <c:forEach var="s" begin="1" end="${item.rating}">
                    <i class="ri-star-fill text-sm"></i>
                  </c:forEach>
                  <c:forEach var="s" begin="1" end="${5 - item.rating}">
                    <i class="ri-star-line text-sm"></i>
                  </c:forEach>
                </div>
                <span class="text-sm text-gray-600">${item.reviews}</span>
              </div>
            </div>
          </article>
        </c:forEach>
      </div>

      <!-- [PAGINATION] 숫자 버튼 + prev/next 를 띄워준다 -->
      <div class="flex items-center justify-center gap-2 mt-8">
        <!-- prev 버튼: pageNum==1이면 비활성 -->
        <a class="page-btn <c:if test='${pageNum == 1}'>disabled</c:if>'"
           href="?page=${pageNum - 1}" aria-label="Previous">&lt;prev</a>

        <!-- 숫자 버튼: 컨트롤러가 구한 startPage~endPage까지만 노출(예: 1~6) -->
        <c:forEach var="p" begin="${startPage}" end="${endPage}">
          <a class="page-btn <c:if test='${p == pageNum}'>active</c:if>" href="?page=${p}">
            ${p}
          </a>
        </c:forEach>

        <!-- next 버튼: 마지막 페이지면 비활성 -->
        <a class="page-btn <c:if test='${pageNum == totalPages}'>disabled</c:if>'"
           href="?page=${pageNum + 1}" aria-label="Next">next&gt;</a>
      </div>
    </section>
  </div>
</main>

<!-- [MOBILE MENU] 작은 화면에서 사이드 메뉴를 띄워준다 -->
<div id="mobileMenu" class="fixed inset-0 bg-white z-50 hidden">
  <div class="p-4 flex items-center justify-between border-b">
    <div class="logo-font text-xl">logo</div>
    <button id="closeMobile" class="w-10 h-10 rounded-lg hover:bg-gray-100">
      <i class="ri-close-line text-xl text-gray-700"></i>
    </button>
  </div>
  <div class="p-4">
    <!-- 모바일 내비 항목을 띄워준다 -->
    <ul class="space-y-3 text-gray-800">
      <li><a href="#" class="block py-2">Dogs</a></li>
      <li><a href="#" class="block py-2">Cats</a></li>
      <li><a href="#" class="block py-2">Food</a></li>
      <li><a href="#" class="block py-2">Supplies</a></li>
      <li><a href="#" class="block py-2">Deals</a></li>
    </ul>
  </div>
</div>

<!-- [JS] 모바일 메뉴 토글: 버튼 클릭 시 사이드 메뉴를 띄워준다/숨긴다 -->
<script>
  const openBtn = document.getElementById('openMobile');
  const closeBtn = document.getElementById('closeMobile');
  const mobileMenu = document.getElementById('mobileMenu');
  if (openBtn) openBtn.addEventListener('click', () => mobileMenu.classList.remove('hidden'));
  if (closeBtn) closeBtn.addEventListener('click', () => mobileMenu.classList.add('hidden'));
</script>

</body>
</html>
