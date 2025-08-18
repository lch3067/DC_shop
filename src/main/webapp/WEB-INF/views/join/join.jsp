<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" =content="width=device-width, initial-scale=1">
<title>main</title>

<!-- css 작성 -->
<link rel="stylesheet" href="${path}/resources/css/customer/join.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${path}/resources/js/customer/join.js" defer></script>
<script type="text/javascript"
	src="${path}/resources/js/customer/emailAuthentication.js" defer></script>

<style type="text/css">
.stepper {
	margin: 0 0 .75rem 0
}

.stepper .segments {
	display: flex;
	gap: 6px
}

.stepper .seg {
	flex: 1;
	height: 4px;
	background: #e9ecef;
	border-radius: 999px
}
/* 현재 단계만 검은색 */
.stepper.is-1 .seg:nth-child(1) {
	background: #000
}

.stepper.is-2 .seg:nth-child(2) {
	background: #000
}

.stepper.is-3 .seg:nth-child(3) {
	background: #000
}

.stepper .count {
	margin-top: 6px;
	font-size: 12px;
	color: #6b7280;
	text-align: right
}
</style>
</head>
<body>



	<div class="wrap">
		<!-- Header 시작 -->
		<!-- Header 끝 -->




		<!-- 컨텐츠 시작 -->
		<main class="container my-4 my-md-5">
			<div id="contents">
				<div class="mb-3">
					<ol class="breadcrumb mb-2">
						<li class="breadcrumb-item"><a
							style="color: black; list-style-type: none"
							href="${pageContext.request.contextPath}/">홈</a></li>
						<li class="breadcrumb-item active">회원가입</li>
					</ol>

					<div class="stepper is-2">
						<div class="segments">
							<div class="seg"></div>
							<div class="seg"></div>
							<div class="seg"></div>
						</div>
					</div>
				</div>

				<!-- 상단 중앙1 시작 -->
				<div id="section1">
					<h1 align="center">
						회원가입창
						</h2>
				</div>
				<hr style="border: 5px solid">
				<!-- 상단 중앙2 시작 -->
				<div id=section2">
					<div id="s2_inner">
						<!-- join 시작 -->
						<div class="join">
							<form name="inputform" action="joinAction.do" method="post"
								onsubmit="return singleCheck()">

								<!-- 2-1. 중복확인 버튼 안 눌렀을때 0으로 설정 -->
								<input type="hidden" name="hiddenUserid" value="0"> <input
									type="hidden" id="emailVerified" name="emailVerified" value="N">
								<input type="hidden" id="agreementdto" name="agreementdto"
									value="${agreementdto}">
								<table>
									<tr>
										<th><label for="user_id">아이디<span
												style="color: red">*</span></label></th>
										<td><input type="text" id="user_id" name="user_id"
											class="input" size="20" placeholder="공백없이 20자 이내로 작성"
											required autofocus> <input type=button name="dubChk"
											value="중복확인" style="margin-left: 10px" onclick="confirmId()">
										</td>
									</tr>
									<tr>
										<th><label for="user_password">비밀번호<span
												style="color: red">*</span></label></th>
										<td><input type="password" id="user_password"
											name="user_password" class="input" size="20"
											placeholder="공백없이 20자 이내로 작성" required autofocus></td>
									</tr>
									<tr>
										<th><label for="re_password">비밀번호(확인)<span
												style="color: red">*</span></label></th>
										<td><input type="password" id="re_password"
											name="re_password" class="input" size="20"
											placeholder="비밀번호 재입력" required autofocus></td>
									</tr>
									<tr>
										<th><label for="user_name">이름<span
												style="color: red">*</span></label></th>
										<td><input type="text" id="user_name" name="user_name"
											class="input" size="20" placeholder="이름 작성" required
											autofocus></td>
									</tr>
									<tr>
										<th><label>생년월일<span style="color: red">*</span></label></th>
										<td><input type="date" name="user_birthday" class="input"
											size="8" placeholder="-없이 생년월일 6자리 입력" required autofocus></td>
									</tr>
									<tr>
										<th rowspan="2"><label for="user_address">주소<span
												style="color: red">*</span></label></th>
										<td><input type="text" id="user_address"
											name="user_address" class="input" size="30"
											placeholder="주소를 검색하세요." required autofocus>
											<button type="button" id="addrSearchBtn"
												style="margin-left: 8px;">주소검색</button>
											<div id="addrResult"
												style="border: 1px solid #ccc; background: #fff; max-height: 200px; overflow-y: auto; display: none; position: absolute; z-index: 100;"></div>
										</td>
									</tr>
									<tr>
										<td><input type="text" id="user_deTailaddress"
											name="user_deTailaddress" class="input" size="30"
											placeholder="상세 주소 입력해주세요." required autofocus> <input
											type="text" id="user_zipCodeaddress"
											name="user_zipCodeaddress" class="input" size="30"
											placeholder="우편 번호 입력해주세요." required autofocus></td>
									</tr>
									<tr>
										<th><label for="user_hp1">휴대폰 번호<span
												style="color: red">*</span></label></th>
										<td><input type="text" id="user_hp1" name="user_hp1"
											class="input" size="3" style="width: 100px"> - <input
											type="text" id="user_hp2" name="user_hp2" class="input"
											size="4" style="width: 100px"> - <input type="text"
											id="user_hp3" name="user_hp3" class="input" size="4"
											style="width: 100px"></td>
									</tr>

									<tr>
										<th><label for="user_email1">이메일<span
												style="color: red">*</span></label></th>
										<td>
											<div class="row g-2 align-items-center">
												<div class="col-12 col-md">
													<!-- 한 줄로 붙는 input-group (좁으면 자동 줄바꿈) -->
													<div class="input-group">
														<input type="text" id="user_email1" name="user_email1"
															class="form-control" placeholder="아이디" required>
														<span class="input-group-text">@</span> <input type="text"
															id="user_email2" name="user_email2" class="form-control"
															placeholder="도메인" required> <select
															class="form-select" id="user_email3" name="user_email3"
															onchange="selectEmailChk(this)">
															<option value="">직접입력</option>
															<option value="naver.com">naver.com</option>
															<option value="gmail.com">gmail.com</option>
															<option value="daum.net">daum.net</option>
															<option value="nate.com">nate.com</option>
														</select>
													</div>
												</div>

												<div class="col-auto">
													<button type="button" id="btnSend" class="btn btn-dark"
														onclick="authnum_email()">코드 발송</button>
												</div>
											</div>

											<div id="emailMsg" class="msg"></div> <!-- 인증코드 영역 (초기 숨김) -->
											<div id="emailVerifyBox"
												class="row g-2 align-items-center mt-2 d-none">
												<label class="col-auto col-form-label" for="emailCode">인증코드</label>
												<div class="col-auto">
													<input type="text" id="emailCode" class="form-control"
														maxlength="6" inputmode="numeric" pattern="\d{6}"
														placeholder="6자리">
												</div>
												<div class="col-auto">
													<button type="button" id="btnVerify"
														class="btn btn-outline-secondary"
														onclick="verifyEmailCode()">검증</button>
												</div>
												<div class="col-auto">
													<span id="emailTimer" class="badge text-bg-secondary"></span>
												</div>
											</div> <input type="hidden" id="user_email" name="user_email">
										</td>
									</tr>


									<tr>
										<td colspan="2" style="border-botton: none"><br>
											<div align="right">
												<input class="inputButton" type="submit" value="회원가입">
												<input class="inputButton" type="reset" value="취소">
												<input class="inputButton" type="button" value="가입취소"
													onclick="window.location='main.do'">
											</div>
									</tr>
								</table>
								<input type="hidden" name="privacyAgree" value="${privacyAgree}">
								<input type="hidden" name="marketingAgree"
									value="${marketingAgree}">
							</form>
						</div>
						<!-- join 끝 -->
					</div>
				</div>
				<!-- 상단 중앙 끝 -->
			</div>
		</main>
	</div>

	<!-- 컨텐츠 끝 -->

	<!-- Footer 시작 -->
	<!-- Footer 시작 -->
	</div>
</body>
</html>