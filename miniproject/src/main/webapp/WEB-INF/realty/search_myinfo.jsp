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
<link rel="stylesheet" type="text/css" href="${common_path}/css/search_myinfo.css?v=2">
</head>
<body>
  <!-- 최상단 및 메뉴 -->
  <%@ include file="./top.jsp"%>

  <main>
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
  </main>

  <footer>
    <!-- 카피라이터 -->
    <%@ include file="./copyright.jsp"%>
  </footer>
  
</body>
<script>
function redirect(){
	location.href = "/login.do";
}
</script>
</html>