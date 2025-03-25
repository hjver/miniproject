<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="sub">
<div>
<ul>
<li>이메일 찾기</li>
<li>비밀번호 찾기</li>
</ul>
</div>
<div class="text1">
<div><input type="text" id="name" placeholder="이름을 입력하세요"></div>
<div><input type="text" id="mbile" placeholder="휴대폰 번호는 - 빼고 숫자만 입력하세요" maxlength="11"></div>
</div>
<div><input type="button" value="이메일 찾기" onclick="email_search()"></div>
<form id="frm" method="post" action="/email_search_ok.do">
	<input type="hidden" name="mname">
	<input type="hidden" name="mmobile">
</form>
</section>
<script>
function email_search(){
	if(document.getElementById("name").value == ""){
		alert("이름을 입력하세요.")
	}
}

</script>