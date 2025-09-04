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
<style type="text/css">
.hero-section1 {
	width: 100%;
	background: white;
	padding: .5rem 0;
	padding-top: 5rem;
}
#payment-button1 {
	background-color: black; 
}

:where([class^="ri-"])::before { content: "\f3c2"; }
input[type="checkbox"] {
    appearance: none;
    width: 20px;
    height: 20px;
    border: 2px solid #ddd;
    border-radius: 4px;
    margin-right: 8px;
    position: relative;
    cursor: pointer;
}
input[type="checkbox"]:checked {
    background-color: #0066FF;
    border-color: #0066FF;
}
input[type="checkbox"]:checked::after {
    content: "";
    position: absolute;
    left: 6px;
    top: 2px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 2px 2px 0;
    transform: rotate(45deg);
}

</style>
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
<script src="https://js.tosspayments.com/v2/standard"></script>
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
	
	<div
        class="max-w-3xl mx-auto px-4 h-14 flex items-center justify-between"
      >
        <h1 class="text-lg font-semibold">주문/결제</h1>
        <button class="text-gray-500">
          <i class="ri-close-line text-xl"></i>
        </button>
      </div>
    </header>

    <main class="max-w-3xl mx-auto px-4 py-6">
      <div class="mb-6">
        <label class="flex items-center">
          <input type="checkbox" class="mr-2" />
          <span class="text-sm">5,000원 쿠폰 적용</span>
        </label>
      </div>

      <section class="bg-white rounded-lg p-4 mb-6">
        <div class="flex gap-4 mb-4">
          <div class="w-20 h-20 bg-gray-100 rounded-md"></div>
          <div class="flex-1">
            <h3 class="font-medium mb-1">프리미엄 무선 이어폰</h3>
            <p class="text-sm text-gray-500 mb-1">블랙 / 1개</p>
            <p class="font-medium">89,000원</p>
          </div>
        </div>
        <div class="border-t pt-4">
          <div class="flex justify-between text-sm mb-2">
            <span>배송비</span>
            <span>3,000원</span>
          </div>
          <div class="flex justify-between font-medium">
            <span>총 결제금액</span>
            <span class="text-primary">92,000원</span>
          </div>
        </div>
      </section>

      <section class="bg-white rounded-lg p-4 mb-6">
        <h2 class="font-medium mb-4">배송지 정보</h2>
        <div class="space-y-4">
          <div>
            <label class="text-sm text-gray-500 block mb-1">받는 사람</label>
            <input
              type="text"
              value="김민수"
              class="w-full p-3 border rounded-lg"
              readonly
            />
          </div>
          <div>
            <label class="text-sm text-gray-500 block mb-1">주소</label>
            <input
              type="text"
              value="서울특별시 강남구 테헤란로 152"
              class="w-full p-3 border rounded-lg mb-2"
              readonly
            />
            <input
              type="text"
              value="상세주소"
              class="w-full p-3 border rounded-lg"
              readonly
            />
          </div>
          <div>
            <label class="text-sm text-gray-500 block mb-1">연락처</label>
            <input
              type="tel"
              value="010-1234-5678"
              class="w-full p-3 border rounded-lg"
              readonly
            />
          </div>
        </div>
      </section>

      <section class="bg-white rounded-lg p-4 mb-20">
        <h2 class="font-medium mb-4">결제 방법</h2>
        <div class="grid grid-cols-2 gap-3">
          <button
            class="border rounded-lg p-4 flex items-center justify-center gap-2 !rounded-button"
          >
            <i class="ri-bank-card-line"></i>
            <span>계좌이체</span>
          </button>
          <button
            class="border rounded-lg p-4 flex items-center justify-center gap-2 !rounded-button"
          >
            <i class="ri-bank-card-line"></i>
            <span>신용카드</span>
          </button>
          <button
            class="border rounded-lg p-4 flex items-center justify-center gap-2 !rounded-button"
          >
            <i class="ri-kakao-talk-fill"></i>
            <span>카카오페이</span>
          </button>
          <button
            class="border rounded-lg p-4 flex items-center justify-center gap-2 !rounded-button"
          >
            <i class="ri-navigation-fill"></i>
            <span>네이버페이</span>
          </button>
        </div>
        <p class="text-xs text-gray-500 mt-4">
          신용카드 최대 5개월 무이자 할부
        </p>
      </section>
    </main>
	
	<div class="max-w-3xl mx-auto">
        <label class="flex items-center mb-4">
          <input type="checkbox" class="mr-2" />
          <span class="text-sm"
            >[필수] 결제 서비스 이용약관 개인정보 처리 동의</span
          >
        </label>
        <button
          class="w-full bg-black text-white py-4 !rounded-button font-medium"
        >
          92,000원 결제하기
        </button>
      </div>
	<script id="payment-handler">
      document.addEventListener("DOMContentLoaded", function () {
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        checkboxes.forEach((checkbox) => {
          checkbox.addEventListener("change", function () {
            if (this.checked) {
              this.classList.add("checked");
            } else {
              this.classList.remove("checked");
            }
          });
        });
      });
    </script>
	<!-- 푸터 시작 -->
	<%@ include file="../setting/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>