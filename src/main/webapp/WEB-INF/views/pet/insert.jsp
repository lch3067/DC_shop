<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>반려동물 등록</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/pet/join.css"><!-- pet 전용 -->

<!-- js -->
<script src="https://kit.fontawesome.com/11defe47b4.js" crossorigin="anonymous"></script>
<script src="${path}/resources/js/common/main.js" defer></script>

<script type="text/javascript">
	
	function get_dog() {
		
		$("#selectBox").empty();
		
        $("#selectBox").append("<option value='말티즈'>말티즈</option>");
        $("#selectBox").append("<option value='포메라니안'>포메라니안</option>");
        $("#selectBox").append("<option value='푸들'>푸들</option>");
        $("#selectBox").append("<option value='진돗개'>진돗개</option>");
        $("#selectBox").append("<option value='리트리버'>리트리버</option>");
        $("#selectBox").append("<option value='보더콜리'>보더콜리</option>");
        $("#selectBox").append("<option value='웰시코기'>웰시코기</option>");
        $("#selectBox").append("<option value='치와와'>치와와</option>");
        $("#selectBox").append("<option value='시츄'>시츄</option>");
        $("#selectBox").append("<option value='시바견'>시바견</option>");
        $("#selectBox").append("<option value='비글'>비글</option>");
        $("#selectBox").append("<option value='기타'>기타</option>");
        
	}
	function get_cat() {
		
		$("#selectBox").empty();
		
		$("#selectBox").append("<option value='코숏'>코숏</option>");
        $("#selectBox").append("<option value='먼치킨'>먼치킨</option>");
        $("#selectBox").append("<option value='샴'>샴</option>");
        $("#selectBox").append("<option value='러시안블루'>러시안블루</option>");
        $("#selectBox").append("<option value='메인쿤'>메인쿤</option>");
        $("#selectBox").append("<option value='스핑크스'>스핑크스</option>");
        $("#selectBox").append("<option value='페르시안'>페르시안</option>");
        $("#selectBox").append("<option value='터키시앙고라'>터키시앙고라</option>");
        $("#selectBox").append("<option value='코리안쇼트헤어'>코리안쇼트헤어</option>");
        $("#selectBox").append("<option value='아비시니안'>아비시니안</option>");
        $("#selectBox").append("<option value='뱅갈'>뱅갈</option>");
        $("#selectBox").append("<option value='기타'>기타</option>");
        
	}
</script>

</head>
<body>

<div class="wrap">

  <!-- 컨텐츠 시작 -->
  <div id="container">
    <div id="contents">
      <!-- 상단 중앙1 시작 -->
      <div id="section1">
        <h1 align="center">반려동물 등록</h1>
      </div>

      <!-- 상단 중앙2 시작 -->
      <div id="section2">
        <div id="s2_inner">
          <div class="join">
            <form action="insertAction.do" method="post">
              <table>
                <tr>
                  <th>* 펫 이름</th>
                  <td><input type="text" name="pet_name" class="input" placeholder="이름 작성" required></td>
                </tr>

                <tr>
                  <th>* 생일</th>
                  <td><input type="date" name="pet_birthday" class="input" required></td>
                </tr>

				<tr>
				  <th>* 반려동물 종류</th>
				  <td colspan="2">
				    <div class="radio-compact">
				      <label><input type="radio" name="pet_type" value="강아지" onclick="get_dog()"> 강아지</label>
				      <label><input type="radio" name="pet_type" value="고양이" onclick="get_cat()"> 고양이</label>
				    </div>
				  </td>
				</tr>
				
				<tr>
					<th>상세품종</th>
					<td colspan="2" width="300px">
					<select id="selectBox" name="pet_kind">
						<option value=''>반려동물 종류를 선택해주세요.</option>
			  		</select>
					</td>
				</tr>

                <tr>
                  <th>* 성별</th>
                  <td>
                    <select name="pet_gender" class="input" required>
                      <option value="">-- 선택하세요 --</option>
                      <option value="M">수컷</option>
                      <option value="F">암컷</option>
                    </select>
                  </td>
                </tr>
                
                <tr>
				  <th>중성화 여부</th>
				  <td colspan="2">
				    <div class="radio-compact">
				      <label><input type="radio" name="pet_neutered" value="Y"> Y(네)</label>
				      <label><input type="radio" name="pet_neutered" value="N" checked> N(아니오)</label>
				    </div>
				  </td>
				</tr>
                

                <tr>
                  <th>* 몸무게(kg)</th>
                  <td>
                    <div style="display:flex; gap:10px; align-items:center;">
                      <input type="number" id="pet_kg" name="pet_kg" class="input" step="0.1" min="0"
                             placeholder="예) 7.5" required oninput="updateSize()">
                      <span id="sizeText" class="sizeText" style="min-width:80px;">체급: -</span>
                    </div>
                    <input type="hidden" id="pet_size" name="pet_size"><!-- 서버 전송용 -->
                  </td>
                </tr>

                <tr>
                  <td colspan="2" style="border-bottom:none">
                    <br>
                    <div align="right">
                      <input type="hidden" name="user_id" value="admin">
                      
                      <button type="button" class="inputButton" id="addAnotherBtn">+ 추가 등록</button>
                      
                      <input class="inputButton" type="submit" value="등록">
                      <input class="inputButton" type="reset" value="초기화">
                      <input class="inputButton" type="button" value="취소" onclick="history.back()">
                    </div>
                  </td>
                </tr>
              </table>
            </form>
          </div><!-- .join -->
        </div>
      </div>
      <!-- 상단 중앙2 끝 -->
    </div>
  </div>
  <!-- 컨텐츠 끝 -->
</div>

<script>
  const size = {
    "강아지":[{max:5,label:"소형"},{max:15,label:"중형"},{max:Infinity,label:"대형"}],
    "고양이":[{max:4,label:"소형"},{max:6,label:"중형"},{max:Infinity,label:"대형"}]
  };

  function getSelectedType(){
    const r = document.querySelector('input[name="pet_type"]:checked');
    return r ? r.value : "강아지";
  }

  function updateSize(){
    const type = getSelectedType();  
    const kg   = parseFloat(document.getElementById("pet_kg").value);
    const sizeTextEl = document.getElementById("sizeText");
    const sizeHidden = document.getElementById("pet_size");

    if (isNaN(kg) || kg <= 0){
      sizeTextEl.textContent = "체급: -";
      sizeHidden.value = "";
      return;
    }
    const bucket = (size[type] || size["강아지"]).find(r => kg <= r.max);
    sizeTextEl.textContent = "체급: " + bucket.label;
    sizeHidden.value = bucket.label;
  }

  document.addEventListener("DOMContentLoaded", ()=>{
    updateSize();
    document.getElementById("pet_kg").addEventListener("input", updateSize);
    document.querySelectorAll('input[name="pet_type"]').forEach(r=>{
      r.addEventListener("change", updateSize);
    });
  });
</script>

</body>
</html>
