<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기</title>
<link rel="stylesheet" type="text/css" href="${common_path}/css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="${common_path}/css/email_search.css?v=2">
</head>
<body>
  <!-- 최상단 및 메뉴 -->
  <%@ include file="./top.jsp"%>
  
  <main>
	<section class="sub">
	<div>
	<ul>
	<li><a href="/email_search.do">이메일 찾기</a></li>
	<li><a href="/passwd_search.do">비밀번호 찾기</a></li>
	</ul>
	</div>
	<div class="text1">
	<div><input type="text" id="name" placeholder="이름을 입력하세요"></div>
	<div><input type="text" id="mobile" placeholder="휴대폰 번호는 - 빼고 숫자만 입력하세요" maxlength="11"></div>
	</div>
	<div><input type="button" value="이메일 찾기" onclick="email_search()"></div>
	<form id="frm" method="post" action="/email_search_ok.do">
		<input type="hidden" name="mname">
		<input type="hidden" name="mmobile">
	</form>
	</section>
  </main>

  <footer>
    <!-- 카피라이터 -->
    <%@ include file="./copyright.jsp"%>
  </footer>
  
</body>
<script>
function email_search(){
	var name = document.getElementById("name");
	var mobile = document.getElementById("mobile")
	
	if(name.value == ""){
		alert("이름을 입력하세요.")
		name.focus();
	}
	else if(mobile.value == ""){
		alert("비밀번호를 입력하세요.")
		mobile.focus();
	}
	else{
		frm.mname.value = name.value;
		frm.mmobile.value = mobile.value;
		frm.submit();
	}
}
</script>
</html>