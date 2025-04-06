<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>온라인 부동산 중개</title>
  <link rel="stylesheet" type="text/css" href="${common_path}/css/index.css?v=7">
</head>
<body>
 <!-- 최상단 및 메뉴 -->
 <%@ include file="./top.jsp"%>
 
 <main>
  <!-- 카테고리 및 배너 -->
  <%@ include file="./banner.jsp"%>
  
  <!-- quick menu -->
  <%@ include file="./quickmenu.jsp"%>
  
  <!-- 금주 분양 매물 정보 -->
  <%@ include file="./weekinfo.jsp"%>

  <!-- 추천 분양 정보 -->
  <%@ include file="./mdchoice.jsp"%>
  
 </main>
 
 <footer>
   <!-- 카피라이터 -->
   <%@ include file="./copyright.jsp"%>
 </footer>
 
</body>
</html>