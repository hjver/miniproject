<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="${common_path}/css/index.css?v=7">
  <link rel="stylesheet" type="text/css" href="${common_path}/css/member_join.css?v=4">
<style>
.box {
   width: 800px;
   height: 300px;
   border: 1px solid black;
   overflow: auto;
}
</style>
<title>회원 가입</title>
</head>
<body>
  <!-- 최상단 및 메뉴 -->
  <%@ include file="./top.jsp"%>
  
  <main>
	<form id="frm" method="post" action="/member_join_ok.do">
		<input type="hidden" name="mcode" value="1">
		<input type="hidden" name="mid" value="">
		<input type="hidden" name="mnicknm" value="">
		<!-- 중복체크여부 저장 -->
		<input type="hidden" id="emailck" value="">
		
		<p id="title1">이메일로 회원가입</p>
		<p id="title2">간편 회원가입</p>
		<div id="email">
			<a>이메일</a> <input type="text" name="memail" placeholder=" 이메일 주소를 입력해주세요." autocomplete="none" style="width:400px; float:left;"> 
			<input type="button" value="중복체크" class="mail_btn" onclick="email_check()">
		</div>
		<div id="passwd_1">
			<a>비밀번호</a> <input type="password" name="mpasswd" placeholder=" 10~16자(영문,숫자,특수 문자 조합)로 입력해주세요." autocomplete="none">
		</div>
		<div id=passwd_2>
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
  </main>

  <footer>
    <!-- 카피라이터 -->
    <%@ include file="./copyright.jsp"%>
  </footer>
  
</body>
<script>

var code = "${code}";

window.onload = function(){

	if(code == "1"){
		document.getElementById("title2").style.display = "none";
	}
	else if(code == "2"){
		document.getElementById("title1").style.display = "none";
		document.getElementById("email").style.display = "none";
		document.getElementById("passwd_1").style.display = "none";
		document.getElementById("passwd_2").style.display = "none";
	}
	
	var http1 = new XMLHttpRequest; //ajax 통신
	http1.open("GET","${common_path}/agree1.txt",false); //GET 통신을 이용하여 해당 파일을 로드
	http1.send();
	document.getElementById("text1").innerHTML = http1.response; //HTML에 내용을 출력

	var http2 = new XMLHttpRequest;
	http2.open("GET","${common_path}/agree2.txt",false);
	http2.send();
	document.getElementById("text2").innerHTML = http2.response;
	}

function member_join(){
	
	var kakao_id = sessionStorage.getItem("kakao_id");
	var nickname = sessionStorage.getItem("nickname");

	var reg_email = /^[a-z0-9]([a-z0-9-_.])+@[a-z0-9ㄱ-힇-_]+\.[a-z0-9ㄱ-힇]{2,}/i; //이메일 정규식 
	var reg_mobile = /010[2-9]{1}[0-9]{7}/; //휴대폰번호 정규식
	var passwd1 = frm.mpasswd.value;
	var passwd2 = document.getElementById("passwd2").value
	
	if(code == "1"){
		if(frm.memail.value==""){
			alert("이메일주소를 입력 하세요.");
			frm.memail.focus();
		}
		else if(reg_email.test(frm.memail.value)==false){
			alert("이메일 주소를 정확히 입력하세요.");
			frm.memail.value=="";
			frm.memail.focus();
		}
		else if(document.getElementById("emailck").value==""){
			alert("이메일 중복체크를 하세요.");
		}
		else if(frm.mpasswd.value==""){
			alert("패스워드를 입력하세요.");
			frm.mpasswd.focus();
		}
		else if(passwd1 != passwd2){
			alert("동일한 패스워드를 입력하세요.");
		}
	}
	if(frm.mname.value==""){
		alert("이름을 입력하세요.");
		frm.mname.focus();
	}
	else if(frm.mmobile.value==""){
		alert("휴대폰 번호를 입력하세요.");
		frm.mmobile.focus();
	}
	else if(reg_mobile.test(frm.mmobile.value)==false){
		alert("휴대폰 번호를 정확히 입력하세요.");
		frm.mmobile.value=="";
		frm.mmobile.focus();
	}
	else if(!frm.age_over14.checked || !frm.terms_agree.checked || !frm.privacy_agree.checked) {
		alert("필수동의사항은 체크해야 합니다.")
	}
	else{
		console.log("테스트");
		if(code == "1") {
			frm.mcode.value = 1;
			frm.mid.value = frm.memail.value
			frm.mnicknm.value = frm.mname.value;
		}
		else if(code == "2"){
			frm.mcode.value = 2;
			frm.mid.value = kakao_id;
			frm.mnicknm.value = nickname;
		}
		console.log("테스트");
		frm.submit();
	}
}

//이메일 중복체크 사항
function email_check(){
	var reg_email = /^[a-z0-9]([a-z0-9-_.])+\@[a-z0-9ㄱ-힇-_]+\.[a-z0-9ㄱ-힇]{2,}/i; //이메일 정규식 
	if(frm.memail.value==""){
		alert("이메일 주소를 입력하세요.");
		frm.memail.focus();
	}
	else if(reg_email.test(frm.memail.value)==false){
		alert("이메일 주소를 정확히 입력하세요.");
		frm.memail.value="";
		frm.memail.focus();
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
			if(xhr.responseText == "ok"){
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

	xhr.open("GET","/email_check.do?memail="+data,true);
	xhr.send(); 
}

//전체 체크박스 선택/해제
function all_check(z) {
    var checkboxes = document.querySelectorAll('.agree');
    checkboxes.forEach(function (checkbox) {
        checkbox.checked = z;
    });
}

//개별 체크 상태에 따라 전체 동의 체크박스 컨트롤
function agree_check() {
    var checkboxes = document.querySelectorAll('.agree');
    var allChecked = true;
    checkboxes.forEach(function (checkbox) {
        if (!checkbox.checked) {
            allChecked = false;
        }
    });
    document.getElementById("all").checked = allChecked;
}
</script>
</html>