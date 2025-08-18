/**
 * 
 */
 
var CTX = window.CTX

 
 // 이메일 인증

var emailTimerId = null, emailMsgHideId = null;

function showMsg(text, type, hideAfterMs){
	clearTimeout(emailMsgHideId);
	var $m = $('#emailMsg').removeClass('ok err').addClass(type === 'ok' ? 'ok' : 'err');
	$m.text(text).fadeIn(120);
	if(hideAfterMs && hideAfterMs > 0){
	  emailMsgHideId = setTimeout(function(){ $m.fadeOut(150); }, hideAfterMs);
	}
}

function formatSec(s){
  var m = Math.floor(s/60), ss = String(s%60).padStart(2,'0');
  return m + ':' + ss;
}

function onExpire(){
    $('#emailTimer').text('만료됨').removeClass('muted');
    // 인증코드/버튼 숨김
    $('#emailCode').val('');
    $('#btnVerify').prop('disabled', true).addClass('hidden');
    $('#emailCode').addClass('hidden');
    showMsg('인증코드가 만료되었습니다. 다시 발송해 주세요.', 'err', 3000);
}

function startEmailTimer(ttlSec){
    clearInterval(emailTimerId);
    var left = parseInt(ttlSec, 10);
    // 영역 보이기 및 요소 초기화
    $('#emailVerifyBox').removeClass('hidden');
    $('#btnVerify').prop('disabled', false).removeClass('hidden');
    $('#emailCode').prop('disabled', false).removeClass('hidden').focus();
    $('#emailTimer').addClass('muted');

    if(isNaN(left) || left <= 0){ onExpire(); return; }
    $('#emailTimer').text(formatSec(left));

    emailTimerId = setInterval(function(){
        left--;
        if(left <= 0){ clearInterval(emailTimerId); onExpire(); return; }
        $('#emailTimer').text(formatSec(left));
    }, 1000);
}

// 코드 발송
function authnum_email(){

	if(!$('#user_email1').val()) {
		alert("이메일을 입력해주세요.");
		 $('#user_email1').focus();
		return false;
	}
	
	if(!$('#user_email2').val()) {
		alert("목록을 선택해주세요.");
		 $('#user_email2').focus();
		return false;
	}

	var to = $('#user_email1').val().trim() + "@" + $('#user_email2').val();
	console.log(to);
	if(!to || !to.includes('@')){ showMsg('올바른 이메일을 입력하세요.', 'err', 2500); $('#to').focus(); return; }

	$('#btnSend').prop('disabled', true);
	$.ajax({
		    url : CTX + '/sendCode.do',  // 필요 시 POST로 변경 권장
		    type: 'POST',
		    data: { to : to },
		    dataType: 'json',
		    cache: false
		})
		.done(function(res){
			console.log('sendCode res =', res);
		    if(res && res.ok){
			    showMsg('인증코드가 전송되었습니다. 입력 후 검증을 눌러주세요.', 'ok', 3000); // 3초 뒤 사라짐
			    var ttl = Number(res.ttlSec) || 180;
			    startEmailTimer(ttl);
			}else{
			    showMsg('발송 실패 또는 만료되었습니다.', 'err', 3000);
		    }
		})
		.fail(function(xhr){
		    showMsg('에러: ' + xhr.status, 'err', 3000);
		})
		.always(function(){ $('#btnSend').prop('disabled', false); });
	}




// 검증
function verifyEmailCode(){
	var code = $('#emailCode').val().trim();
	if(!/^[0-9]{6}$/.test(code)){
	    showMsg('6자리 숫자만 입력하세요.', 'err', 2000); 
	    $('#emailCode').focus(); return; }
	
	    $('#btnVerify').prop('disabled', true);
	    $.ajax({
	        url : CTX + '/verify.do',   // 현재 GET으로 설계되어 있으면 그대로
	        type: 'POST',
	        data: { code: code },
	        dataType: 'json',
	        cache: false                // ✅ jQuery 캐시 방지
	    })
	    .done(function(res){
	        if(res && res.ok){
		        $('#emailVerified').val('Y');
		        clearInterval(emailTimerId);
		        $('#emailTimer').text('인증 완료');
		        showMsg('인증이 완료되었습니다.', 'ok', 2000);
		        $('#btnVerify').addClass('hidden');
		        $('#emailCode').addClass('hidden').prop('disabled', true);
	        }else{
		        showMsg('인증 실패. 코드를 확인하세요.', 'err', 2500);
		        $('#btnVerify').prop('disabled', false);
		        $('#emailCode').focus().select();
		        $('#emailVerified').val('N');
	        }
	    })
	    .fail(function(xhr){
	        showMsg('검증 에러: ' + xhr.status, 'err', 3000);
	        $('#btnVerify').prop('disabled', false);
    	});
	}

 