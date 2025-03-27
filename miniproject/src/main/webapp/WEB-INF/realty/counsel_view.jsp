<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="frm" method="post" action="/counsel_ok.do">
<input type="hidden" name="midx" value="${sessionScope.userDTO.getMidx()}">
<section class="sub">
<p>상담신청</p>
<div>
<span class="list_title">◎ <span style="color: blue;">상담자 정보</span></span>
<ul class="sub_ul">
<li>상담자명</li>    
<li><input type="text" class="sel_input" value="${sessionScope.userDTO.getMname()}" readonly></li> 
<li>이메일</li>    
<li><input type="text" class="sel_input" value="${sessionScope.userDTO.getMemail()}" readonly></li> 
<li>연락처</li>    
<li><input type="text" class="sel_input" value="${sessionScope.userDTO.getMmobile()}" readonly></li> 
<li>임대형태</li>    
<li>
<label><input type="checkbox" name="rental_type" value="public_rental" class="sel_check"> 공공임대</label>
<label><input type="checkbox" name="rental_type" value="private_rental" class="sel_check"> 민간임대</label>
<label><input type="checkbox" name="rental_type" value="private_sale" class="sel_check"> 민간분양</label>
<label><input type="checkbox" name="rental_type" value="other" class="sel_check"> 기타</label>
</li>   
<li>주거형태</li>    
<li>
<label><input type="checkbox" name="housing_type" value="apartment" class="sel_check"> 아파트</label>
<label><input type="checkbox" name="housing_type" value="villa_house" class="sel_check"> 빌라,단독주택</label>
<label><input type="checkbox" name="housing_type" value="office_building" class="sel_check"> 사무실.상가.빌딩</label>
</li>       
<li>상담일시</li>    
<li>
<input type="date" name="preferred_date" class="sel_input2"> * 해당 일시에 맞춰서 담당자가 연락 드립니다.   
</li>    
<li>상담내용</li>    
<li style="height: 150px !important; line-height: 150px;">
<textarea name="ctext" class="sel_input3" placeholder="구체적인 상담내용을 입력해 주세요"></textarea>
</li>
</ul>
</div>
<div><input type="button" value="상담신청" onclick="gopage()"></div>
</section>
</form>
<script>
function gopage(){
	frm.submit();
}
</script>