<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>다음 단계 선택</title>
<style>
body {
	font-family: system-ui, Segoe UI, Roboto, 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 24px;
	background: #fafafa;
	color: #374151
}

.wrap {
	max-width: 760px;
	margin: 0 auto
}

h1 {
	font-size: 20px;
	margin: 0 0 12px
}

p {
	margin: 0 0 20px;
	color: #6b7280
}

.grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 16px
}

.card {
	background: #fff;
	border: 1px solid #e5e7eb;
	border-radius: 16px;
	padding: 20px
}

.btn {
	display: inline-block;
	padding: 12px 16px;
	border-radius: 12px;
	border: 1px solid #d1d5db;
	background: #fff;
	cursor: pointer
}

.btn.primary {
	background: #111827;
	color: #fff;
	border-color: #111827
}
</style>
<script type="text/javascript"
	src="${path}/resources/js/customer/join.js" defer></script>
</head>
<body>
	<div class="wrap">
		<h1>다음 단계로 진행하세요</h1>
		<p>
			입력하신 정보로 계속 <strong>회원가입</strong>을 완료하거나, 먼저 <strong>펫 등록</strong>을
			진행할 수 있습니다.
		</p>

		<div class="grid">
			<!-- 회원가입 계속 -->
			<div class="card">
				<h2 style="margin-top: 0">회원가입 계속</h2>
				<button type="button" onclick="setGoNext('joinAction.do')"
					class="btn primary">회원가입 완료하기</button>
			</div>

			<!-- 펫 등록으로 이동 -->
			<div class="card">
				<h2 style="margin-top: 0">펫 등록으로 이동</h2>
				<button type="button" onclick="setGoNext('insertPet.do')"
					class="btn">펫 등록 시작</button>
			</div>
		</div>

		<script>
			function setGoNext(nextPath) {
				try {
					if (window.opener && !window.opener.closed) {
						// 1) 가장 단순: 원창 콜백 함수 직접 호출
						if (typeof window.opener.onJoinChoice === 'function') {
							window.opener.onJoinChoice(nextPath); // 'joinAction.do' / 'insertPet.do'
						} else {
							// 2) 폴백: postMessage로 전달(원창에서 message 리스너가 받음)
							window.opener.postMessage({
								type : 'JOIN_FLOW_DECIDE',
								target : nextPath
							}, window.location.origin);
						}
					} else {
						alert('원래 창을 찾을 수 없습니다.');
					}
				} finally {
					self.close(); // 선택 후 팝업 닫기
				}
			}
		</script>
	</div>
</body>
</html>
