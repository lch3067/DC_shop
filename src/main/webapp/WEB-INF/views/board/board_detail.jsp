<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>board_detail</title>

<link rel="stylesheet" href="${path}/resources/css/board.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#recommendBtn").click(function() {
		    var btn = $("#recommendBtn");
		    var b_num = btn.data("bnum");
		    
		    if (!btn.hasClass("active")) {
		        // 추천 추가
		        $.ajax({
		            url: "${path}/recommend",
		            type: "POST",
		            data: { b_num: b_num, click: 1 },
		            success: function(result) {
		                if (parseInt(result.success) === 1) {
		                    btn.addClass("active"); // 이미지 교체
			                $("#recommendTotal").text(result.b_recommend); 
		                }
		            },
		            error: function() {
		                alert("추천 처리 중 오류가 발생했습니다.");
		            }
		        });
		    } else {
		        // 추천 취소
		        $.ajax({
		            url: "${path}/recommend",
		            type: "POST",
		            data: { b_num: b_num, click: 0 },
		            success: function(result) {
		                if (parseInt(result.success) === 1) {
		                    btn.removeClass("active"); // 이미지 원복
		                    $("#recommendTotal").text(result.b_recommend); 
		                }
		            },
		            error: function() {
		                alert("추천 취소 중 오류가 발생했습니다.");
		            }
		        });
		    }
		});
	});
	
	// 댓글 등록
	$(function(){
		comment_list();
		
		$('#btnCommentSave').click(function(){
			comment_add();
		});
		
		$('#btnCommentLogin').click(function(){
			comment_login();
		});
	});
	function comment_login(){
		if(confirm('로그인이 필요합니다.')){
			location.href="${path}/login_main.do";
		}
	}
	
	function comment_add(){
		
		const content = ($('#c_content').val() || '').trim();
		if(content.length === 0){
			alert('내용을 입력해주세요.')
			$('#c_content').focus();
			return;
		}
		
		let param = {
			b_num : "${board.b_num}",
			"c_content" : content
		};
		
		$.ajax({
			url: '${path}/comment_insert',
			type:'POST',
			data: param,
			success:function(){
				$('#c_content').val("");
				comment_list();
			},
			error : function(){
				alert('comment_add() 오류');
			}
		});
	}	
	function comment_list(){
		$.ajax({
			url: '${path}/comment_list',
			type:'POST',
			data: {b_num : ${board.b_num}},
			success:function(result){
				$('#comment_list').html(result);
			},
			error : function(){
				alert('comment_list() 오류');
			}
		});
	}
	
	// 댓글 수정
	function getBnumFromQuery(){
	  return new URLSearchParams(location.search).get('b_num');
	}
	// 댓글 수정 시작 (동적 목록: 위임 바인딩)
	$(document).on('click', '.btnCommentEdit', function(){
	  const cnum = $(this).val();
	  const trDate = $(this).closest('tr');     // 날짜/버튼 행
	  const trContent = trDate.prev();          // 바로 위가 내용 행
	  const tdContent = trContent.find('td:first');

	  // 이미 편집중이면 무시
	  if (tdContent.data('editing')) return;

	  const oldText = $.trim(tdContent.text());
	  tdContent.data('editing', true).data('old', oldText);

	  // textarea + 저장/취소 버튼 UI
	  const editor =
	    '<div class="edit-area">'+
	      '<textarea class="edit-text" style="width:95%;height:80px;">'+$('<div>').text(oldText).html()+'</textarea>'+
	      '<div style="margin-top:8px;text-align:right;">' +
	        '<button type="button" class="inputButton btnEditSave" value="'+cnum+'">저장</button> ' +
	        '<button type="button" class="inputButton btnEditCancel">취소</button>' +
	      '</div>' +
	    '</div>';

	  tdContent.data('origHtml', tdContent.html()); // 원래 HTML 백업
	  tdContent.html(editor);
	});
	
	$(document).on('click', '.btnEditCancel', function(){
		  const tdContent = $(this).closest('td');
		  tdContent.html(tdContent.data('origHtml'));
		  tdContent.removeData('editing').removeData('old').removeData('origHtml');
		});
	
	$(document).on('click', '.btnEditSave', function(){
		  const cnum = $(this).val();
		  const tdContent = $(this).closest('td');
		  const newText = tdContent.find('.edit-text').val();
		  const bnum = getBnumFromQuery();

		  $.ajax({
		    url: '${path}/comment_update',
		    type: 'POST',
		    data: { c_num: cnum, c_content: newText, b_num: bnum }, // b_num은 성공 후 재조회용
		    success: function(){
		      comment_list(); // 목록 즉시 갱신
		    },
		    error: function(xhr){
		      console.error('comment_update error', xhr.status, xhr.responseText);
		      alert('comment_update() 오류');
		    }
		  });
		});
	
	
	
	// 댓글 삭제
	$(document).on('click', '.btnCommentDelete', function () {
	  var cnum = $(this).val();          // data-* 안 쓰고 value로 받음
	  var bnum = new URLSearchParams(location.search).get('b_num'); // URL에서 b_num
	
	  if (!confirm('이 댓글을 삭제할까요?')) return;
	
	  $.ajax({
	    url: '${path}/comment_delete',
	    type: 'POST',
	    data: { c_num: cnum, b_num: bnum }, // b_num은 댓글 수 갱신용(선택)
	    success: function () {
	      comment_list(); // 삭제 후 즉시 새로고침
	    },
	    error: function (xhr) {
	      console.error('comment_delete error', xhr.status, xhr.responseText);
	      alert('comment_delete() 오류');
	    }
	  });
	});
	
</script>
</head>
<body>

	<div class="wrap">
		<!-- 헤더 부분 -->
		<%@ include file="/WEB-INF/views/setting/header.jsp" %>
		
		<section class="hero-section1">
		<!-- <div class="hero-container">
			<div class="hero-content">
				<h1 class="hero-title">랜딩 페이지 제목</h1>
				<p class="hero-description">실용성 있는 디자인과 직관적이며 대담한 추상적 조합으로, 사용하기
					자연스럽고 유용한 소프트웨어를 초점에 맞춘다.</p>
				<button class="hero-btn">더보기</button>
			</div>
		</div> -->
		</section>
		<!-- 컨텐츠 부분 -->
		<div id="container">
			<div id="contents">
				<div class="titleArea">
					<h1 align="center"> 상세페이지 </h1>
				</div>
				
				<c:set var="user" value="${board.userDTO[0]}"/>
				<div>
					<div class="table_div">
						<form name="insertForm" method="post">
							<table>
								<tr>
									<td align="left">
										<div style="font-size: 25px">[${board.b_category}] ${board.b_title}</div> 
										<div style="font-size: 15px" align="right">작성자 : ${user.u_nickname}</div>
									</td>
								</tr>
								<tr>
									<th align="left">
										<div class="inline">
											<img src="/DCShop/resources/image/board/추천_total.png">
										 	<span  id="recommendTotal"> ${board.b_recommend} </span> 
										 </div> 
										<div class="inline"> 조회 ${board.b_views} </div>
									</th>
								</tr>
								<tr>
									<td> 
										<div style="min-height: 700px" align="left">
											${board.b_contents} 
											<img src="${board.b_image}">
										</div>
										<div align="right" style="height: 20px">
											<div style="font-size: 15px"> 등록일 : ${board.b_dateposted} </div> 
											<c:if test="${board.b_updateDate != null}">
												<div style="font-size: 15px"> 수정일 : ${board.b_updateDate} </div>
											</c:if>
										</div>
										<c:if test="${board.b_updateDate != null}">
											<div align="right" style="height: 20px">
											<div style="font-size: 15px"> 수정일 : ${board.b_updateDate} </div>
											</div>
										</c:if>
									</td>
								</tr>
								<tr>
									<td>
										<c:if test="${isRecommended == 0}">
											추천하기 <input type="button" class="recommendButton" id="recommendBtn" data-bnum="${board.b_num}">
										</c:if>
										<c:if test="${isRecommended == 1}">
											추천하기 <input type="button" class="recommendButton active" id="recommendBtn" data-bnum="${board.b_num}">
										</c:if>
									</td>
								</tr>
							</table>
							<div align="right">
								<br>
								<input type="button" class="inputButton" value="수정" id="">
								<input type="reset" class="inputButton" value="삭제" id="">
								<input type="button" class="inputButton" value="목록" onclick="window.location='${path}/comm_main.do'">
							</div>
						</form>
					</div>
				</div>
				<!-- 댓글 부분 -->
				<div class="table_div">
					<!-- 댓글목록 -->
					<div id="comment_list" align="center">
					</div>
					<!-- 댓글 입력 코드 -->
					<c:choose>
						<c:when test="${not empty sessionScope.sessionid}">
							<table>
								<tr>
									<th style="width:150px">댓글작성</th>
									<td style="width:270px; text-align:left">
										<textarea style="width:600px" rows="5" cols="93" name="c_content" id="c_content" placeholder="댓글입력"></textarea>
									</td>
									<th style="width:40px" rowspan="2" align="right">
										<center><input type="button" class="inputButton" value="작성" id="btnCommentSave"></center>
									</th>
								</tr>
							</table>
						</c:when>
						<c:otherwise>
							<table>
								<tr>
									<th style="width:150px">댓글작성<br>(로그인후 작성가능)</th>
									<td style="width:270px; text-align:left">
										<textarea style="width:600px" rows="5" cols="93" name="c_content" id="c_content" placeholder="댓글입력"></textarea>
									</td>
									<th style="width:40px" rowspan="2" align="right">
										<center><input type="button" class="inputButton" value="작성" id="btnCommentLogin"></center>
									</th>
								</tr>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<!-- 컨텐츠 끝 -->
		<!-- footer 부분 -->
		<%@ include file="/WEB-INF/views/setting/footer.jsp" %>
	</div>
</body>
</html>