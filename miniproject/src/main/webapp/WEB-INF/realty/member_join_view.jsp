<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<form id="frm" method="post" action="/member_join_ok.do">
	<!-- 중복체크여부 저장 -->
	<input type="hidden" id="emailck" value="">
	
	<p>이메일로 회원가입</p>
	<div>
		<a>이메일</a> <input type="text" name="memail" placeholder=" 이메일 주소를 입력해주세요." autocomplete="none" style="width:400px; float:left;"> 
		<input type="button" value="중복체크" class="mail_btn" onclick="email_check()">
	</div>
	<div>
		<a>비밀번호</a> <input type="password" name="mpasswd" placeholder=" 10~16자(영문,숫자,특수 문자 조합)로 입력해주세요." autocomplete="none">
	</div>
	<div>
		<a>비밀번호 확인</a> <input type="password" id="passwd2" placeholder=" 비밀번호를 다시 한 번 입력해주세요." autocomplete="none">
	</div>
	<div>
	    <a>이름</a> <input type="text" name="mname" placeholder=" 이름을 입력해주세요." autocomplete="none">
	</div>
	<div>
	    <a>휴대폰번호</a> <input type="text" name="mmobile" placeholder=" -없이 숫자만 입력해주세요." autocomplete="none">
	</div>
	<div>
	<input type="checkbox" id="all" onchange="all_check(this.checked)"> <span>전체 동의</span> </div>
	
	<div class="line"></div>
	
	<div class="bottom">	
		<div class="box1"><input type="checkbox" class="agree" name="age_over14" value="Y" onclick="agree_check()"> <a class="a1">(필수) <span>만 14세 이상입니다.</span></a></div>
		<div class="box2"><input type="checkbox" class="agree" name="terms_agree" value="Y" onclick="agree_check()"> <a class="a2">(필수) <span><u>이용약관</u>에 동의</span></a></div>
		<div class="box3"><input type="checkbox" class="agree" name="privacy_agree" value="Y" onclick="agree_check()"> <a class="a3">(필수) <span><u>개인정보 수집 및 이용</u>에 동의</span></a></div>
		<section class="text1" id="text1"></section>
		<div class="box4"><input type="checkbox" class="agree" name="marketing_agree" value="Y" onclick="agree_check()"> <span>(선택) 마케팅 수신에 동의</span></div>
		<section class="text2" id="text2"></section>
	</div>
	<div><input type="button" value="가입 하기" onclick="member_join()"></div>
</form>

<script>
window.onload = function(){
	var http1 = new XMLHttpRequest; //ajax 통신
	http1.open("GET","${common_path}/agree1.txt",false); //GET 통신을 이용하여 해당 파일을 로드
	http1.send();
	document.getElementById("text1").innerHTML = http1.response; //HTML에 내용을 출력

	var http2 = new XMLHttpRequest;
	http2.open("GET","${common_path}/agree2.txt",false);
	http2.send();
	document.getElementById("text2").innerHTML = http2.response;
	}
</script>
<script src="${common_path}/js/member_join.js?=v2"></script>