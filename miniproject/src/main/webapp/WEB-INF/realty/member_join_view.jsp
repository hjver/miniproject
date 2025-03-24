<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<form id="frm" method="post" action="./member_join_ok()">
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
	<input type="checkbox"> <span>전체 동의</span> </div>
	
	<div class="line"></div>
	
	<div class="bottom">	
		<div class="box1"><input type="checkbox" > <a class="a1">(필수) <span>만 14세 이상입니다.</span></a></div>
		<div class="box2"><input type="checkbox"> <a class="a2">(필수) <span><u>이용약관</u>에 동의</span></a></div>
		<div class="box3"><input type="checkbox"> <a class="a3">(필수) <span><u>개인정보 수집 및 이용</u>에 동의</span></a></div>
		<section class="text1" id="text1"></section>
		<div class="box4"><input type="checkbox"> <span>(선택) 마케팅 수신에 동의</span></div>
		<section class="text2" id="text2"></section>
	</div>
	<div><input type="button" value="가입 하기" onclick="member_join()"></div>
</form>
<script>
function member_join(){

	var reg_email = /^[a-z0-9]([a-z0-9-_.])+\@[a-z0-9ㄱ-힇-_]+\.[a-z0-9ㄱ-힇]{2,}/i; //이메일 정규식 
	var reg_mobile = /010[2-9]{1}[0-9]{7}/; //휴대폰번호 정규식
	var passwd1 = frm.mpasswd.value;
	var passwd2 = document.getElementById("passwd2").value
	
	
	if(frm.memail.value==""){
		alert("이메일주소를 입력후 중복체크를 하세요.");
		frm.memail.focus();
	}
	else if(reg_email.test(frm.aemail.value)==false){
		alert("이메일 주소를 정확히 입력하세요.");
		frm.aemail.value=="";
		frm.aemail.focus();
	}
	else if(document.getElementById("emailck").value==""){
		alert("아이디 중복체크를 하세요.");
	}
	else if(frm.mpasswd.value==""){
		alert("패스워드를 입력하세요.");
		frm.apassword.focus();
	}
	else if(passwd1 != passwd2){
		alert("동일한 패스워드를 입력하세요.");
	}
	else if(frm.mname.value==""){
		alert("이름을 입력하세요.");
		frm.aname.focus();
	}
	else if(frm.mmobile.value==""){
		alert("전화번호를 입력하세요.");
		frm.mmobile.focus();
	}
	else if(reg_mobile.test(frm.mmobile.value)==false){
		alert("휴대폰번호를 정확히 입력하세요.");
		frm.mmobile.value=="";
		frm.mmobile.focus();
	}
	else{
		frm.submit();
	}
	
}

//이메일 중복체크 사항
function email_check(){
	var reg_email = /^[a-z0-9]([a-z0-9-_.])+\@[a-z0-9ㄱ-힇-_]+\.[a-z0-9ㄱ-힇]{2,}/i; //이메일 정규식 
	if(frm.memail.value==""){
		alert("이메일 주소를 입력하세요.");
		frm.aemail.focus();
	}
	else if(reg_email.test(frm.aemail.value)==false){
		alert("이메일 주소를 정확히 입력하세요.");
		frm.aemail.value=="";
		frm.aemail.focus();
	}
	else{
		//Ajax (Back-end 통신)
		ajaxpost(frm.memail.value);
	}
}

//Ajax 함수를 이용하여 중복 체크
function ajaxpost(data){
	var xhr = new XMLHttpRequest(); // XMLHttpRequest 객체 생성
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState==XMLHttpRequest.DONE && xhr.status==200){
			if(xhr.response == "ok"){
				alert("중복되지 않는 이메일입니다.");
				document.getElementById("emailck").value = "ok";
				frm.memail.readOnly = true; 
			}
			else if(this.response == "no"){
				alert("해당 이메일은 이미 가입된 이메일 입니다.");
				frm.memail.value = "";
			}
		}
	};

	ok.open("GET","./email_check.do?memail="+data,true);
	ok.send(); 
}

window.onload = function(){
	var http = new XMLHttpRequest; //ajax 통신
	http.open("GET","${common_path}/agree1.txt",false); //GET 통신을 이용하여 해당 파일을 로드
	http.send();
	document.getElementById("text1").innerHTML = http.response; //HTML에 내용을 출력

	http.open("GET","${common_path}/agree2.txt",false);
	http.send();
	document.getElementById("text2").innerHTML = http.response;
	}
</script>
<script src="${common_path}/js/member_join.js?=v1"></script>