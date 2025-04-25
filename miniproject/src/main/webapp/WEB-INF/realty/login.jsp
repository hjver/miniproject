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
		<div><input type="button" value="카카오로그인" class="kakao_btn" onclick="kakao_login()"></div>
		<div>
			<span><a href="/member_join.do">회원가입</a></span>
			<span><a href="/email_search.do">이메일 찾기</a></span>
			<span><a href="/passwd_search.do">비밀번호 찾기</a></span>
		</div>
		<form id="frm" method="post" action="/login_ok.do">
			<input type="hidden" name="code" value="1">
			<input type="hidden" name="memail">
			<input type="hidden" name="mpasswd">
			<input type="hidden" name="kakao_id" value="">
			<input type="hidden" name="kakao_nicknm" value="">
		</form>
	</aside>
  </main>

  <footer>
    <!-- 카피라이터 -->
    <%@ include file="./copyright.jsp"%>
  </footer>
  
</body>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.js"></script>
<script>
  Kakao.init('d1711f107e526eb56e2ce78197402446'); // 사용하려는 앱의 JavaScript 키 입력
  //kakao developers > 문서 > 시작하기 > JavaScript > 레퍼런스 > API
  function kakao_login(){
	  //Kakao.Auth.login : 카카오 회원가입 및 로그인 페이지를 출력하는 함수
	  Kakao.Auth.login({
		  //성공시 출력되는 형태
		  success:function(response){ //response 결과화면
			  Kakao.API.request({  //사용자 가입정보를 요청
				  url: '/v2/user/me', //사용자 정보 가져오기
				  success:function(response){  //API 서버에서 기입정보를 가져옴
					  let kakao_id = response["id"]; //고유값
					  let nickname = response["kakao_account"]["profile"]["nickname"] //닉네
					  sessionStorage.setItem("kakao_id", kakao_id);
					  sessionStorage.setItem("nickname", nickname);
					  frm.code.value = "2";
					  frm.kakao_id.value = kakao_id;
					  frm.kakao_nicknm.value = nickname;
					  frm.submit();
				  },
				  fail:function(error){
					  console.log("카카오 API 접속오류!!");
				  }
			  });
		  },
		  //API 키가 맞지 않을 경우 출력되는 함수
		  fail:function(error){
				console.log(error);
				console.log("카카로 key 접속 오류 및 환경설정 오류!!");			  
		  }
	  });
  }
</script>

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