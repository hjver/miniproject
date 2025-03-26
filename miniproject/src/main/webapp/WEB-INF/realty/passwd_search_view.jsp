<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="sub">
<div>
<ul>
<li><a href="/email_search.do">이메일 찾기</a></li>
<li><a href="/passwd_search.do">비밀번호 찾기</a></li>
</ul>
</div>
<div class="text1">
<div><input type="text" id="email" placeholder="가입하신 이메일을 입력하세요"></div>
<div><input type="text" id="mobile" placeholder="휴대폰 번호는 - 빼고 숫자만 입력하세요"></div>
</div>
<div><input type="button" value="비밀번호 찾기" onclick="passwd_search()"></div>
<form id="frm" method="post" action="/passwd_search_ok.do">
	<input type="hidden" name="memail">
	<input type="hidden" name="mmobile">
</form>
</section>
<script>
function passwd_search(){
	var email = document.getElementById("email");
	var mobile = document.getElementById("mobile")
	
	if(email.value == ""){
		alert("이름을 입력하세요.")
		email.focus();
	}
	else if(mobile.value == ""){
		alert("비밀번호를 입력하세요.")
		mobile.focus();
	}
	else{
		frm.memail.value = email.value;
		frm.mmobile.value = mobile.value;
		frm.submit();
	}
}
</script>