function joinok(){

	var reg_email = /^[a-z0-9]([a-z0-9-_.])+\@[a-z0-9ㄱ-힇-_]+\.[a-z0-9ㄱ-힇]{2,}/i; //이메일 정규식 
	var reg_mobile = /010[2-9]{1}[0-9]{7}/; //휴대폰번호 정규식
	var passwd1 = frm.mpasswd.value;
	var passwd2 = document.getElementById("passwd2").value
	
	
	if(frm.memail.value==""){
		alert("이메일주소를 입력후 중복체크를 하세요.");
		frm.memail.focus();
	}
	else if(reg_email.test(frm.aemail.value)==false){
		alert("이메일 주소를 정확히 입력하세요.");
		frm.aemail.value=="";
		frm.aemail.focus();
	}
	else if(document.getElementById("emailck").value==""){
		alert("아이디 중복체크를 하세요.");
	}
	else if(frm.mpasswd.value==""){
		alert("패스워드를 입력하세요.");
		frm.apassword.focus();
	}
	else if(passwd1 != passwd2){
		alert("동일한 패스워드를 입력하세요.");
	}
	else if(frm.mname.value==""){
		alert("이름을 입력하세요.");
		frm.aname.focus();
	}
	else if(frm.mmobile.value==""){
		alert("전화번호를 입력하세요.");
		frm.mmobile.focus();
	}
	else if(reg_mobile.test(frm.mmobile.value)==false){
		alert("휴대폰번호를 정확히 입력하세요.");
		frm.mmobile.value=="";
		frm.mmobile.focus();
	}
	else{
		frm.submit();
	}
	
}

//아이디 중복체크 사항
function idcheck(){
	var reg_email = /^[a-z0-9]([a-z0-9-_.])+\@[a-z0-9ㄱ-힇-_]+\.[a-z0-9ㄱ-힇]{2,}/i; //이메일 정규식 
	if(frm.memail.value==""){
		alert("이메일 주소를 입력하세요.");
		frm.aemail.focus();
	}
	else if(reg_email.test(frm.aemail.value)==false){
		alert("이메일 주소를 정확히 입력하세요.");
		frm.aemail.value=="";
		frm.aemail.focus();
	}
	else{
		//Ajax (Back-end 통신)
		ajaxpost(frm.memail.value);
	}
}

//Ajax 함수를 이용하여 중복 체크
function ajaxpost(data){
	var xhr = new XMLHttpRequest(); // XMLHttpRequest 객체 생성
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState==XMLHttpRequest.DONE && xhr.status==200){
			if(xhr.response == "ok"){
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

	ok.open("GET","./email_check.do?memail="+data,true);
	ok.send(); 
}