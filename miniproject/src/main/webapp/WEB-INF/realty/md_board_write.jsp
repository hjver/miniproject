<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천분양 정보 게시판</title>
<link rel="stylesheet" type="text/css" href="${common_path}/css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="${common_path}/css/md_board_view.css?v=6">
<script src="${common_path}/ckeditor/ckeditor.js"></script>
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
    <form id="frm" method="post" action="md_board_write_ok.do" enctype="multipart/form-data">
    <section class="sub">
        <p>추천분양 정보 게시판</p>
        <div class="boards">이번주 신규 매물정보를 한눈에 확인하실 수 있습니다.</div>
        <div class="info_board">
          <ul>
            <li>제&nbsp;&nbsp;&nbsp;목</li>
            <li><input type="text" class="board_in2" name="md_title"></li>
            <li>글쓴이</li>
            <li><input type="text" class="board_in1" name="nwriter" value="관리자" readonly></li>
            <li>썸네일 이미지</li>
            <li><input type="file" name="nfile" accept="image/*"></li>
            <li class="litext">내&nbsp;&nbsp;&nbsp;용</li>
            <li class="litext">
                <textarea id="board_text" name="md_detail">
                    
                </textarea>
            </li>
          </ul>
        </div>
        <div class="board_btn">
            <input type="button" value="등&nbsp;&nbsp;&nbsp;록" class="btns" onclick="write_ok()">
        </div>
    </section>
    </form>
    <script>
    window.onload = function(){
        CKEDITOR.replace('board_text',{
            height : 360
        });
    };
    </script>
</main>

<footer>
  <!-- 카피라이터 -->
  <%@ include file="./copyright.jsp"%>
</footer>

</body>
<script>
function write_ok(){
	var file = frm.nfile.files[0];
	
	if(frm.md_title.value == ""){
		alert("제목을 입력해 주세요.");
		frm.md_title.focus();
	}
	else if(!file){
		alert("이미지 파일을 첨부해 주세요.");
	}
	else if(file.size > 2*1024*1024){
		alert("2MB 이하의 이미지 파일만 첨부할 수 있습니다.");
	}
	else if(!file.type.startsWith("image/")){
		alert("이미지 파일만 첨부할 수 있습니다.");
	}
	else if(CKEDITOR.instances.board_text.getData().trim() == ""){
		alert("내용을 입력해 주세요.");
		CKEDITOR.instances.board_text.focus();
	}
	else{
		CKEDITOR.instances.board_text.updateElement(); // 내용 반영
		frm.submit();
	}    	
}
</script>
</html>