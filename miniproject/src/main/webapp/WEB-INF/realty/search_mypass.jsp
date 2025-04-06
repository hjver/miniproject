<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 찾기 및 변경</title>
<link rel="stylesheet" type="text/css" href="${common_path}/css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="${common_path}/css/search_myinfo.css?v=2">
</head>
<body>
  <!-- 최상단 및 메뉴 -->
  <%@ include file="./top.jsp"%>

  <main>
	<section class="sub">
	<div>
	<ul>
	<li>회원가입 정보에 따른 패스워드 변경</li>
	</ul>
	</div>
	<div class="text1 repass">
	<div><input type="password" id="passwd1" placeholder="최소 10 ~ 16자 (영문,숫자,특수 문자 조합)로 입력해주세요." class="passin" autocomplete="none"></div>
	<div><input type="password" id="passwd2" placeholder="동일한 비밀번호를 입력하세요" class="passin" autocomplete="none"></div>
	</div>
	<div><input type="button" value="비밀번호 변경" class="search_submit" onclick="pass_change()"></div>
	<form id="frm" method="post" action="/passwd_change_ok.do">
		<input type="hidden" name="midx" value="${midx}">
		<input type="hidden" name="mpasswd">
	</form>
	</section>
  </main>

  <footer>
    <!-- 카피라이터 -->
    <%@ include file="./copyright.jsp"%>
  </footer>
  
</body>
<script>
function pass_change(){
	var passwd1 = document.getElementById("passwd1");
	var passwd2 = document.getElementById("passwd2")
	
	if(passwd1.value == ""){
		alert("비밀번호를 입력하세요.")
		passwd1.focus();
	}
	else if(passwd1.value == ""){
		alert("비밀번호를 한번 더 입력하세요.")
		passwd1.focus();
	}
	else if(passwd1.value != passwd1.value){
		alert("각각 입력한 비밀번호가 다릅니다. 동일한 비밀번호를 입력하세요.")
	}
	else{
		frm.mpasswd.value = passwd1.value;
		frm.submit();
	}
}
</script>
</html>