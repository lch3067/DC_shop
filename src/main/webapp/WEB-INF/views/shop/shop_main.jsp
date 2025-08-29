<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SHOP-main</title>
<script src="https://cdn.tailwindcss.com/3.4.16"></script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css" />
<script>
      tailwind.config = {
        theme: {
          extend: {
            colors: {
              primary: "#3b82f6",
              secondary: "#10b981",
            },
            borderRadius: {
              none: "0px",
              sm: "4px",
              DEFAULT: "8px",
              md: "12px",
              lg: "16px",
              xl: "20px",
              "2xl": "24px",
              "3xl": "32px",
              full: "9999px",
              button: "8px",
            },
          },
        },
      };
    </script>
    

</head>
<link rel="stylesheet" href="${path}/resources/css/footer.css">
<link rel="stylesheet" href="${path}/resources/css/header.css">
<link rel="stylesheet" href="${path}/resources/css/main.css">
<link rel="stylesheet" href="${path}/resources/css/shop_main.css">
<body>
	<!-- 헤더 시작 -->
	<%@ include file="../setting/header.jsp" %>
	<!-- 헤더 끝 -->
	
	<section class="hero-section1">
	</section>
	<section class="main-image-section" id="main-image-section" width="600px">
		 
		<!-- Navigation -->
	<nav class="bg-white shadow-sm border-b border-gray-200">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full">
			<div class="flex items-center justify-between h-16">
				<div class="flex items-center space-x-8">
					<div class="font-['Pacifico'] text-2xl text-primary">logo</div>
					<div class="hidden lg:flex items-center space-x-8">
							<a href="${path}/shop_main.do?" 
							class="text-gray-700 hover:text-primary no-underline transition-colors ">전체</a> 
							<a href="${path}/shop_main.do?petType=1"
							data-readdy="true" class="text-gray-700 hover:text-primary no-underline transition-colors">강아지</a> 
							<a href="${path}/shop_main.do?petType=2" 
							class="text-gray-700 hover:text-primary no-underline transition-colors ">고양이</a> 
							<a href="#" 
							class="text-gray-700 hover:text-primary no-underline transition-colors ">이벤트</a> 
					</div>
				</div>
				<!-- 검색 -->
				<div class="flex items-center space-x-4">
					<div class="relative hidden md:block">
						<div
							class="flex items-center bg-gray-100 rounded-lg px-4 py-2 w-80">
							<div class="w-5 h-5 flex items-center justify-center mr-3">
								<i class="ri-search-line text-gray-500"></i>
							</div>
							<form method="get" action="${pageContext.request.contextPath}/shop_main.do">
								<input type="hidden" name="petType" value="${petType}">
								<input type="hidden" name="sortOrder" value="${sortOrder}">
								<input type="text" value="${keyword}" placeholder="Search" name="searchKeyword" id="searchKeyword"
									class="bg-transparent border-none outline-none flex-1 text-sm"/>
							</form>
						</div>
					</div>
					<button id="mobile-menu-button"
					  class="lg:hidden w-10 h-10 flex items-center justify-center rounded-lg hover:bg-gray-100">
					  <i class="ri-menu-line text-gray-700 text-xl"></i>
					</button>
				</div>
			</div>
		</div>
	</nav>

	<div id="mobile-menu" class="hidden flex flex-col bg-white border-t border-gray-200 px-4 py-2 space-y-2 sm:hidden">
	  <a href="#" class="text-gray-700 hover:text-black">Pet Food</a>
	  <a href="#" class="text-gray-700 hover:text-black">Cat Food</a>
	  <a href="#" class="text-gray-700 hover:text-black">Dog Food</a>
	  <a href="#" class="text-gray-700 hover:text-black">Toys</a>
	  <a href="#" class="text-gray-700 hover:text-black">Supplies</a>
	  <a href="#" class="text-gray-700 hover:text-black">Recommendations</a>
	</div>

	<!-- Filter Overlay -->
	<div class="filter-overlay fixed inset-0 bg-black bg-opacity-50 z-40"></div>
	<!-- Filter Panel -->
	<div
		class="filter-panel fixed left-0 top-0 h-full w-80 bg-white shadow-xl z-50 overflow-y-auto">
		<div class="p-6">
			<div class="flex items-center justify-between mb-6">
				<h3 class="text-lg font-semibold text-gray-900">필터</h3>
				<button
					class="close-filter w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-100">
					<i class="ri-close-line text-gray-500"></i>
				</button>
			</div>
			
			<!-- Filter -->
			<!-- 강아지카테고리 -->
			<div class="mb-6">
				<div class="flex items-center justify-between mb-3 cursor-pointer brand-toggle">
					<div class="flex items-center">
						<div class="w-6 h-6 flex items-center justify-center mr-3 bg-blue-100 rounded">
							<i class="ri-price-tag-3-line text-blue-600 text-sm"></i>
						</div>
						<span class="font-medium text-gray-900">강아지</span>
					</div>
					<div class="w-5 h-5 flex items-center justify-center">
						<i class="ri-arrow-down-s-line text-gray-500 brand-arrow transition-transform"></i>
					</div>
				</div>
				<div class="brand-content ml-9 space-y-3">
					<div class="flex items-center">
						<a href="${path}/shop_main.do?petType=1&category=1100" class="no-underline"> 
							<span class="text-sm text-gray-700">의류</span></a>
							<span class="text-xs text-gray-500 ml-auto">갯수</span>
					</div>
					<div class="flex items-center">
						<a href="${path}/shop_main.do?petType=1&category=1200" class="no-underline"> 
							<span class="text-sm text-gray-700">미용/위생</span></a>
							<span class="text-xs text-gray-500 ml-auto">갯수</span>
					</div>
					<div class="flex items-center">
						<a href="${path}/shop_main.do?petType=1&category=1300" class="no-underline"> 
							<span class="text-sm text-gray-700">화장실</span></a>
							<span class="text-xs text-gray-500 ml-auto">갯수</span>
					</div>
					<div class="flex items-center">
						<a href="${path}/shop_main.do?petType=1&category=1400" class="no-underline"> 
							<span class="text-sm text-gray-700">장난감</span></a>
							<span class="text-xs text-gray-500 ml-auto">갯수</span>
					</div>
					<div class="flex items-center">
						<a href="${path}/shop_main.do?petType=1&category=1500" class="no-underline"> 
							<span class="text-sm text-gray-700">목줄/리드줄</span></a>
							<span class="text-xs text-gray-500 ml-auto">갯수</span>
					</div>
				</div>
			</div>
			

			<!-- 고양이 카테고리 -->
			<div class="mb-6">
				<div class="flex items-center justify-between mb-3 cursor-pointer brand-toggle2">
					<div class="flex items-center">
						<div class="w-6 h-6 flex items-center justify-center mr-3 bg-blue-100 rounded">
							<i class="ri-price-tag-3-line text-blue-600 text-sm"></i>
						</div>
						<span class="font-medium text-gray-900">고양이</span>
					</div>
					<div class="w-5 h-5 flex items-center justify-center">
						<i class="ri-arrow-down-s-line text-gray-500 brand-arrow transition-transform"></i>
					</div>
				</div>
				<div class="brand-content2 ml-9 space-y-3">
					<div class="flex items-center">
						<a href="${path}/shop_main.do?petType=2&category=2100" class="no-underline"> 
							<span class="text-sm text-gray-700">의류</span></a>
							<span class="text-xs text-gray-500 ml-auto">갯수</span>
					</div>
					<div class="flex items-center">
						<a href="${path}/shop_main.do?petType=2&category=2200" class="no-underline"> 
							<span class="text-sm text-gray-700">미용/위생</span></a>
							<span class="text-xs text-gray-500 ml-auto">갯수</span>
					</div>
					<div class="flex items-center">
						<a href="${path}/shop_main.do?petType=2&category=2300" class="no-underline"> 
							<span class="text-sm text-gray-700">모래</span></a>
							<span class="text-xs text-gray-500 ml-auto">갯수</span>
					</div>
					<div class="flex items-center">
						<a href="${path}/shop_main.do?petType=2&category=2400" class="no-underline"> 
							<span class="text-sm text-gray-700">장난감</span></a>
							<span class="text-xs text-gray-500 ml-auto">갯수</span>
					</div>
					<div class="flex items-center">
						<a href="${path}/shop_main.do?petType=2&category=2500" class="no-underline"> 
							<span class="text-sm text-gray-700">스크래쳐</span></a>
							<span class="text-xs text-gray-500 ml-auto">갯수</span>
					</div>
				</div>
			</div>
			
			<!-- Price Filter -->
			<div class="mb-6">
				<div
					class="flex items-center justify-between mb-3 cursor-pointer price-toggle">
					<div class="flex items-center">
						<div
							class="w-6 h-6 flex items-center justify-center mr-3 bg-green-100 rounded">
							<i class="ri-money-dollar-circle-line text-green-600 text-sm"></i>
						</div>
						<span class="font-medium text-gray-900">Price</span>
					</div>
					<div class="w-5 h-5 flex items-center justify-center">
						<i
							class="ri-arrow-up-s-line text-gray-500 price-arrow transition-transform"></i>
					</div>
				</div>
				<div class="price-content ml-9">
					<div class="flex items-center justify-between mb-3">
						<span class="text-sm text-gray-600">$<span
							id="min-price">0</span></span> <span class="text-sm text-gray-600">$<span
							id="max-price">100</span></span>
					</div>
					<div class="relative">
						<input type="range" min="0" max="100" value="0"
							class="price-slider w-full h-2" id="price-range" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Main Content -->
	<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
		<!-- Header -->
		<div
			class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 mb-8">
			<div>
				<h1 class="text-2xl md:text-3xl font-bold text-gray-900">Dog Shop 
				</h1>
				<p class="text-gray-600 mt-1">${total} results</p>
			</div>
			<!-- 세부 카테고리 -->
			<c:if test="${category != null && category !=''}">
			<nav class="max-w-4xl bg-white shadow-sm border-b border-gray-200 rounded-lg">
				<div class="max-w-4xl w-full mx-auto px-4 sm:px-6 lg:px-8 ">
					<div class="flex items-center justify-between-center h-16">
						<div class="flex flex-wrap gap-2 ">
							<div class="hidden lg:flex flex-wrap items-center gap-x-6 gap-y-3">
								<c:if test="${petType == '1'}">
									<c:forEach var="item" items="${subCateList}">
									<c:if test="${ item >= 1100 and item < 1600 }">
										<a href="${path}/shop_main.do?petType=1&category=${category}&subcate=${item}" 
										class="text-sm text-gray-500 hover:text-primary no-underline transition-colors whitespace-nowrap px-1">
											${dogcategoryNames[item]}</a> 
									</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${petType == '2'}">
									<c:forEach var="item" items="${subCateList}">
									<c:if test="${ item >= 2100 and item < 2600 }">
										<a href="${path}/shop_main.do?petType=2&category=${category}&subcate=${item}" 
										class="text-sm text-gray-500 hover:text-primary no-underline transition-colors  whitespace-nowrap px-1">
											${catcategoryNames[item]}</a> 
									</c:if>
									</c:forEach>
								</c:if>
							</div>
						</div>
						</div>
				</div>
			</nav>
			</c:if>
			<!-- 정렬부분!! -->
			<div class="flex items-center space-x-4">
				<div class="relative">
					<form id="sortform" method="get" 
					action="${pageContext.request.contextPath}/shop_main.do?sortOrder=${sortOrder}&searchKeyword=${keyword}&petType=${petType}" >
						<input type="hidden" name="searchKeyword" id="searchKeyword" value="${keyword}">
						<select id="sortOrder" name="sortOrder" onchange="this.form.submit()"
							class="appearance-none bg-white border border-gray-300 rounded-lg px-4 py-2 pr-8 text-sm focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent">
							<option value="new_pd" ${sortOrder=="new_pd"?"selected":""}>신상품순</option>
							<option value="low_price" ${sortOrder=="low_price"?"selected":""}>낮은가격순</option>
							<option value="high_price" ${sortOrder=="high_price"?"selected":""}>높은가격순</option>
							<option value="review_score" ${sortOrder=="review_score"?"selected":""}>별점순</option>
							<option value="review_cnt" ${sortOrder=="review_cnt"?"selected":""}>리뷰순</option>
						</select>
					</form>
					<div
						class="absolute right-3 top-1/2 transform -translate-y-1/2 pointer-events-none">
						<i class="ri-arrow-down-s-line text-gray-500"></i>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- Product Grid -->
		<div
			class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 md:gap-6">
			<c:if test="${list != null or !list.isEmpty() }">
			<c:forEach var="dto" items="${list}">
			<div
				class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden hover:shadow-md transition-shadow">
				<div class="aspect-square bg-gray-100 relative overflow-hidden">
					<img
						src="https://readdy.ai/api/search-image?query=Rachael%20Ray%20Nutrish%20natural%20dry%20dog%20food%20bag%20with%20wholesome%20ingredients%2C%20clean%20white%20background%2C%20professional%20product%20photography%2C%20premium%20pet%20nutrition&width=300&height=300&seq=2&orientation=squarish"
						alt="Rachael Ray Nutrish"
						class="w-full h-full object-cover object-top" />
				</div>
				<div class="p-4">
					<div class="text-sm text-gray-600 mb-1"></div>
					<h3 class="font-medium text-gray-900 mb-2">${dto.pd_name}</h3>
					<div class="text-lg font-bold text-gray-900 mb-2">${dto.pd_price}</div>
					<div class="flex items-center">
						<div class="flex items-center text-yellow-400 mr-2">
							<i class="ri-star-fill text-sm"></i> <i
								class="ri-star-fill text-sm"></i> <i
								class="ri-star-fill text-sm"></i> <i
								class="ri-star-fill text-sm"></i> <i
								class="ri-star-half-fill text-sm"></i>
						</div>
						<span class="text-sm text-gray-600">${dto.review_count}</span>
					</div>
				</div>
			</div>
			</c:forEach>
			</c:if>
			<c:if test="${empty list}">
				<div >
					<h5>상품이 없습니다.</h5>
				</div>
			</c:if>
			

		</div>
		
		<!-- 페이징 처리 부분 -->
		<div class="paging">
			<div class="flex items-center justify-center gap-2 mt-8">
				<ul class="flex items-center justify-center gap-2">
					<!-- 이전 버튼 처리 -->
					<c:if test="${paging.startPage > 10}">
						<li> <a href="${path}/shop_main.do?pageNum=${paging.prev}&sortOrder=${sortOrder}&searchKeyword=${keyword}&petType=${petType}" class="page-btn"
						aria-label="Previous">이전</a></li>
					</c:if>
					
					<!-- 페이지 번호 처리 -->
					<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
						<li><a href="${path}/shop_main.do?pageNum=${num}&sortOrder=${sortOrder}&searchKeyword=${keyword}&petType=${petType}" class="page-btn <c:if test='${num == paging.currentPage}'> active</c:if>">${num}</a></li>
					</c:forEach>
					
					<c:if test="${paging.endPage < paging.pageCount}">
						<li>
							<a href="${path}/shop_main.do?pageNum=${paging.next}&sortOrder=${sortOrder}&searchKeyword=${keyword}&petType=${petType}" class="page-btn"
							aria-label="Previous"> 다음 </a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<script id="mobile-menu">
	const mobileMenuButton = document.getElementById("mobile-menu-button");
    const mobileMenu = document.getElementById("mobile-menu");

    mobileMenuButton.addEventListener("click", () => {
      mobileMenu.classList.toggle("hidden");
    });
	
      document.addEventListener("DOMContentLoaded", function () {
        const mobileMenuButton = document.querySelector(".mobile-menu-button");
        const closeMobileMenuButton = document.querySelector(".close-mobile-menu");
        const mobileMenu = document.querySelector(".mobile-menu");
        const mobileFilterButton = document.querySelector(".mobile-filter-button");
        function toggleMobileMenu() {
          mobileMenu.classList.toggle("hidden");
          document.body.style.overflow = mobileMenu.classList.contains("hidden")
            ? ""
            : "hidden";
        }
        mobileMenuButton.addEventListener("click", toggleMobileMenu);
        closeMobileMenuButton.addEventListener("click", toggleMobileMenu);
        mobileFilterButton.addEventListener("click", function () {
          toggleMobileMenu();
          setTimeout(() => {
            const filterToggleBtn = document.querySelector(".filter-toggle-btn");
            if (filterToggleBtn) {
              filterToggleBtn.click();
            }
          }, 300);
        });
      });
    </script>
	<script id="filter-panel-toggle">
      document.addEventListener("DOMContentLoaded", function () {
        const filterToggleBtn = document.createElement("button");
        filterToggleBtn.className = "filter-toggle-btn";
        filterToggleBtn.innerHTML =
          '<i class="ri-filter-3-line text-gray-600"></i><span class="text-sm font-medium text-gray-700">Filters</span>';
        document.body.appendChild(filterToggleBtn);
        const filterPanel = document.querySelector(".filter-panel");
        const filterOverlay = document.querySelector(".filter-overlay");
        const closeFilter = document.querySelector(".close-filter");
        function toggleFilter() {
          filterPanel.classList.toggle("open");
          filterOverlay.classList.toggle("open");
          filterToggleBtn.classList.toggle("open");
          document.body.style.overflow = filterPanel.classList.contains("open")
            ? "hidden"
            : "";
        }
        filterToggleBtn.addEventListener("click", toggleFilter);
        closeFilter.addEventListener("click", toggleFilter);
        filterOverlay.addEventListener("click", toggleFilter);
      });
    </script>
	<script id="filter-interactions">
      document.addEventListener("DOMContentLoaded", function () {
        const brandToggle = document.querySelector(".brand-toggle");   
        const brandToggle2 = document.querySelector(".brand-toggle2");
        const brandContent = document.querySelector(".brand-content");
        const brandContent2 = document.querySelector(".brand-content2");
        const brandArrow = document.querySelector(".brand-arrow");
        const priceToggle = document.querySelector(".price-toggle");
        const priceContent = document.querySelector(".price-content");
        const priceArrow = document.querySelector(".price-arrow");
        brandToggle.addEventListener("click", function () {
          brandContent.style.display =
            brandContent.style.display === "none" ? "block" : "none";
          brandArrow.style.transform =
            brandContent.style.display === "none" ? "rotate(0deg)" : "rotate(180deg)";
        });
        brandToggle2.addEventListener("click", function () {
            brandContent2.style.display =
              brandContent2.style.display === "none" ? "block" : "none";
            brandArrow.style.transform =
              brandContent.style.display === "none" ? "rotate(0deg)" : "rotate(180deg)";
          });
        priceToggle.addEventListener("click", function () {
          priceContent.style.display =
            priceContent.style.display === "none" ? "block" : "none";
          priceArrow.style.transform =
            priceContent.style.display === "none" ? "rotate(0deg)" : "rotate(180deg)";
        });
        const priceRange = document.getElementById("price-range");
        const maxPriceDisplay = document.getElementById("max-price");
        priceRange.addEventListener("input", function () {
          maxPriceDisplay.textContent = this.value;
        });
        const checkboxes = document.querySelectorAll(".custom-checkbox");
        checkboxes.forEach((checkbox) => {
          checkbox.addEventListener("click", function () {
            this.classList.toggle("checked");
          });
        });
        
        /* 펫타입 설정시, 패널자동닫힘 */
        const getURL = new URLSearchParams(window.location.search);
        const petTypeP = getURL.get('petType');
        if(petTypeP === '1'){
        	brandContent.style.display = 'block';  // 강아지 열어
        	brandContent2.style.display = 'none';  // 고양이 닫아
        };
        if(petTypeP === '2'){
        	brandContent2.style.display = 'block';  // 고양이 열어
        	brandContent.style.display = 'none';  // 강아지 닫아
        }
      });
    </script>
	<!-- Product Detail Modal -->
	<div id="product-modal" class="fixed inset-0 z-50 hidden">
		<div class="absolute inset-0 bg-black bg-opacity-50"
			onclick="closeProductModal()"></div>
		<div class="absolute inset-0 overflow-y-auto">
			<div class="flex min-h-full items-center justify-center p-4">
				<div class="relative bg-white w-full max-w-5xl rounded-xl shadow-lg">
					<!-- Close button -->
					<button onclick="closeProductModal()"
						class="absolute right-4 top-4 w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-100">
						<i class="ri-close-line text-gray-500 text-xl"></i>
					</button>

					<div class="grid grid-cols-1 md:grid-cols-2 gap-8 p-6">
						<!-- Product Images -->
						<div class="space-y-4">
							<div class="aspect-square bg-gray-100 rounded-lg overflow-hidden">
								<img id="modal-main-image" src="" alt=""
									class="w-full h-full object-cover object-top" />
							</div>
							<div class="grid grid-cols-4 gap-4">
								<div
									class="aspect-square bg-gray-100 rounded-lg overflow-hidden cursor-pointer hover:opacity-75">
									<img
										src="https://readdy.ai/api/search-image?query=premium%20dog%20food%20package%20front%20view%2C%20professional%20studio%20lighting%2C%20clean%20white%20background&width=150&height=150&seq=11&orientation=squarish"
										alt="" class="w-full h-full object-cover object-top" />
								</div>
								<div
									class="aspect-square bg-gray-100 rounded-lg overflow-hidden cursor-pointer hover:opacity-75">
									<img
										src="https://readdy.ai/api/search-image?query=premium%20dog%20food%20package%20side%20view%20nutritional%20information%2C%20professional%20studio%20lighting&width=150&height=150&seq=12&orientation=squarish"
										alt="" class="w-full h-full object-cover object-top" />
								</div>
								<div
									class="aspect-square bg-gray-100 rounded-lg overflow-hidden cursor-pointer hover:opacity-75">
									<img
										src="https://readdy.ai/api/search-image?query=premium%20dog%20food%20kibbles%20closeup%20texture%2C%20professional%20food%20photography&width=150&height=150&seq=13&orientation=squarish"
										alt="" class="w-full h-full object-cover object-top" />
								</div>
								<div
									class="aspect-square bg-gray-100 rounded-lg overflow-hidden cursor-pointer hover:opacity-75">
									<img
										src="https://readdy.ai/api/search-image?query=happy%20dog%20eating%20premium%20dog%20food%2C%20lifestyle%20pet%20photography&width=150&height=150&seq=14&orientation=squarish"
										alt="" class="w-full h-full object-cover object-top" />
								</div>
							</div>
						</div>
					</div>

					<!-- Tabs -->
					<div class="border-t">
						<div class="flex border-b">
							<button
								class="px-6 py-4 text-sm font-medium text-primary border-b-2 border-primary">
								Description</button>
							<button
								class="px-6 py-4 text-sm font-medium text-gray-500 hover:text-gray-700">
								Reviews</button>
							<button
								class="px-6 py-4 text-sm font-medium text-gray-500 hover:text-gray-700">
								Q&A</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<script id="product-modal-handlers">
      document.addEventListener("DOMContentLoaded", function () {
        let currentQuantity = 1;

        window.openProductModal = function (element) {
          const modal = document.getElementById("product-modal");
          const mainImage = element.querySelector("img").src;
          const brand = element.querySelector(".text-gray-600").textContent;
          const title = element.querySelector("h3").textContent;
          const price = element.querySelector(".font-bold").textContent;

          document.getElementById("modal-main-image").src = mainImage;
          document.getElementById("modal-brand").textContent = brand;
          document.getElementById("modal-title").textContent = title;
          document.getElementById("modal-price").textContent = price;

          modal.classList.remove("hidden");
          document.body.style.overflow = "hidden";
        };

        window.closeProductModal = function () {
          const modal = document.getElementById("product-modal");
          modal.classList.add("hidden");
          document.body.style.overflow = "";
        };

        window.updateQuantity = function (change) {
          const quantityInput = document.getElementById("quantity");
          currentQuantity = Math.max(1, parseInt(quantityInput.value) + change);
          quantityInput.value = currentQuantity;
        };
      });
    </script>
    
    
	</section>
	<!-- 푸터 시작 -->
	<%@ include file="../setting/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>