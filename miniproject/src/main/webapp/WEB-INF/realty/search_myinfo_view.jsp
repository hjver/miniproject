<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="sub">
<div>
<ul>
<li>회원가입된 이메일 확인</li>
</ul>
</div>
<div class="text1">
<div>가입하신 이메일 정보 : ${memail}</div>
</div>
<div><input type="button" value="정보확인" class="search_submit" onclick="redirect()"></div>
</section>
<script>
function redirect(){
	location.href = "/login.do";
}
</script>