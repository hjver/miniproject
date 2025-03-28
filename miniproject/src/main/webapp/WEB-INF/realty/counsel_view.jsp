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
<label><input type="checkbox" class="rental" name="rental_type" value="public_rental" class="sel_check"> 공공임대</label>
<label><input type="checkbox" class="rental" name="rental_type" value="private_rental" class="sel_check"> 민간임대</label>
<label><input type="checkbox" class="rental" name="rental_type" value="private_sale" class="sel_check"> 민간분양</label>
<label><input type="checkbox" class="rental" name="rental_type" value="other" class="sel_check"> 기타</label>
</li>   
<li>주거형태</li>    
<li>
<label><input type="checkbox" class="housing" name="housing_type" value="apartment" class="sel_check"> 아파트</label>
<label><input type="checkbox" class="housing" name="housing_type" value="villa_house" class="sel_check"> 빌라,단독주택</label>
<label><input type="checkbox" class="housing" name="housing_type" value="office_building" class="sel_check"> 사무실.상가.빌딩</label>
</li>       
<li>상담일시</li>    
<li>
<input type="date" class="cdate" name="preferred_date" class="sel_input2"> * 해당 일시에 맞춰서 담당자가 연락 드립니다.   
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
document.addEventListener("DOMContentLoaded", function () {
    let today = new Date();
    let yyyy = today.getFullYear();
    let mm = String(today.getMonth() + 1).padStart(2, "0");
    let dd = String(today.getDate()).padStart(2, "0");
    let minDate = yyyy + "-" + mm + "-" + dd; // yyyy-MM-dd 형식
    document.querySelector(".cdate").setAttribute("min", minDate);
});

function gopage(){
	// 현재 날짜를 yyyy-mm-dd로 formatting
	let today = new Date();
	let yyyy = today.getFullYear();
	let mm = String(today.getMonth() + 1).padStart(2, "0"); // 월(0부터 시작하므로 +1)
	let dd = String(today.getDate()).padStart(2, "0");
	let formattedDate = `${yyyy}-${mm}-${dd}`;
	
    // 모든 체크박스를 가져옴
    var checkboxes_1 = document.querySelectorAll(".rental"); //임대형태
    var checkboxes_2 = document.querySelectorAll(".housing"); //주거형태
    
    // 체크박스가 하나라도 체크되었는지 확인
    var isChecked_1 = false;
    checkboxes_1.forEach(function(checkbox) { //임대형태
        if (checkbox.checked) {
            isChecked_1 = true;
        }
    });
    var isChecked_2 = false;
    checkboxes_2.forEach(function(checkbox) { //주거형태
        if (checkbox.checked) {
            isChecked_2 = true;
        }
    });

    if (!isChecked_1) { //임대형태 최소1개 미체크시 알람
        alert("임대형태는 최소한 하나 이상의 옵션을 선택해야 합니다.");
    }
    else if (!isChecked_2) { //주거형태 최소1개 미체크시 알람
        alert("주거형태는 최소한 하나 이상의 옵션을 선택해야 합니다.");
    }
    else if(frm.preferred_date.value==""){
    	alert("상담일시를 선택해 주세요.");
    }
    else if(frm.ctext.value.length < 10){
    	alert("상담 내용을 최소 10자 이상 입력해 주세요.");
    }
    else{
		frm.submit();
	}
}
</script>