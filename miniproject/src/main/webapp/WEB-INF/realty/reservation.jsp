<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모댈 하우스 사전 방문예약</title>
<link rel="stylesheet" type="text/css" href="${common_path}/css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="${common_path}/css/reservation.css?v=4">
</head>
<body>
<!-- 최상단 및 메뉴 -->
  <%@ include file="./top.jsp"%>
  
<main>
<section class="sub">
<p>모델 하우스 사전 방문예약</p>
<div>
<span class="list_title">
<span style="color: blue;">분양정보</span>
<span style="color: red;">${bunyang_title}</span>
</span>
<form id="frm" method="post" action="/reservation_ok.do">
<input type="hidden" name="midx" value="${sessionScope.userDTO.getMidx()}">
<input type="hidden" name="bunyang_index" value="${bunyang_index}">
<input type="hidden" name="bunyang_title" value="${bunyang_title}">
<ul class="sub_ul">
<li>방문일시</li>    
<li><input type="date" class="sel_input" name="visit_date"></li> 
<li>방문시간</li>    
<li>
<select class="sel_input2" name="visit_time">
    <option value="">방문시간선택</option>
    <option value="09:00:00">09:00</option>
    <option value="11:00:00">11:00</option>
    <option value="13:00:00">13:00</option>
    <option value="15:00:00">15:00</option>
    <option value="17:00:00">17:00</option>
</select> * 해당 시간에 맞춰서 방문해 주셔야 합니다.
</li> 
<li>방문자명</li>    
<li><input type="text" class="sel_input" value="${sessionScope.userDTO.getMname()}" readonly></li> 
<li>방문인원</li>    
<li>
<label><input type="radio" class="sel_check" name="visitors" checked value="1"> 1명</label>
<label><input type="radio" class="sel_check" name="visitors" value="2"> 2명</label> ※ 방문인원은 최대 2명까지 입니다.
</li>   
<li>연락처</li>    
<li><input type="text" class="sel_input" value="${sessionScope.userDTO.getMmobile()}" readonly></li>       
</ul>
</div>
<div>
<input type="button" value="방문 예약등록" onclick="gopage()">
</div>
</form>
</section>
</main>

<footer>
  <!-- 카피라이터 -->
  <%@ include file="./copyright.jsp"%>
</footer>

</body>
<script>
function gopage(){
	var date = new Date(); //today
	var sdate = date.toISOString().split('T')[0]; //today //2025-04-02
	var mm = String(date.getMinutes()).padStart(2, "0");
	var ss = String(date.getSeconds()).padStart(2, "0");
	var t = date.getHours() + "" + mm + "" + ss;  //시간+분 //1507
	
	var visit_date = frm.visit_date.value; //사용자 선택일자 //2025-04-02
	var visit_time = frm.visit_time.value; //사용자가 선택한 시간대 //15:00:00
	var ut = visit_time.replace(":",""); //150000
	
	if(visit_date < sdate){
		alert("오늘 이후 날짜를 선택하셔야 합니다.")
	}
	else if(visit_date == sdate && t > ut){
		alert("현재시간 이후 시간대를 선택하셔야 합니다.")
	}
	else{
		frm.submit();
	}
}
</script>
</html>