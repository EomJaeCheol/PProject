function id_search1(){
	var frm = document.idinfo;
	
	if(frm.name.value.length<1){
		frm.nametext1.value="이름을 정확히 입력해주세요!";
		return;
	}
	if(frm.name.value.length>1){
		frm.nametext1.value="";
		frm.phone1.focus();
	}
	
	
	if(frm.phone1.value.length<2 || frm.phone1.value.length>4 || frm.phone1.value.length==""){
		frm.nametext2.value="휴대폰 번호를 정확히 입력하세요!";
		return;
	}else{
		frm.phone2.focus();
	}
	
	if(frm.phone2.value.length<2 || frm.phone3.value.length>4){
		frm.nametext2.value="휴대폰 번호를 정확히 입력하세요!";
		return;
	}else{
		frm.phone3.focus();
	}
	
	if(frm.phone3.value.length<2 || frm.phone3.value.length>4){
		frm.nametext2.value="휴대폰 번호를 정확히 입력하세요!";
		return;
	}
	
	frm.method="post";
	frm.action="UseridChkPro.jsp";
	frm.submit();
}	
	
	function id_search2(){
		var frm = document.idinfo;
		if(frm.name1.value.length<1){
			frm.nametext3.value="이름을 입력해주세요!";
			return;
		}
		if(frm.name1.value.length>1){
			frm.nametext3.value="";
			frm.email.focus();
		}
		
		if (frm.email.value.length < 1) {
			frm.nametext4.value="이메일을 입력해주세요!";
		  	return;
		 }
		
		  frm.method = "post";
		  frm.action = "UseridChkPro2.jsp"; 
		  frm.submit();
	}
	
	 function checkEmail() {
		   var frm = document.idinfo;
		  var regExp = /^\w+@\w+\.\w+$/;
		  if (!regExp.test(frm.email.value)) {
			  frm.nametext4.value="올바른 이메일을 입력해주세요!";
			  frm.email.focus();
			  return;
		  }else{
			  frm.nametext4.value="";
		  }
	}