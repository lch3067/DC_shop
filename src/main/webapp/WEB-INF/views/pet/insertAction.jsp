<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  html, body { height: 100%; margin: 0; }
  .wrap {
    min-height: 100vh;
    display: flex;            /* 가운데 정렬 */
    align-items: center;
    justify-content: center;
  }
  #successImg {
    display: none;            /* 알럿 후에 보여줌 */
    max-width: 60vw;
    max-height: 60vh;
    object-fit: contain;
  }
</style>
</head>
<body>
  <div class="wrap">
    <c:if test="${joinSuccess}">
      <script type="text/javascript">
        //alert("반려동물 등록 성공!!");
        // 이미지 보여주기
        (function(){
          var img = document.getElementById('successImg');
          if (img) img.style.display = 'block';
          // 3초 뒤 이동
          setTimeout(function(){ window.location = CTX + "/joinFin.do"; }, 3000);
        })();
      </script>
    </c:if>

    <c:if test="${!joinSuccess}">
      <script type="text/javascript">
        alert("반려동물 등록 실패!!");
        setTimeout(function(){ window.location = CTX + "/termsAgreement.do" }, 3000);
      </script>
    </c:if>
    <!-- 컨텐츠 끝 -->
  </div>
</body>
</html>
