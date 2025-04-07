<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천분양 정보 게시판</title>
<link rel="stylesheet" type="text/css" href="${common_path}/css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="${common_path}/css/md_board.css?v=5">
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
          
          <c:if test="${empty md_pageall}">
          <ul style="display: block;"><li class="nodata">등록된 게시물이 없습니다.</li></ul>
          </c:if>
          
          <c:if test="${not empty md_pageall}">
          <c:forEach var="md" items="${md_pageall}" varStatus="no">
          <ul class="data_view">
            <li>${total - no.index}</li>
            <li style="text-align: left;"><a href="/md_board_view.do?key=${md.md_idx}"><c:out value="${md.md_title}"/></a></li> <!-- '<br>'이 텍스트로 출력 -->
            <li>${md.nwriter}</li>
            <li>${md.nviews}</li>
            <li>${fn:substring(md.reg_date, 0, 10)}</li>
          </ul>
          </c:forEach>
          </c:if>
          
        </div>
        <div class="info_pageing">
          <ol>
            <c:forEach var="no" begin="1" end="${pageno_cnt}">
            <li><a href="/md_board.do?pageno=${no}">${no}</a></li>
            </c:forEach>
          </ol>
        </div>
        <form id="frm" method="get" action="/md_board.do">
        <div class="info_search">
          <input type="text" class="search_text" name="search" value="${search}" placeholder="검색어를 입력하세요">
          <input type="button" value="검색" class="search_btn" onclick="go_search()">
        </div>
        </form>
    </section>
</main>

<footer>
  <!-- 카피라이터 -->
  <%@ include file="./copyright.jsp"%>
</footer>

</body>
<script>
function go_search(){
	frm.submit();
}
</script>
</html>