<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<section>
  <div class="recommend">
    <p>추천분양정보<br><em>실시간 추천 분양정보를 한곳에!</em></p>
    <div class="md_estates">
      <ul>
       <c:forEach var="n" begin="0" end="3">
        <li>
          <div><img id="${'md_img'}${n}" src=""></div>
          <span id="${'md_title'}${n}"></span>
          <div id="${'md_dtail'}${n}"></div>
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
		view();
	}
}
http.open("GET","/api_allmd.do",true);
http.send();

var common_path = "${common_path}";
function view(){
	console.log(data["md_db"].length);
	for(var n=0; n<data["md_db"].length;n++) {
		var nth_md = data["md_db"][n];
		console.log(n);
		console.log(nth_md["md_img"]);
		document.getElementById("md_img"+n).src = common_path + "/md_room/" + nth_md["md_img"];
		
		console.log(nth_md["md_title"]);
		document.getElementById("md_title"+n).innerText = nth_md["md_title"];
		
		console.log(nth_md["md_detail"]);
		document.getElementById("md_detail"+n).innerText = nth_md["md_detail"];
		console.log("테스트 ");
	}
}
</script>