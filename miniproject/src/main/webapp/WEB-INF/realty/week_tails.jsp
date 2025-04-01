<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금주 분양 매물 정보</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/week_tails.css?v=1">
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
				<li><img src="./room/${typeDTO.getBunyang_img()}"></li>
            </ul>
		</div>
        <div><button class="btn_css">방문예약</button></div>
        <div><button class="btn_close">방문예약완료</button></div>
	</div>
</main>

 <footer>
   <!-- 카피라이터 -->
   <%@ include file="./copyright.jsp"%>
 </footer>
</body>
</html>