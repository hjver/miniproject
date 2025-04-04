<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금주 분양 매물 정보</title>
<link rel="stylesheet" type="text/css" href="${common_path}/css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="${common_path}/css/week_tails.css?v=1">
</head>
<body>
<!-- 최상단 및 메뉴 -->
  <%@ include file="./top.jsp"%>
  
<main>
	<div class="weektails">
		<p>분양정보</p>
		<div id="weektails">
			<p>${typeDTO.getBunyang_title()}</p>
            <ul>
                <li>종류</li>
                <li>${typeDTO.getBunyang_part()} | ${typeDTO.getBunyang_info()} </li>
                <li>주소</li>
				<li>${typeDTO.getBunyang_addr()}</li>
                <li>규모</li>
				<li>총 ${typeDTO.getBunyang_units()}세대 | 총 ${typeDTO.getBunyang_towers()}개동</li>
                <li>시기</li>
				<li>${typeDTO.getBunyang_date()} | ${typeDTO.getBunyang_in()}</li>
                <li>난방구조</li>
				<li>${typeDTO.getBunyang_str()}</li>
                <li>건설사</li>
				<li>${typeDTO.getBunyang_company()}</li>
                <li>사진정보</li>
				<li><img src="${common_path}/room/${typeDTO.getBunyang_img()}"></li>
            </ul>
		</div>
		<c:if test="${reserved == false}">
        	<div><button class="btn_css" onclick="gopage('/reservation.do')">방문예약</button></div>
		</c:if>
		<c:if test="${reserved == true}">
        	<div><button class="btn_close" onclick="gopage('/reservation_check.do')" >방문예약완료</button></a></div>
        </c:if>
	</div>
	<form id="frm" method="post" action="">
		<input type="hidden" name="bunyang_index" value="">
		<input type="hidden" name="bunyang_title" value="">
	</form>
</main>

<footer>
  <!-- 카피라이터 -->
  <%@ include file="./copyright.jsp"%>
</footer>
</body>
</html>
<script>
function gopage(url){
	frm.bunyang_index.value = "${typeDTO.getBunyang_index()}";
	frm.bunyang_title.value = "${typeDTO.getBunyang_title()}";
	frm.action = url;
	frm.submit();
}
</script>