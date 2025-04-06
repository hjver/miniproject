<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="${common_path}/css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="${common_path}/css/login.css?v=3">
<style>
.box {
   width: 800px;
   height: 300px;
   border: 1px solid black;
   overflow: auto;
}

</style>
</head>
<body>
  <!-- 최상단 및 메뉴 -->
  <%@ include file="./top.jsp"%>

  <main>
	<aside class="login_pg">	
		<p>이메일로 시작하기</p>
		<div><input type="text" id="email" placeholder="이메일 주소"></div>
		<div><input type="password" id="passwd" placeholder="비밀번호"></div>
		<div><input type="button" value="로그인" onclick="logincheck()"></div>
		<div><input type="button" value="카카오로그인" class="kakao_btn"></div>
		<div>
			<span><a href="/member_join.do">회원가입</a></span>
			<span><a href="/email_search.do">이메일 찾기</a></span>
			<span><a href="/passwd_search.do">비밀번호 찾기</a></span>
		</div>
		<form id="frm" method="post" action="/login_ok.do">
			<input type="hidden" name="memail">
			<input type="hidden" name="mpasswd">
		</form>
	</aside>
  </main>

  <footer>
    <!-- 카피라이터 -->
    <%@ include file="./copyright.jsp"%>
  </footer>
  
</body>
<script>
function logincheck(){
	var email = document.getElementById("email");
	var passwd = document.getElementById("passwd");
	
	if(email.value == ""){
		alert("이메일 주소를 입력하세요.")
		email.focus();
	}
	else if(passwd.value == ""){
		alert("비밀번호를 입력하세요.")
		passwd.focus();
	}
	else{
		frm.memail.value = email.value;
		frm.mpasswd.value = passwd.value
		frm.submit();
	}
}
</script>
</html>