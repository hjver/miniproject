<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<section>
  <div class="weekdays">
    <p>금주분양 매물정보<br><em>이번주 신규 매물정보!</em></p>
    <div class="week_estates">
      <ul>
        <c:forEach var="n" begin="0" end="7">
        <li>
         <a id="${'bhref'}${n}" onclick="go_href(${n})">
          <span id="${'btag'}${n}"></span>
          <div id="${'btitle'}${n}"></div>
          <aside id="${'baddr'}${n}"></aside>
          <span id="${'bpart'}${n}"></span>
          <label id="${'bdate'}${n}"></label>
          <div><img id="${'bimg'}${n}" src=""></div>
         </a>
        </li>
		</c:forEach>
      </ul>
    </div>
  </div>
</section>
<script>
var data_type;
var http_type = new XMLHttpRequest();
http_type.onreadystatechange = function(){
	if(http_type.readyState==4 && http_type.status==200){
		data_type = JSON.parse(this.response);
		view_type();
	}
}
http_type.open("GET","/api_alltype.do",true);
http_type.send();

var common_path = "${common_path}";
function view_type(){
	for(var n=0; n<data_type["type_db"].length;n++) {
		var nth_type = data_type["type_db"][n];
		
		document.getElementById("btag"+n).innerText = nth_type["bunyang_tag"];
		document.getElementById("btitle"+n).innerText = nth_type["bunyang_title"];
		document.getElementById("baddr"+n).innerText = nth_type["bunyang_addr"];
		document.getElementById("bpart"+n).innerText = nth_type["bunyang_part"] + " | " +nth_type["bunyang_info"];
		document.getElementById("bdate"+n).innerText = nth_type["bunyang_date"] + " | " + nth_type["bunyang_in"];
		document.getElementById("bimg"+n).src = common_path + "/room/" + nth_type["bunyang_img"];		
	}
}

function go_href(n){
	var userDTO = '${sessionScope.userDTO}';
	if(userDTO && userDTO != 'null' && userDTO != ''){ //세션에 값이 있을 경우, 해당 페이지로 이동
		window.location.href = "/week_tails.do?key=" + data_type["type_db"][n]["bunyang_index"];
	}
	else{ //세션에 값이 없으면 로그인 페이지로 리다이렉트
		alert("해당 사이트는 로그인이 필요합니다."); 
		window.location.href = "/login.do";
	}
}
</script>