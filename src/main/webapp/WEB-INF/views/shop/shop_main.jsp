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
    
<!-- 정렬 AJAX -->
<!--<script>
	$(document).ready(function(){
		let currentPage = 1;
		const pageItems = 12;		// 페이지당 가져올 상품 갯수
		
		// 상품 목록 가져오기
		function getProducts(isNewSearch = true) {
			if (isNewSearch) {
	            currentPage = 1; // 새로운 정렬/필터링 시 페이지 초기화
	            $('#productListContainer').empty(); // 기존 상품 목록 비우기
	        }
			
			const sortOrder = $('#sortOrder').val();
			
			
			// 선택된 카테고리 값 가져오기
	        // 용품, 장난감, 위생/미용, 의류 4개의 그룹을 모두 처리
	        const selectedCategories = [];
	        $('.custom-checkbox.checked').each(function() {
	            selectedCategories.push($(this).data('filter'));
	        });
	        
	     	// 카테고리가 여러 개일 경우, 배열을 콤마로 구분된 문자열로 변환
	        const categoryString = selectedCategories.join(',');

	        const startRow = (currentPage - 1) * itemsPerPage + 1;
	        const endRow = startRow + itemsPerPage - 1;
	     // AJAX 호출
	        $.ajax({
	            url: '${path}/api/products', // JSP에서 경로 변수를 사용
	            type: 'GET',
	            data: {
	                sortOrder: sortOrder,
	                category: categoryString, // 카테고리 필터 파라미터
	                start: startRow,
	                end: endRow
	            },
	            dataType: 'json',
	            success: function(products) {
	                let productHtml = '';
	                if (products && products.length > 0) {
	                    products.forEach(function(product) {
	                        // 상품 카드 HTML 생성
	                        productHtml += `
	                            <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden hover:shadow-md transition-shadow">
	                                <div class="aspect-square bg-gray-100 relative overflow-hidden">
	                                    <img src="${product.pd_image_url}" alt="${product.pd_name}" class="w-full h-full object-cover object-top" />
	                                </div>
	                                <div class="p-4">
	                                    <div class="text-sm text-gray-600 mb-1">${product.pd_brand}</div>
	                                    <h3 class="font-medium text-gray-900 mb-2">${product.pd_name}</h3>
	                                    <div class="text-lg font-bold text-gray-900 mb-2">${product.pd_price}원</div>
	                                    <div class="flex items-center">
	                                        <div class="flex items-center text-yellow-400 mr-2">
	                                            <i class="ri-star-fill text-sm"></i>
	                                            <i class="ri-star-fill text-sm"></i>
	                                            <i class="ri-star-fill text-sm"></i>
	                                        </div>
	                                        <span class="text-sm text-gray-600">(${product.review_cnt})</span>
	                                    </div>
	                                </div>
	                            </div>
	                        `;
	                    });
	                } else {
	                    productHtml = '<p class="col-span-4 text-center text-gray-500">해당하는 상품이 없습니다.</p>';
	                }
	                
	                // 기존 내용을 지우고 새로운 내용으로 채우기
	                $('#productListContainer').html(productHtml);
	                
	                // 페이지네이션 버튼 숨기기 (AJAX 페이징을 구현할 경우)
	                $('.paging').hide();
	            },
	            error: function(xhr, status, error) {
	                console.error("상품 목록 로딩 실패:", error);
	                $('#productListContainer').html('<p class="col-span-4 text-center text-red-500">상품 로딩 중 오류가 발생했습니다.</p>');
	            }
	        });
		}
		// 초기 페이지 로딩 시 상품 불러오기
	    fetchProducts();

	    // 정렬 드롭다운 변경 이벤트
	    $('#sortOrder').on('change', function() {
	        fetchProducts(true);
	    });

	    // 카테고리 체크박스 클릭 이벤트
	    $(document).on('click', '.custom-checkbox', function() {
	        $(this).toggleClass('checked');
	        fetchProducts(true);
	    });
	});
</script> -->


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
						<a href="#"
							class="text-gray-700 hover:text-primary transition-colors">Pet Food</a> 
							<a
							href="https://readdy.ai/home/b6511771-df02-440a-969d-e1281a6d8c0e/99208426-98f0-4462-846b-ef4957bd049b"
							data-readdy="true"
							class="text-gray-700 hover:text-primary transition-colors">Cat Food</a> 
							<a href="#" class="text-primary font-medium">Dog Food</a> 
							<a href="#"
							class="text-gray-700 hover:text-primary transition-colors">Toys</a>
						<a href="#"
							class="text-gray-700 hover:text-primary transition-colors">Supplies</a>
						<a href="#"
							class="text-gray-700 hover:text-primary transition-colors">Recommendations</a>
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
							<form method="get" action="${pageContext.request.contextPath}/shop_main.do?keyword=${keyword}&sortOrder=${sortOrder}">
								<input type="text" value="${keyword}" placeholder="Search" name="searchKeyword" id="searchKeyword"
									class="bg-transparent border-none outline-none flex-1 text-sm"
									 />
							</form>
						</div>
					</div>
					<button
						class="lg:hidden mobile-menu-button w-10 h-10 flex items-center justify-center rounded-lg hover:bg-gray-100">
						<i class="ri-menu-line text-gray-700 text-xl"></i>
					</button>
				</div>
			</div>
		</div>
	</nav>

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
			<!-- Brand Filter -->
			<div class="mb-6">
				<div
					class="flex items-center justify-between mb-3 cursor-pointer brand-toggle">
					<div class="flex items-center">
						<div class="w-6 h-6 flex items-center justify-center mr-3 bg-blue-100 rounded">
							<i class="ri-price-tag-3-line text-blue-600 text-sm"></i>
						</div>
						<span class="font-medium text-gray-900">용품</span>
					</div>
					<div class="w-5 h-5 flex items-center justify-center">
						<i
							class="ri-arrow-down-s-line text-gray-500 brand-arrow transition-transform"></i>
					</div>
				</div>
				<div class="brand-content ml-9 space-y-3">
					<div class="flex items-center">
						<div class="custom-checkbox mr-3" data-filter="blue-buffalo"></div>
						<span class="text-sm text-gray-700">목줄</span> <span
							class="text-xs text-gray-500 ml-auto">(24)</span>
					</div>
					<div class="flex items-center">
						<div class="custom-checkbox mr-3" data-filter="rachael-ray"></div>
						<span class="text-sm text-gray-700">하네스</span> <span
							class="text-xs text-gray-500 ml-auto">(18)</span>
					</div>
					<div class="flex items-center">
						<div class="custom-checkbox mr-3" data-filter="hills"></div>
						<span class="text-sm text-gray-700">배변패드</span> <span
							class="text-xs text-gray-500 ml-auto">(16)</span>
					</div>
				</div>
				<div
					class="flex items-center justify-between mb-3 cursor-pointer brand-toggle">
					<div class="flex items-center">
						<div class="w-6 h-6 flex items-center justify-center mr-3 bg-blue-100 rounded">
							<i class="ri-price-tag-3-line text-blue-600 text-sm"></i>
						</div>
						<span class="font-medium text-gray-900">장난감</span>
					</div>
					<div class="w-5 h-5 flex items-center justify-center">
						<i
							class="ri-arrow-down-s-line text-gray-500 brand-arrow transition-transform"></i>
					</div>
				</div>
				<div class="brand-content ml-9 space-y-3">
					<div class="flex items-center">
						<div class="custom-checkbox mr-3" data-filter="blue-buffalo"></div>
						<span class="text-sm text-gray-700">공</span> <span
							class="text-xs text-gray-500 ml-auto">(24)</span>
					</div>
					<div class="flex items-center">
						<div class="custom-checkbox mr-3" data-filter="rachael-ray"></div>
						<span class="text-sm text-gray-700">인형</span> <span
							class="text-xs text-gray-500 ml-auto">(18)</span>
					</div>
					<div class="flex items-center">
						<div class="custom-checkbox mr-3" data-filter="pedigree"></div>
						<span class="text-sm text-gray-700">터그</span> <span
							class="text-xs text-gray-500 ml-auto">(32)</span>
					</div>
				</div>
				<div
					class="flex items-center justify-between mb-3 cursor-pointer brand-toggle">
					<div class="flex items-center">
						<div class="w-6 h-6 flex items-center justify-center mr-3 bg-blue-100 rounded">
							<i class="ri-price-tag-3-line text-blue-600 text-sm"></i>
						</div>
						<span class="font-medium text-gray-900">위생/미용</span>
					</div>
					<div class="w-5 h-5 flex items-center justify-center">
						<i
							class="ri-arrow-down-s-line text-gray-500 brand-arrow transition-transform"></i>
					</div>
				</div>
				<div class="brand-content ml-9 space-y-3">
					<div class="flex items-center">
						<div class="custom-checkbox mr-3" data-filter="blue-buffalo"></div>
						<span class="text-sm text-gray-700">샴푸</span> <span
							class="text-xs text-gray-500 ml-auto">(24)</span>
					</div>
					<div class="flex items-center">
						<div class="custom-checkbox mr-3" data-filter="rachael-ray"></div>
						<span class="text-sm text-gray-700">브러쉬</span> <span
							class="text-xs text-gray-500 ml-auto">(18)</span>
					</div>
					<div class="flex items-center">
						<div class="custom-checkbox mr-3" data-filter="pedigree"></div>
						<span class="text-sm text-gray-700">발 세정제</span> <span
							class="text-xs text-gray-500 ml-auto">(32)</span>
					</div>
				</div>
				<div
					class="flex items-center justify-between mb-3 cursor-pointer brand-toggle">
					<div class="flex items-center">
						<div class="w-6 h-6 flex items-center justify-center mr-3 bg-blue-100 rounded">
							<i class="ri-price-tag-3-line text-blue-600 text-sm"></i>
						</div>
						<span class="font-medium text-gray-900">의류</span>
					</div>
					<div class="w-5 h-5 flex items-center justify-center">
						<i
							class="ri-arrow-down-s-line text-gray-500 brand-arrow transition-transform"></i>
					</div>
				</div>
				<div class="brand-content ml-9 space-y-3">
					<div class="flex items-center">
						<div class="custom-checkbox mr-3" data-filter="blue-buffalo"></div>
						<span class="text-sm text-gray-700">대형동물</span> <span
							class="text-xs text-gray-500 ml-auto">(24)</span>
					</div>
					<div class="flex items-center">
						<div class="custom-checkbox mr-3" data-filter="rachael-ray"></div>
						<span class="text-sm text-gray-700">중형동물</span> <span
							class="text-xs text-gray-500 ml-auto">(18)</span>
					</div>
					<div class="flex items-center">
						<div class="custom-checkbox mr-3" data-filter="pedigree"></div>
						<span class="text-sm text-gray-700">소형동물</span> <span
							class="text-xs text-gray-500 ml-auto">(32)</span>
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
				<h1 class="text-2xl md:text-3xl font-bold text-gray-900">Dog Food</h1>
				<p class="text-gray-600 mt-1">129,382 results</p>
			</div>
			<div class="flex items-center space-x-4">
				<div class="relative">
					<form id="sortform" method="get" action="${pageContext.request.contextPath}/shop_main.do?sortOrder=${sortOrder}&h_searchKeyword=${keyword}" >
						<input type="hidden" name="h_searchKeyword" id="h_searchKeyword" value="${keyword}">
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
			

		</div>
		
		<!-- 페이징 처리 부분 -->
		<div class="paging">
			<div class="flex items-center justify-center gap-2 mt-8">
				<ul class="flex items-center justify-center gap-2">
					<!-- 이전 버튼 처리 -->
					<c:if test="${paging.startPage > 10}">
						<li> <a href="${path}/shop_main.do?pageNum=${paging.prev}&sortOrder=${sortOrder}&searchKeyword=${keyword}" class="page-btn"
						aria-label="Previous">이전</a></li>
					</c:if>
					
					<!-- 페이지 번호 처리 -->
					<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
						<li><a href="${path}/shop_main.do?pageNum=${num}&sortOrder=${sortOrder}&searchKeyword=${keyword}" class="page-btn <c:if test='${num == paging.currentPage}'> active</c:if>">${num}</a></li>
					</c:forEach>
					
					<c:if test="${paging.endPage < paging.pageCount}">
						<li>
							<a href="${path}/shop_main.do?pageNum=${paging.next}&sortOrder=${sortOrder}&searchKeyword=${keyword}" class="page-btn"
							aria-label="Previous"> 다음 </a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<script id="mobile-menu">
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
        const brandContent = document.querySelector(".brand-content");
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