<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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