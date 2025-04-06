<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
     <li><img src="${common_path}/logo/e_click_logo.png" onclick="location.href='/index.do'"></li>
     <li>일반매물</li>
     <li>추천매물</li>
     <li>중계의뢰</li>
     <li><a onclick="go_page('/counsel.do')">상담신청</a></li>
     <li>업체의뢰</li>
     <li>의뢰현황</li>
     <li class="logins" onmouseleave="myinfo_menu(2)">
        <span title="회원정보" onclick="myinfo_menu(1)">
        <img src="./ico/login.svg">
        <ul class="login_info" id="login_info" style="display: none;">
          <c:if test="${empty sessionScope.userDTO}">
            <li><a href="/login.do">로그인 / 회원가입</a></li>
          </c:if>
          <c:if test="${not empty sessionScope.userDTO}">
            <li>"${sessionScope.userDTO.getMname()}"님 <a href="/logout.do">[로그아웃]</a></li>
          </c:if>  
        </ul>
        </span>
        <span title="모델 하우스 사전예약 리스트" onclick="go_page('/reservation_list.do')"><img src="./ico/reserve_list.svg"></span>
      </li>
   </ul>
 </div>
</nav>
<form id="frm_top" method="post" style="all: unset;">
  <input type="hidden" name="midx">
</form>
<script>
    //로그인 여부에 따른 해당 페이지 이
    function go_page(go_url) {
    	var userDTO = '${sessionScope.userDTO}';
    	if(userDTO && userDTO != 'null' && userDTO != ''){ //세션에 값이 있을 경우, 해당 페이지로 이동
    		frm_top.midx.value = '${sessionScope.userDTO.midx}';
    		frm_top.action = go_url;
    		frm_top.submit();
    	}
    	else{ //세션에 값이 없으면 로그인 페이지로 리다이렉트
    		alert("해당 사이트는 로그인이 필요합니다."); 
    		window.location.href = "/login.do";
    	}
    }
    
    function myinfo_menu(part){
        var log_menu = document.getElementById("login_info");
        if(part==1){
            if(log_menu.style.display == "none"){
                log_menu.style.display = "block"; 
            }
            else{
                log_menu.style.display = "none"; 
            }
        }
        else{
            log_menu.style.display = "none"; 
        }
    }
 </script>
<!--메뉴끝-->