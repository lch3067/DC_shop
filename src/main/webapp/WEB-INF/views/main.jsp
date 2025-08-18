<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>펫샵 - 사랑스러운 반려동물과 함께</title>
<link rel="stylesheet" href="styles.css">
<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.0.0/fonts/remixicon.css"
	rel="stylesheet">
</head>
<script type="text/javascript">
const petImages = [    {
    url: "https://readdy.ai/api/search-image?query=Adorable golden retriever puppy sitting in a modern pet store, bright clean background, professional pet photography, warm lighting, happy expression, high quality commercial photo&width=1920&height=1080&seq=dog-1&orientation=landscape",
    alt: "골든 리트리버 강아지",
    type: "강아지"
},    {
    url: "https://readdy.ai/api/search-image?query=Beautiful fluffy persian cat with bright blue eyes sitting elegantly in a modern pet store, clean minimalist background, professional pet photography, soft natural lighting, commercial quality photo&width=1920&height=1080&seq=cat-1&orientation=landscape",
    alt: "페르시안 고양이",
    type: "고양이"
},
{        url: "https://readdy.ai/api/search-image?query=Cute french bulldog puppy playing with toys in a contemporary pet shop setting, clean minimalist background, professional pet photography, soft natural lighting&width=1920&height=1080&seq=dog-2&orientation=landscape",
    alt: "프렌치 불독 강아지",
    type: "강아지"
},    {
    url: "https://readdy.ai/api/search-image?query=Adorable british shorthair kitten with grey fur playing in a modern veterinary clinic, clean white background, professional pet portrait, gentle lighting, commercial quality photo&width=1920&height=1080&seq=cat-2&orientation=landscape",        alt: "브리티시 숏헤어 고양이",        type: "고양이"    },
{
    url: "https://readdy.ai/api/search-image?query=Beautiful labrador puppy with bright eyes in a modern veterinary clinic, clean white background, professional pet portrait, gentle lighting, commercial quality photo&width=1920&height=1080&seq=dog-3&orientation=landscape",
    alt: "래브라도 강아지",        type: "강아지"    },
{
</script>
<style>
/* Google Fonts */
@import
	url('https://fonts.googleapis.com/css2?family=Pacifico&display=swap');

@import
	url('https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.5.0/remixicon.min.css')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		sans-serif;
	line-height: 1.6;
	color: #333;
} /* 헤더 스타일 */
.header {
	width: 100%;
	background: rgba(255, 255, 255, 0.9);
	background-color: rgba(255, 255, 255, 0.7); /* 0.7 = 70% 불투명 */
	backdrop-filter: blur(8px);
	border-bottom: 1px solid rgba(229, 231, 235, 0.5);
	position: fixed;
	top: 0;
	z-index: 50;
}

.header-container {
	max-width: 1280px;
	margin: 0 auto;
	padding: 1rem 1.5rem;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	font-size: 1.125rem;
	font-weight: 500;
	color: #1f2937;
}

.desktop-nav {
	display: flex;
	align-items: center;
	gap: 2rem;
}

.nav-link {
	font-size: 0.875rem;
	color: #374151;
	text-decoration: none;
	cursor: pointer;
	transition: color 0.2s;
}

.nav-link:hover {
	color: #000;
}

.contact-btn {
	background: #000;
	color: white;
	padding: 0.5rem 1rem;
	font-size: 0.875rem;
	border: none;
	border-radius: 0.25rem;
	cursor: pointer;
	white-space: nowrap;
	transition: background 0.2s;
}

.contact-btn:hover {
	background: #374151;
}

.mobile-menu-btn {
	display: none;
	width: 2rem;
	height: 2rem;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	border: none;
	background: none;
}

.mobile-menu {
	display: none;
	background: rgba(255, 255, 255, 0.95);
	backdrop-filter: blur(8px);
	border-top: 1px solid rgba(229, 231, 235, 0.5);
}

.mobile-nav {
	padding: 1rem 1.5rem;
	display: flex;
	flex-direction: column;
	gap: 1rem;
}

.mobile-nav-link {
	display: block;
	font-size: 0.875rem;
	color: #374151;
	text-decoration: none;
	cursor: pointer;
	padding: 0.5rem 0;
	transition: color 0.2s;
}

.mobile-nav-link:hover {
	color: #000;
}

.mobile-contact-btn {
	width: 100%;
	background: #000;
	color: white;
	padding: 0.5rem 1rem;
	font-size: 0.875rem;
	border: none;
	border-radius: 0.25rem;
	cursor: pointer;
	white-space: nowrap;
	margin-top: 1rem;
	transition: background 0.2s;
}

.mobile-contact-btn:hover {
	background: #374151;
} /* 히어로 섹션 */
.hero-section {
	width: 100%;
	background: white;
	padding: 5rem 0;
	padding-top: 8rem;
}

.hero-container {
	max-width: 1280px;
	margin: 0 auto;
	padding: 0 1.5rem;
}

.hero-content {
	max-width: 36rem;
}

.hero-title {
	font-size: 3rem;
	font-weight: bold;
	color: #000;
	margin-bottom: 1.5rem;
	line-height: 1.2;
}

.hero-description {
	font-size: 1.125rem;
	color: #6b7280;
	margin-bottom: 2rem;
	line-height: 1.6;
}

.hero-btn {
	background: #000;
	color: white;
	padding: 0.75rem 2rem;
	font-size: 1.125rem;
	border: none;
	border-radius: 0.25rem;
	cursor: pointer;
	white-space: nowrap;
	transition: background 0.2s;
}

.hero-btn:hover {
	background: #374151;
}
/* 메인 이미지 섹션 */
.main-image-section {
	/* width: 70%; */
	
	position: relative;
	min-height: 60vh;
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	
	max-width: 1280px;
	margin: 0 auto;
	padding: 0 1.5rem;
}

.image-overlay {
	position: absolute;
	inset: 0;
	background: rgba(0, 0, 0, 0.3);
}

.nav-button {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	z-index: 20;
	background: none;
	border: none;
	cursor: pointer;
	padding: 0;
}

.nav-button-left {
	left: 1.5rem;
}

.nav-button-right {
	right: 1.5rem;
}

.nav-button-circle {
	width: 4rem;
	height: 4rem;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	transition: all 0.3s;
	border: 1px solid transparent;
}

.nav-button:hover .nav-button-circle {
	background: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(8px);
	border-color: rgba(255, 255, 255, 0.2);
}

.nav-arrow {
	width: 1.5rem;
	height: 1.5rem;
	color: rgba(255, 255, 255, 0.7);
	transition: color 0.2s;
}

.nav-button:hover .nav-arrow {
	color: white;
}

.pet-type-label {
	position: absolute;
	top: 1.5rem;
	left: 50%;
	transform: translateX(-50%);
	z-index: 20;
}

.pet-type-label span {
	background: rgba(255, 255, 255, 0.2);
	backdrop-filter: blur(8px);
	color: white;
	padding: 0.5rem 1rem;
	border-radius: 9999px;
	font-size: 0.875rem;
	font-weight: 500;
	border: 1px solid rgba(255, 255, 255, 0.3);
}

.image-indicators {
	position: absolute;
	bottom: 1.5rem;
	left: 50%;
	transform: translateX(-50%);
	z-index: 20;
	display: flex;
	gap: 0.75rem;
}

.indicator {
	width: 0.75rem;
	height: 0.75rem;
	border-radius: 50%;
	cursor: pointer;
	transition: all 0.3s;
	background: rgba(255, 255, 255, 0.5);
}

.indicator:hover {
	background: rgba(255, 255, 255, 0.75);
}

.indicator.active {
	background: white;
	transform: scale(1.25);
}

.main-image-content {
	position: relative;
	z-index: 10;
	max-width: 1280px;
	margin: 0 auto;
	padding: 0 1.5rem;
	min-height: 30vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.main-image-text {
	max-width: 32rem;
}

.main-image-title {
	font-size: 2.5rem;
	font-weight: bold;
	color: white;
	margin-bottom: 1.5rem;
	line-height: 1.2;
	text-shadow: 3px 3px 8px black;
}

.main-image-description {
	font-size: 1.25rem;
	color: white;
	margin-bottom: 2rem;
	line-height: 1.6;
	opacity: 0.9;
	text-shadow: 3px 3px 8px black;
}

.main-image-buttons {
	display: flex;
	gap: 1rem;
}

.primary-btn {
	background: white;
	color: #000;
	padding: 0.75rem 2rem;
	font-size: 1.125rem;
	border: none;
	border-radius: 0.25rem;
	cursor: pointer;
	white-space: nowrap;
	font-weight: 500;
	transition: background 0.2s;
}

.primary-btn:hover {
	background: #f3f4f6;
}

.secondary-btn {
	border: 2px solid white;
	color: white;
	background: transparent;
	padding: 0.75rem 2rem;
	font-size: 1.125rem;
	border-radius: 0.25rem;
	cursor: pointer;
	white-space: nowrap;
	font-weight: 500;
	transition: all 0.2s;
	
}

.secondary-btn:hover {
	background: white;
	color: #000;
} /* 제품 섹션 */
.product-section {
	width: 100%;
	background: white;
	padding: 4rem 0;
}

.product-container {
	max-width: 1280px;
	margin: 0 auto;
	padding: 0 1.5rem;
}

.product-title {
	text-align: center;
	font-size: 1.875rem;
	font-weight: bold;
	color: #000;
	margin-bottom: 4rem;
}

.product-grid {
	display: grid;
	grid-template-columns: 1fr;
	gap: 3rem;
}

.product-card {
	transition: all 0.2s;
}

.product-image {
	margin-bottom: 1.5rem;
}

.product-image img {
	width: 100%;
	height: 12rem;
	object-fit: cover;
	object-position: top;
	border-radius: 0.5rem;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.2s;
}

.product-card:hover .product-image img {
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.product-card-title {
	font-size: 1.25rem;
	font-weight: bold;
	color: #000;
	margin-bottom: 0.75rem;
}

.product-card-description {
	color: #6b7280;
	line-height: 1.6;
} /* 반응형 디자인 */
@media ( min-width : 768px) {
	.desktop-nav {
		display: flex;
	}
	<
	br>.mobile-menu-btn {
		display: none;
	}
	<
	br>.hero-title {
		font-size: 3rem;
	}
	.main-image-title {
		font-size: 3rem;
	}
	.product-grid {
		grid-template-columns: repeat(3, 1fr);
	}
}

.footer {
	width: 100%;
	background: rgba(255, 255, 255, 0.9);
	background-color: rgba(211, 211, 211, 0.7); /* 0.7 = 70% 불투명 */
	backdrop-filter: blur(8px);
	/* border-bottom: 1px solid rgba(229, 231, 235, 0.5); */
	/* position: fixed; */ 
	/* top: 0; */
	/* z-index: 50; */
}

.footer-container {
	max-width: 1280px;
	margin: 0 auto;
	padding: 1rem 1.5rem;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

@media ( max-width : 767px) {
	.desktop-nav {
		display: none;
	}
	<
	br>.mobile-menu-btn {
		display: flex;
	}
	<
	br>.mobile-menu.show {
		display: block;
	}
	<
	br>.hero-title {
		font-size: 2.25rem;
	}
	.main-image-title {
		font-size: 2rem;
	}
	<
	br>.main-image-buttons {
		flex-direction: column;
	}
	<
	br>.primary-btn, .secondary-btn {
		width: 100%;
	}
}
```
</style>
<body>
	<header class="header">
		<div class="header-container">
			<div class="logo"><img alt="" src="resources/독캣배송_아이콘만.png" width="100px"> <!-- 사이트 이름 --></div>
			<div><img alt="" src="resources/독캣배송_폰트만.png" width="300px"></div>
			<nav class="desktop-nav">
				<!-- <a href="#" class="nav-link">주요</a> --> 
				<a href="#" class="nav-link" onclick="window.location='${path}/shop_main'">SHOP</a>
				<a href="#" class="nav-link" onclick="window.location='${path}/comm_main'">COMMUNITY</a>
				
				<c:if test="${empty sessionScope.sessionid}">
				<a href="#" class="nav-link" onclick="window.location='${path}/yak'">회원가입</a>
				</c:if>
				<c:if test="${!(empty sessionScope.sessionid)}">
				<a href="#" class="nav-link" onclick="window.location='${path}/yak'">나의정보</a>
				</c:if>
				
				<c:if test="${empty sessionScope.sessionid}">
				<button class="contact-btn" onclick="window.location='${path}/login'">로그인</button>
				</c:if>
				<c:if test="${!(empty sessionScope.sessionid)}">
				<button class="contact-btn" onclick="window.location='${path}/logout'">로그아웃</button>
				</c:if>
			</nav>
			<button class="mobile-menu-btn" onclick="toggleMobileMenu()">
				<i class="ri-menu-line" id="menu-icon"></i>
			</button>
		</div>
		<div class="mobile-menu" id="mobile-menu">
			<nav class="mobile-nav">
				<a href="#" class="mobile-nav-link">주요</a> <a href="#"
					class="mobile-nav-link">회사소개</a> <a href="#"
					class="mobile-nav-link">메뉴</a>
				<button class="mobile-contact-btn">연락</button>
			</nav>
		</div>
	</header>
	<section class="hero-section">
		<!-- <div class="hero-container">
			<div class="hero-content">
				<h1 class="hero-title">랜딩 페이지 제목</h1>
				<p class="hero-description">실용성 있는 디자인과 직관적이며 대담한 추상적 조합으로, 사용하기
					자연스럽고 유용한 소프트웨어를 초점에 맞춘다.</p>
				<button class="hero-btn">더보기</button>
			</div>
		</div> -->
	</section>
	<section class="main-image-section" id="main-image-section" width="600px">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  
  <div id="mainCarousel" class="carousel slide" data-bs-ride="carousel"  align="center">
    <div class="carousel-inner">
      <!-- 첫 번째 이미지 -->
      <div class="carousel-item active" >
        <img height="600px" src="resources/메인_강아지1.jpg" class="d-block w-100" alt="강아지 이미지1" />
        <div class="carousel-caption d-none d-md-block text-start">
          <br>
			<div class="main-image-content">
				<div class="main-image-text">
					<h2 class="main-image-title">사랑스러운 <br>반려동물과 함께</h2>
					<p class="main-image-description">건강하고 행복한 반려동물을 위한 프리미엄 용품과
						<br>서비스를 제공합니다.</p>
					<div class="main-image-buttons">
						<button class="primary-btn">SHOP</button>
						<button class="secondary-btn">COMM</button>
					</div>
				</div>
			</div>
        </div>
      </div>
      
      <!-- 두 번째 이미지 -->
      <div class="carousel-item">
        <img height="600px" src="resources/메인_고양이1.jpg" class="d-block w-100" alt="이미지 2" />
        <div class="carousel-caption d-none d-md-block text-start">
          <br>
			<div class="main-image-content">
				<div class="main-image-text">
					<h2 class="main-image-title">사랑스러운 <br>반려동물과 함께</h2>
					<p class="main-image-description">건강하고 행복한 반려동물을 위한 프리미엄 용품과
						<br>서비스를 제공합니다.</p>
					<div class="main-image-buttons">
						<button class="primary-btn">SHOP</button>
						<button class="secondary-btn">COMM</button>
					</div>
				</div>
			</div>
        </div>
      </div>

      <!-- 세 번째 이미지 -->
      <div class="carousel-item">
        <img height="600px" src="resources/메인_같이.png" class="d-block w-100" alt="이미지 3" />
        <div class="carousel-caption d-none d-md-block text-start">
          <br>
			<div class="main-image-content">
				<div class="main-image-text">
					<h2 class="main-image-title">사랑스러운 <br>반려동물과 함께</h2>
					<p class="main-image-description">건강하고 행복한 반려동물을 위한 프리미엄 용품과
						<br>서비스를 제공합니다.</p>
					<div class="main-image-buttons">
						<button class="primary-btn">SHOP</button>
						<button class="secondary-btn">COMM</button>
					</div>
				</div>
			</div>
        </div>
      </div>
      
      <!-- 네 번째 이미지 -->
      <div class="carousel-item">
        <img height="600px" src="resources/메인_커뮤1.png" class="d-block w-100" alt="이미지 4" />
        <div class="carousel-caption d-none d-md-block text-start">
          <br>
			<div class="main-image-content">
				<div class="main-image-text">
					<h2 class="main-image-title">사랑스러운 <br>반려동물과 함께</h2>
					<p class="main-image-description">건강하고 행복한 반려동물을 위한 프리미엄 용품과
						<br>서비스를 제공합니다.</p>
					<div class="main-image-buttons">
						<button class="primary-btn">SHOP</button>
						<button class="secondary-btn">COMM</button>
					</div>
				</div>
			</div>
        </div>
      </div>
    </div>
    
    

    <!-- 캐러셀 네비게이션 -->
    <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</section>
	<section class="product-section">
		<div class="product-container">
			<h2 class="product-title">멍</h2>
			<div class="product-grid">
				<div class="product-card">
					<div class="product-image">
						<img
							src="resources/메인_상품1.jpg"
							alt="">
					</div>
					<h3 class="product-card-title">상품1</h3>
					<p class="product-card-description">카테고리<br>가격</p>
				</div>
				<div class="product-card">
					<div class="product-image">
						<img
							src="resources/메인_상품2.png"
							alt="스토어">
					</div>
					<h3 class="product-card-title">상품2</h3>
					<p class="product-card-description">카테고리<br>가격</p>
				</div>
				<div class="product-card">
					<div class="product-image">
						<img
							src="resources/메인_상품3.jpg"
							alt="케어 서비스">
					</div>
					<h3 class="product-card-title">상품3</h3>
					<p class="product-card-description">카테고리<br>가격</p>
				</div>
			</div>
		</div>
	</section>
	
	<section class="product-section">
		<div class="product-container">
			<h2 class="product-title">냥</h2>
			<div class="product-grid">
				<div class="product-card">
					<div class="product-image">
						<img
							src="resources/메인_상품4.png"
							alt="커뮤니티">
					</div>
					<h3 class="product-card-title">상품4</h3>
					<p class="product-card-description">카테고리<br>가격</p>
				</div>
				<div class="product-card">
					<div class="product-image">
						<img
							src="resources/메인_상품5.png"
							alt="스토어">
					</div>
					<h3 class="product-card-title">상품5</h3>
					<p class="product-card-description">카테고리<br>가격</p>
				</div>
				<div class="product-card">
					<div class="product-image">
						<img
							src="resources/메인_상품6.jpg"
							alt="케어 서비스">
					</div>
					<h3 class="product-card-title">상품6</h3>
					<p class="product-card-description">카테고리<br>가격</p>
				</div>
			</div>
		</div>
	</section>
	
	<section class="product-section">
		<div class="product-container">
			<h2 class="product-title">서비스</h2>
			<div class="product-grid">
				
				<div class="product-card">
					<div class="product-image">
						<img
							src="https://readdy.ai/api/search-image?query=Modern pet store interior with organized shelves of pet food, toys, and accessories, clean bright lighting, professional retail environment, colorful pet products display&width=300&height=200&seq=store1&orientation=landscape"
							alt="스토어">
					</div>
					<h3 class="product-card-title">스토어</h3>
					<p class="product-card-description">반려동물을 위한 최고 품질의 사료, 용품,
						장난감을 한 곳에서 만나보세요.</p>
				</div>
				
				<div class="product-card">
					<div class="product-image">
						<img
							src="https://readdy.ai/api/search-image?query=Happy pet owners community gathering with dogs and cats, people smiling and interacting, warm social atmosphere, modern pet-friendly environment, natural lighting, welcoming community space&width=300&height=200&seq=community1&orientation=landscape"
							alt="커뮤니티">
					</div>
					<h3 class="product-card-title">커뮤니티</h3>
					<p class="product-card-description">반려동물을 키우는 가족들과 소통하고 정보를
						공유하는 따뜻한 공간입니다.</p>
				</div>
				
				<div class="product-card">
					<div class="product-image">
						<img
							src="https://readdy.ai/api/search-image?query=Professional veterinarian caring for cute puppy and kitten, modern veterinary clinic interior, gentle healthcare atmosphere, clean medical environment, caring professional service&width=300&height=200&seq=care1&orientation=landscape"
							alt="케어 서비스">
					</div>
					<h3 class="product-card-title">케어 서비스</h3>
					<p class="product-card-description">전문 수의사와 케어 전문가들이 제공하는 건강하고
						행복한 반려동물 관리 서비스입니다.</p>
				</div>
			</div>
		</div>
	</section>
	<footer class="footer">
		<div class="footer-container">
			<table border="1" style="width: 100%">
				<tr>
					<th><img alt="" src="resources/독캣배송_폰트만.png" width="150px"></th>
					<th>고객센터</th>
					<th>회사정보</th>
					<th>게시판</th>
					<th>찾아오기</th>
				</tr>
				<tr></tr>
				<tr>
					<td>Copyright © DokCatbeasong. All rights reserved.<br>내용</td>
					<td>031-000-0000<br>평일 AM 09:30 ~ PM 06:30<br>(점심시간 : PM 1:00 ~ 2:00)<br>휴무 : 토,일요일 및 공휴일<br><br>신한은행 110-000-000000<br>예금주 : 조찬양</td>
					<td>상호명 : 독캣배송
					<br>대표 : 2팀
					<br>주소 : 경기도 남양주시 화도읍 북한강로 1711-18
					<br>사업자 등록번호 : 000-00-00000
					<br>통신판매신고번호 : 0000-신고번호-0000
					<br>이메일 : info@DCShop.com</td>
					<td>Q&A<br>FAQ</td>
					<td>내용</td>
				</tr>
			</table>
			<!-- <div style="background-color:green">
				<h1>FOOTER</h1>
			</div> -->
		</div>
	</footer>
	<script src="script.js"></script>
</body>
</html>