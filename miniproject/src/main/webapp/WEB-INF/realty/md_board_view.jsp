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
<link rel="stylesheet" type="text/css" href="${common_path}/css/md_board_view.css?v=5">
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
            <li>제&nbsp;&nbsp;&nbsp;목</li>
            <li><c:out value="${mdDTO.md_title}"/></li>
            <li>글쓴이</li>
            <li>${mdDTO.nwriter}</li>
            <li>등록일</li>
            <li>${fn:substring(mdDTO.reg_date, 0, 10)}</li>
            <li>조회수</li>
            <li>${mdDTO.nviews}</li>
            <li class="litext">내&nbsp;&nbsp;&nbsp;용</li>
            <li class="litext">
                <div class="textarea">
                    ${mdDTO.md_detail}
                </div>
            </li>
          </ul>
        </div>
        <div class="board_btn">
            <input type="button" value="목&nbsp;&nbsp;&nbsp;록" class="btns" onclick="location.href='/md_board.do';">
        </div>
    </section>
</main>

<footer>
  <!-- 카피라이터 -->
  <%@ include file="./copyright.jsp"%>
</footer>

</body>
</html>