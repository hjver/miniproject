<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<c:if test="${check == 0 }">
	<script>
	    alert("${msg}");
	</script>
</c:if>
<c:if test="${check == 1 }">
	<script>
	    alert("${msg}");
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천분양 정보 게시판</title>
<link rel="stylesheet" type="text/css" href="${common_path}/css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="${common_path}/css/reservation_list.css?v=5">
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
        <p>모델 하우스 방문 예약 리스트</p>
        <div class="boards">모델 하우스 방문 예약한 정보를 한눈에 확인 하실 수 있습니다.</div>
        <div class="info_board">
          <ul>
            <li>NO</li>
            <li>아파트명</li>
            <li>방문일자</li>
            <li>방문시간</li>
            <li>인원수</li>
            <li>취소</li>
          </ul>
          
          <c:if test="${empty reserve_all}">
          <ul style="display: block;"><li class="nodata">등록된 방문 예약이 없습니다.</li></ul>
          </c:if>
          
          <c:if test="${not empty reserve_all}">
          <c:forEach var="reserve" items="${reserve_all}" varStatus="no">
          <ul class="data_view">
            <li>${reserve_all.size() - no.index}</li> 
            <li style="text-align: left;">${reserve.bunyang_title}</li>
            <li>${reserve.visit_date}</li>
            <li>${fn:substring(reserve.visit_time, 0, 5)}</li>
            <li>${reserve.visitors}명</li>
            <li><input type="button" value="취소" class="cancel_btn" onclick="reserce_del('${reserve.ridx}')"></li>
          </ul>
          </c:forEach>
          </c:if>
          
        </div>
        
        <form id="frm" method="post" action="/reservation_delete.do">
        	<input type="hidden" name="ridx">
        </form>
        
    </section>
</main>

<footer>
  <!-- 카피라이터 -->
  <%@ include file="./copyright.jsp"%>
</footer>

</body>
<script>
function reserce_del(ridx) {
	frm.ridx.value = ridx;
	frm.submit();
}
</script>
</html>