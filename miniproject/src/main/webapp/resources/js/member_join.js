function member_join(){

	var reg_email = /^[a-z0-9]([a-z0-9-_.])+@[a-z0-9ㄱ-힇-_]+\.[a-z0-9ㄱ-힇]{2,}/i; //이메일 정규식 
	var reg_mobile = /010[2-9]{1}[0-9]{7}/; //휴대폰번호 정규식
	var passwd1 = frm.mpasswd.value;
	var passwd2 = document.getElementById("passwd2").value
	
	if(frm.memail.value==""){
		alert("이메일주소를 입력 하세요.");
		frm.memail.focus();
	}
	else if(reg_email.test(frm.memail.value)==false){
		alert("이메일 주소를 정확히 입력하세요.");
		frm.memail.value=="";
		frm.memail.focus();
	}
	else if(document.getElementById("emailck").value==""){
		alert("이메일 중복체크를 하세요.");
	}
	else if(frm.mpasswd.value==""){
		alert("패스워드를 입력하세요.");
		frm.mpasswd.focus();
	}
	else if(passwd1 != passwd2){
		alert("동일한 패스워드를 입력하세요.");
	}
	else if(frm.mname.value==""){
		alert("이름을 입력하세요.");
		frm.mname.focus();
	}
	else if(frm.mmobile.value==""){
		alert("휴대폰 번호를 입력하세요.");
		frm.mmobile.focus();
	}
	else if(reg_mobile.test(frm.mmobile.value)==false){
		alert("휴대폰 번호를 정확히 입력하세요.");
		frm.mmobile.value=="";
		frm.mmobile.focus();
	}
	else if(!frm.age_over14.checked || !frm.terms_agree.checked || !frm.privacy_agree.checked) {
		alert("필수동의사항은 체크해야 합니다.")
	}
	else{
		frm.submit();
	}
}

//이메일 중복체크 사항
function email_check(){
	var reg_email = /^[a-z0-9]([a-z0-9-_.])+\@[a-z0-9ㄱ-힇-_]+\.[a-z0-9ㄱ-힇]{2,}/i; //이메일 정규식 
	if(frm.memail.value==""){
		alert("이메일 주소를 입력하세요.");
		frm.memail.focus();
	}
	else if(reg_email.test(frm.memail.value)==false){
		alert("이메일 주소를 정확히 입력하세요.");
		frm.memail.value=="";
		frm.memail.focus();
	}
	else{
		//Ajax (Back-end 통신)
		ajaxpost(frm.memail.value);
	}
}

//Ajax 함수를 이용하여 중복 체크
function ajaxpost(data){
	console.log(data);
	var xhr = new XMLHttpRequest(); // XMLHttpRequest 객체 생성
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState==XMLHttpRequest.DONE && xhr.status==200){
			if(xhr.responseText == "ok"){
				alert("중복되지 않는 이메일입니다.");
				document.getElementById("emailck").value = "ok";
				frm.memail.readOnly = true; 
			}
			else if(this.response == "no"){
				alert("해당 이메일은 이미 가입된 이메일 입니다.");
				frm.memail.value = "";
			}
		}
	};

	xhr.open("GET","/email_check.do?memail="+data,true);
	xhr.send(); 
}

//전체 체크박스 선택/해제
function all_check(z) {
    var checkboxes = document.querySelectorAll('.agree');
    checkboxes.forEach(function (checkbox) {
        checkbox.checked = z;
    });
}

//개별 체크 상태에 따라 전체 동의 체크박스 컨트롤
function agree_check() {
    var checkboxes = document.querySelectorAll('.agree');
    var allChecked = true;
    checkboxes.forEach(function (checkbox) {
        if (!checkbox.checked) {
            allChecked = false;
        }
    });
    document.getElementById("all").checked = allChecked;
}
