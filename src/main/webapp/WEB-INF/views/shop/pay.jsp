<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp"%>
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

:where([class^="ri-"])::before {
	content: "\f3c2";
}

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
<%-- <link rel="stylesheet" href="${path}/resources/css/shop/pay.css"> --%>

<body>
	<!-- 헤더 시작 -->
	<%@ include file="../setting/header.jsp"%>
	<!-- 헤더 끝 -->

	<section class="hero-section1"></section>

	<header>
	<div
		class="max-w-3xl mx-auto px-4 h-14 flex items-center justify-between">
		<h1 class="text-lg font-semibold">주문/결제</h1>
		<button class="text-gray-500">
			<i class="ri-close-line text-xl"></i>
		</button>
	</div>
	</header>

	<main class="max-w-3xl mx-auto px-4 py-6">
		<!-- <div class="mb-6">
			<label class="flex items-center"> <input type="checkbox"
				class="mr-2" /> <span class="text-sm">5,000원 쿠폰 적용</span>
			</label>
		</div> -->

		<section class="bg-white rounded-lg p-4 mb-6">
			<div class="flex gap-4 mb-4">
				<div class="w-20 h-20 bg-gray-100 rounded-md"></div>
				<div class="flex-1">
					<h3 class="font-medium mb-1">강아지 사료</h3>
					<p class="text-sm text-gray-500 mb-1">대형 / 1개</p>
					<p class="font-medium">30,000원</p>
				</div>
			</div>
			
			<div class="border-t pt-4">
				<div class="flex justify-between text-sm mb-2">
					<span>배송비</span> <span>3,000원</span>
				</div>
				<div class="flex justify-between font-medium">
					<span>총 결제금액</span> <span class="text-primary">33,000원</span>
				</div>
			</div>
		</section>

		<section class="bg-white rounded-lg p-4 mb-6">
			<h2 class="font-medium mb-4">배송지 정보</h2>
			<div class="space-y-4">
				<div>
					<label class="text-sm text-gray-500 block mb-1">받는 사람</label> 
					<input type="text" value="김민수" class="w-full p-3 border rounded-lg" id="u_name" />
				</div>
				<div>
					<label class="text-sm text-gray-500 block mb-1">우편번호</label> 
					<input type="text" value="04108" class="w-full p-3 border rounded-lg mb-2" id="u_zip_code"/>
					<!-- <input type="text" value="터틀프라자 1층" class="w-full p-3 border rounded-lg" /> -->
				</div>
				<div>
					<label class="text-sm text-gray-500 block mb-1">주소</label> 
					<input type="text" value="서울 마포구 백범로 23 터틀프라자 1층" class="w-full p-3 border rounded-lg mb-2" id="u_address"/>
					<!-- <input type="text" value="터틀프라자 1층" class="w-full p-3 border rounded-lg" /> -->
				</div>
				<div>
					<label class="text-sm text-gray-500 block mb-1">배송 요청사항</label> 
					<input type="text" class="w-full p-3 border rounded-lg" id="o_request"/>
				</div>
				<div>
					<label class="text-sm text-gray-500 block mb-1">연락처</label> 
					<input type="tel" value="${sessionScope.session_u_phone}" class="w-full p-3 border rounded-lg" id="u_phone"/>
				</div>
			</div>
		</section>

		<section class="bg-white rounded-lg p-4 mb-20">
			<div >
				<!-- 결제 UI -->
        		<div id="payment-method" class="w-100"></div>
			</div>
		</section>
	</main>

	<div class="max-w-3xl mx-auto">
        <div id="agreement" class="w-100 mr-2"></div>
		<button
			class="w-full bg-black text-white py-4 !rounded-button font-medium"
			id="payment-request-button">
			33,000원 결제하기</button>
	</div>
	<br><br><br>
	
	
	<!-- 푸터 시작 -->
	<%@ include file="../setting/footer.jsp"%>
	<!-- 푸터 끝 -->
	
	<script>
	main();

    async function main() {
      const button = document.getElementById("payment-request-button");
      // ------  결제위젯 초기화 ------
      const clientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
      const tossPayments = TossPayments(clientKey);
      // 회원 결제
      // 영문 대소문자, 숫자, 특수문자 -, _, =, ., @ 중 최소 1개를 포함하는 최소 2자 이상 최대 50자 이하의 문자열 => sessionid
      const customerKey = "${sessionScope.sessionid}";
      const widgets = tossPayments.widgets({
        customerKey,
      });

      // ------ 주문의 결제 금액 설정 ------
      await widgets.setAmount({
        currency: "KRW",
        value: 5000,
      });

      await Promise.all([
        // ------  결제 UI 렌더링 ------
        widgets.renderPaymentMethods({
          selector: "#payment-method",
          variantKey: "DEFAULT",
        }),
        // ------  이용약관 UI 렌더링 ------
        widgets.renderAgreement({ 
      	  selector: "#agreement", 
      	  variantKey: "AGREEMENT" 
      	}),
      ]);

	    // 구매자가 결제 UI에서 현재 선택한 결제수단을 가져옴
      // const paymentMethod = await paymentMethodWidget.getSelectedPaymentMethod();
      
      // ------  주문서의 결제 금액이 변경되었을 경우 결제 금액 업데이트 ------
      /* coupon.addEventListener("change", async function () {
        if (coupon.checked) {
          await widgets.setAmount({
            currency: "KRW",
            value: 50000 - 5000,
          });

          return;
        }

        await widgets.setAmount({
          currency: "KRW",
          value: 50000,
        });
      }); */
      
   	// 오늘 날짜 + 랜덤 숫자 8자리 생성 함수
      function generateOrderId() {
        const today = new Date();

        // 날짜 포맷: yyyyMMdd
        const yyyy = today.getFullYear();
        const mm = String(today.getMonth() + 1).padStart(2, "0");
        const dd = String(today.getDate()).padStart(2, "0");
        const dateStr = yyyy + mm + dd;

        // 랜덤 숫자 8자리
        const randomNum = String(Math.floor(Math.random() * 1e8)).padStart(8, "0");
        
        const orderId = dateStr + randomNum;

        return orderId;
      }
      
      // 입력받은 회원의 휴대폰번호 - 없애기
      const u_phone = document.getElementById("u_phone").value;
      const o_phone = u_phone.replace(/-/g, "");
      
      
      // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
      button.addEventListener("click", async function () {
      	const orderId = generateOrderId();
      	
      	const orderInfo = {
      		o_name : document.getElementById("u_name").value,
      		o_phone : document.getElementById("u_phone").value,
      		o_address : document.getElementById("u_address").value,
      		o_zip_code : document.getElementById("u_zip_code").value,
      		o_request: document.getElementById("o_request").value,
      		
      		orderList : [{pd_id: 1, o_price: 1000, o_count:2},
      					 {pd_id: 2, o_price: 1500, o_count:2},
      					 {pd_id: 3, o_price: 2000, o_count:1}]
          };
      	
			await widgets.requestPayment({
				orderId: orderId,		// 영문 대소문자, 숫자, 특수문자 -, _, =로 이루어진 6자 이상 64자 이하의 문자열
				orderName: "강아지 사료",		// 구매 상품. 예) 생수 외 1건 같은 형식. 최대 길이 100자
				successUrl: window.location.origin + "${path}/pay_success?orderInfo=" + encodeURIComponent(JSON.stringify(orderInfo)),
				failUrl: window.location.origin + "${path}/pay_fail",
				customerEmail: "${sessionScope.session_u_email}",		// 구매자 이매일. 최대 길이 100자
				customerName: document.getElementById("u_name").value,					// 구매자명. 최대 길이 100자
				customerMobilePhone: o_phone,			// 구매자 휴대폰 번호. 가상계좌, 퀵계좌이체 휴대폰 자동 완성에 사용됨. -없이 숫자로만 구성된 8~15자의 문자열
			});
      });
    }
    </script>
</body>
</html>