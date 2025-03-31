<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<section>
  <div class="weekdays">
    <p>금주분양 매물정보<br><em>이번주 신규 매물정보!</em></p>
    <div class="week_estates">
      <ul id="typeList">
      	<!-- 동적으로 li 항목이 추가됩니다. -->
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
http.open("GET","/api_alltype.do",false);
http.send();

function view() {
    var list = document.getElementById("typeList");

    // data["type_db"] 배열을 순회하며 각 항목을 추가
    for (var i = 0; i < data["type_db"].length; i++) {
        var li = document.createElement("li");
        var a = document.createElement("a");

        // 동적으로 id를 만들어서 할당
        var spanTag = document.createElement("span");
        spanTag.id = "btag" + i;
        spanTag.innerText = data["type_db"][i]["bunyang_tag"];

        var divTitle = document.createElement("div");
        divTitle.id = "btitle" + i;
        divTitle.innerText = data["type_db"][i]["bunyang_title"];

        var asideAddr = document.createElement("aside");
        asideAddr.id = "baddr" + i;
        asideAddr.innerText = data["type_db"][i]["bunyang_addr"];

        var spanPart = document.createElement("span");
        spanPart.id = "bpart" + i;
        spanPart.innerText = data["type_db"][i]["bunyang_part"] + " | " + data["type_db"][i]["bunyang_info"];

        var labelDate = document.createElement("label");
        labelDate.id = "bdate" + i;
        labelDate.innerText = data["type_db"][i]["bunyang_date"] + " | " + data["type_db"][i]["bunyang_in"];

        var divImg = document.createElement("div");
        var img = document.createElement("img");
        img.id = "bimg" + i;
        img.src = "${common_path}/room/" + data["type_db"][i]["bunyang_img"];
        divImg.appendChild(img);

        // a 요소에 모든 자식 요소 추가
        a.appendChild(spanTag);
        a.appendChild(divTitle);
        a.appendChild(asideAddr);
        a.appendChild(spanPart);
        a.appendChild(labelDate);
        a.appendChild(divImg);

        // li 요소에 a 요소 추가
        li.appendChild(a);

        // ul 요소에 li 요소 추가
        list.appendChild(li);
    }
}
</script>