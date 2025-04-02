<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="common_path"
	value="${pageContext.request.contextPath}/resources" />
<section>
	<div class="recommend">
		<p>
			추천분양정보<br>
			<em>실시간 추천 분양정보를 한곳에!</em>
		</p>
		<div class="md_estates">
			<ul>
				<c:forEach var="n" begin="0" end="3">
					<a id="${'md_link'}${n}" href="">
						<li>
							<div><img id="${'md_img'}${n}" src=""></div>
							<span id="${'md_title'}${n}"></span>
							<div id="${'md_detail'}${n}"></div>
						</li>
					</a>
				</c:forEach>
			</ul>
		</div>
	</div>
</section>
<script>
var data_md;
var http_md = new XMLHttpRequest();
http_md.onreadystatechange = function(){
	if(http_md.readyState==4 && http_md.status==200){
		data_md = JSON.parse(this.response);
		view_md();
	}
}
http_md.open("GET","/api_allmd.do",true);
http_md.send();

var common_path = "${common_path}";
function view_md(){
	for(var n=0; n<data_md["md_db"].length;n++) {
		var nth_md = data_md["md_db"][n];
		document.getElementById("md_link"+n).href = nth_md["md_link"];
		document.getElementById("md_img"+n).src = common_path + "/md_room/" + nth_md["md_img"];
		document.getElementById("md_title"+n).innerText = nth_md["md_title"];
		document.getElementById("md_detail"+n).innerText = nth_md["md_detail"];
	}
}
</script>