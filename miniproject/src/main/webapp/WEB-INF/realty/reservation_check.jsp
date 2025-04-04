<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${check == 0 }">
	<script>
	    alert("${msg}");
	    location.href= "/reservation.do";
	</script>
	<c:redirect url="/reservation.do" />
</c:if>
<c:if test="${check == 1 }">
	<script>
	    alert("${msg}");
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모댈 하우스 사전 방문예약 확인</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/reservation.css?v=4">
</head>
<body>
<!-- 최상단 및 메뉴 -->
  <%@ include file="./top.jsp"%>
  
<main>
<section class="sub">
<p>모델 하우스 사전 방문예약 확인</p>
<div>
<span class="list_title">
<span style="color: blue;">분양정보</span>
<span style="color: red;">${bunyang_title}</span>
</span>
<ul class="sub_ul">
<li>방문일시</li>    
<li><input type="text" class="sel_input" value="${reserveDTO.getVisit_date()}" disabled></li> 
<li>방문시간</li>    
<li>
<input class="sel_input2" value="${reserveDTO.getVisit_time()}" disabled>* 해당 시간에 맞춰서 방문해 주셔야 합니다.
</li> 
<li>방문자명</li>    
<li><input type="text" class="sel_input" value="${sessionScope.userDTO.getMname()}" disabled></li> 
<li>방문인원</li>    
<li>${reserveDTO.getVisitors()}명 ※ 방문인원은 최대 2명까지 입니다.</li>   
<li>연락처</li>    
<li><input type="text" class="sel_input" value="${sessionScope.userDTO.getMmobile()}" disabled></li>       
</ul>
</div>
<div>
<input type="button" value="메인페이지로 이동" onclick="location.href='/index.do';">
</div>
</section>
</main>

<footer>
  <!-- 카피라이터 -->
  <%@ include file="./copyright.jsp"%>
</footer>

</body>
</html>