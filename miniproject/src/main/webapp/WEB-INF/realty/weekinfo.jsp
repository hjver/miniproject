<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<section>
  <div class="weekdays">
    <p>금주분양 매물정보<br><em>이번주 신규 매물정보!</em></p>
    <div class="week_estates">
      <ul>
        <input type="hidden" id="length" value="0"> 
        <c:forEach var="no" begin="0" end="7">
        <li>
         <a>
          <span id="${'btag'}${no}"></span>
          <div id="${'btitle'}${no}"></div>
          <aside id="${'baddr'}${no}"></aside>
          <span id="${'bpart'}${no}"></span>
          <label id="${'bdate'}${no}"></label>
          <div><img id="${'bimg'}${no}" src=""></div>
         </a>
        </li>
		</c:forEach>
      </ul>
    </div>
  </div>
</section>
<script>
var http,data;
http = new XMLHttpRequest();
http.onreadystatechange = function(){
	if(http.readyState==4 && http.status==200){
		data = JSON.parse(this.response);
		document.getElementById("length").value = data.length;
		view();
	}
}
http.open("GET","/api_alltype.do",false);
http.send();

function view(){
	for(var i=0; i<data["type_db"].length;i++) {
		document.getElementById("btag"+i).innerText = data["type_db"][i]["bunyang_tag"];
		document.getElementById("btitle"+i).innerText = data["type_db"][i]["bunyang_title"];
		document.getElementById("baddr"+i).innerText = data["type_db"][i]["bunyang_addr"];
		document.getElementById("bpart"+i).innerText = data["type_db"][i]["bunyang_part"] + " | " + data["type_db"][i]["bunyang_info"];
		document.getElementById("bdate"+i).innerText = data["type_db"][i]["bunyang_date"] + " | " + data["type_db"][i]["bunyang_in"];
		document.getElementById("bimg"+i).src = "${common_path}/room/" + data["type_db"][i]["bunyang_img"];
	}
}
</script>