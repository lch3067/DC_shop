/**
 * 
 */
 
var CTX = window.CTX

// 아이디 중복확인 버튼 클릭시
// 1. 아이디 중복확인 페이지 open
function confirmId() {
	const userId = document.getElementById('u_id');
	if (!userId) {
		alert("아이디를 입력하세요.");
		document.inputform.u_id.focus();
		return false;
	}
	//중복확인 버튼 클릭시 컨트롤러 url을 전달, 컨트롤러에 소스 추가
	let url = CTX + "/idConfirmAction.do?u_id=" + document.inputform.u_id.value;
	window.open(url, "confirm", "menubar=no, width=500, height=400");
}

function confirmNickName() {
	const userNickName = document.getElementById('u_nickname');
	if (!userNickName) {
		alert("닉네임을 입력하세요.");
		document.inputform.u_id.focus();
		return false;
	}
	//중복확인 버튼 클릭시 컨트롤러 url을 전달, 컨트롤러에 소스 추가
	let url = CTX + "/nickNameConfirmAction.do?u_nickname=" + document.inputform.u_nickname.value;
	window.open(url, "confirm", "menubar=no, width=500, height=400");
}

function setUserId(userid) {

	opener.document.inputform.u_id.value = userid;
	opener.document.inputform.hiddenUserid.value = "1";
	self.close();

}

function setUserNickName(userNickName) {

	opener.document.inputform.u_nickname.value = userNickName;
	opener.document.inputform.hiddenUserNickName.value = "1";
	self.close();

}


// 회원가입, 수정시의 이메일
function selectEmailChk(selectElem) {

	const email2 = document.getElementById('u_mail2');
	const value = selectElem.value;
	if (value === '0') {
		email2.value = '';
		email2.focus();
	} else {
		email2.value = value;
	}

}

// 2. join.jsp - onSubmit시 - 회원가입페이지 필수 체크


function copyFormData(srcForm, dstForm){
    const fd = new FormData(srcForm);
    for (const [k, v] of fd.entries()) {
      const input = document.createElement('input');
      input.type = 'hidden';
      input.name = k;
      input.value = v;
      dstForm.appendChild(input);
    }
}


// onSubmit(제출)
function singleCheck(e) {
	/* 2-1. 중복확인 버튼 안 눌렀을때 0으로 설정
		<input type="hidden" name="hiddenUserid" value="0">
		hiddenUserid : 중복확인 버튼 안눌렀을때 체크(0: 클릭안함, 1:클릭함)
	*/

	/* 2-2. 중복확인 버튼 클릭하지 않는 경우 "중복확인 해주세요.!!" 메시지 띄운다.*/
	if (document.inputform.hiddenUserid.value == "0") {
		alert("중복확인 해주세요.!!");
		document.inputform.u_id.focus();
		return false;
	}

	// 비밀번호 불일치 => 과제
	if (document.inputform.u_password.value != document.inputform.re_password.value) {
		alert("비밀번호가 불이치합니다.");
		return false;
	}

	//if(document.inputform.emailVerified.value == "N") {                   
		//alert("이메일 인증을 해주세요");
		//return false;
	//}
	
}


// 팝업에서 선택을 넘겨줄 때 호출될 콜백
  function onJoinChoice(nextPath){           // nextPath: 'joinAction.do' | 'insertPet.do'
    const f = document.forms['inputform'];
    if(!f){ alert('폼을 찾을 수 없습니다.'); return; }
    f.method = 'post';
    f.action = CTX + '/' + nextPath;        // CTX는 setting.jsp 등에서 컨텍스트 루트
    f.submit();                              // onsubmit 재호출 안됨 → 무한루프 없음
  }

  // postMessage 폴백(선택 사항): 혹시 opener 직접호출이 막힌 경우 대비
  window.addEventListener('message', function(ev){
    if (ev.origin !== window.location.origin) return;       // 동일 오리진만 허용(보안)
    if (ev.data && ev.data.type === 'JOIN_FLOW_DECIDE') {
      onJoinChoice(ev.data.target);                          // target에 'joinAction.do' 등
    }
  });

// 주소 API
$(function() {
  // 실시간 검색
  $('#u_address').on('keyup', function(e) {
    var keyword = $(this).val().trim();
    if (keyword.length < 2) {
      $('#addrResult').hide();
      return;
    }
    $.ajax({
      url: "https://business.juso.go.kr/addrlink/addrLinkApiJsonp.do",
      type: "GET",
      data: {
        keyword: keyword,
        confmKey: "devU01TX0FVVEgyMDI1MDczMDEyMzQyNDExNjAwMzc=", // 본인 인증키
        resultType: "json"
      },
      dataType: "jsonp",
      success: function(data) {
        var html = '';
        if(data.results && data.results.juso && data.results.juso.length > 0) {
          data.results.juso.forEach(function(addr) {
            html += '<div class="addr-item" '
                  + 'data-road="' + addr.roadAddr + '" '
                  + 'data-zip="' + addr.zipNo + '" '
                  + 'style="padding:5px;cursor:pointer;">'
                  + addr.roadAddr + ' <span style="color:#888">[' + addr.zipNo + ']</span>'
                  + '</div>';
          });
          $('#addrResult').html(html).show();
        } else {
          $('#addrResult').html('<div style="padding:5px;">검색 결과 없음</div>').show();
        }
      }
    });
  });

  // 결과 클릭 시: 주소와 우편번호 분리 입력
  $(document).on('click', '.addr-item', function() {
    var roadAddr = $(this).data('road');
    var zipNo = $(this).data('zip');
    $('#u_address').val(roadAddr);
    $('#u_zip_code').val(zipNo);
    $('#addrResult').hide();
  });

  // 외부 클릭시 검색 결과 닫기
  $(document).mouseup(function(e) {
    var layer = $('#addrResult');
    if (!layer.is(e.target) && layer.has(e.target).length === 0) {
      layer.hide();
    }
  });

  // "주소검색" 버튼 클릭 시도 동일하게 처리
  $('#addrSearchBtn').on('click', function() {
    $('#u_address').trigger('keyup');
    $('#u_address').focus();
  });
});

// =========================
// 반려동물 다중등록 UI 
// =========================
(function () {
  var notice  = document.getElementById('multiPetNotice');
  var chips   = document.getElementById('petChips');
  var addBtn  = document.getElementById('addAnotherBtn');
  var skipBtn = document.getElementById('skipBtn');

  // insert.jsp가 아니면 스킵
  if (!chips || !addBtn) { return; }

  function chipCount() {
    return chips ? chips.getElementsByClassName('chip').length : 0;
  }

  function updateNotice() {
    if (!notice) return;
    notice.style.display = chipCount() > 0 ? 'block' : 'none';
  }

  function addChip(label, payload) {
    var div = document.createElement('div');
    div.className = 'chip';
    var name = (payload && payload.name) ? payload.name : '';
    var type = (payload && payload.type) ? payload.type : '';
    var kg   = (payload && payload.kg)   ? payload.kg   : '';
    var size = (payload && payload.size) ? payload.size : '';

    div.innerHTML =
      '<span class="chip-label">' + (label || '') + '</span>' +
      '<button type="button" class="chip-del" aria-label="삭제">×</button>' +
      '<input type="hidden" name="pet_name[]" value="' + name + '">' +
      '<input type="hidden" name="pet_type[]" value="' + type + '">' +
      '<input type="hidden" name="pet_kg[]" value="' + kg + '">' +
      '<input type="hidden" name="pet_size[]" value="' + size + '">';

    chips.appendChild(div);

    var del = div.getElementsByClassName('chip-del')[0];
    if (del) {
      del.addEventListener('click', function () {
        if (div.parentNode) div.parentNode.removeChild(div);
        updateNotice();
      });
    }
    updateNotice();
  }

  // “+ 추가 등록” → 현재 입력값을 칩으로 묶어 아래에 추가
  addBtn.addEventListener('click', function () {
    var nameEl = document.getElementById('pet_name');
    var name   = nameEl ? nameEl.value : '';

    var type = '';
    try {
      var typeEl = document.querySelector('input[name="pet_type"]:checked');
      if (typeEl) type = typeEl.value;
    } catch (e) { /* querySelector 미지원 브라우저 대비 */ }

    var kgEl   = document.getElementById('pet_kg');
    var kg     = kgEl ? kgEl.value : '';

    var sizeEl = document.getElementById('pet_size');
    var size   = sizeEl ? sizeEl.value : '';

    if (!name) {
      alert('반려동물 이름을 입력해 주세요.');
      if (nameEl) nameEl.focus();
      return;
    }

    addChip(name + (type ? ' (' + type + ')' : ''), { name: name, type: type, kg: kg, size: size });

    // 필요 시 입력 초기화
    // if (nameEl) nameEl.value = '';
  });

  // “건너뛰기” → 반려동물 없이 진행 플래그 추가 후 제출
  if (skipBtn) {
    skipBtn.addEventListener('click', function () {
      if (chipCount() > 0) {
        if (!confirm('이미 추가된 반려동물이 있습니다. 반려동물 없이 가입을 진행할까요?')) return;
      }

      // closest 폴리필
      var form = null;
      if (skipBtn.closest) {
        form = skipBtn.closest('form');
      } else {
        var p = skipBtn.parentNode;
        while (p && p.nodeName !== 'FORM') p = p.parentNode;
        form = p;
      }

      if (form) {
        var skip = document.createElement('input');
        skip.type = 'hidden';
        skip.name = 'skipPets';
        skip.value = 'Y';
        form.appendChild(skip);
        form.submit();
      }
    });
  }

  // 초기 상태 반영
  updateNotice();
})();
