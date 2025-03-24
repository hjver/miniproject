<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<section>
  <div class="weekdays">
    <p>금주분양 매물정보<br><em>이번주 신규 매물정보!</em></p>
    <div class="week_estates">
      <ul>
        <li>
          <span>매매</span>
          <div>LH센트럴힐(공공임대)</div>
          <aside>송파구 문정동</aside>
          <span>아파트 | 공공임대</span>
          <label>2023.11 분양 | 2024.09 입주</label>
          <div><img src="${common_path}/room/room1.jpg"></div>
        </li>
      </ul>
    </div>
  </div>
</section>