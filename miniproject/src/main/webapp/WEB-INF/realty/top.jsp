<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<!--최상단-->
<header>
 <div class="top_banner"></div>
</header>
<!--최상단끝-->
<!--메뉴-->
<nav>
 <div class="menus">
   <ul class="menus_ul">
     <li><img src="${common_path}/logo/e_click_logo.png"></li>
     <li>일반매물</li>
     <li>추천매물</li>
     <li>중계의뢰</li>
     <li>상담신청</li>
     <li>업체의뢰</li>
     <li>의뢰현황</li>
     <li class="logins">
       <!--
       홍길동님 환영합니다.[로그아웃]
       -->
       <a href="/login.do">
       	 <span title="로그인"><img src="${common_path}/ico/login.svg"></span>
       </a>
       <a href="/member_join.do">
         <span title="회원가입"><img src="${common_path}/ico/membership.svg"></span>
       </a>
     </li>
   </ul>
 </div>
</nav>
<!--메뉴끝-->