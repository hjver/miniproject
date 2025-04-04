<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천분양 정보 게시판</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/md_board.css?v=5">
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
    <section class="sub">
        <p>추천분양 정보 게시판</p>
        <div class="boards">이번주 신규 매물정보를 한눈에 확인하실 수 있습니다.</div>
        <div class="info_board">
          <ul>
            <li>NO</li>
            <li>제목</li>
            <li>글쓴이</li>
            <li>조회수</li>
            <li>등록일</li>
          </ul>
          <c:if test=${notice_all == null}>
          <ul style="display: none;"><li class="nodata">등록된 게시물이 없습니다.</li></ul>
          </c:if>
          <c:if test=${notice_all != null}>
          <ul class="data_view">
            <li>${notice_all.getNidx()}</li>
            <li style="text-align: left;">${notice_all.getNtitle()}</li>
            <li>${notice_all.getNwriter()}</li>
            <li>${notice_all.getNview()}</li>
            <li>${notice_all.getNdate()}</li>
          </ul>
          </c:if>
        </div>
        <div class="info_pageing">
          <ol>
            <li>1</li>
            <li>2</li>
            <li>3</li>
          </ol>
        </div>
        <div class="info_search">
          <input type="text" class="search_text" placeholder="검색어를 입력하세요">
          <input type="button" value="검색" class="search_btn">
        </div>
    </section>
</main>

<footer>
  <!-- 카피라이터 -->
  <%@ include file="./copyright.jsp"%>
</footer>

</body>
</html>