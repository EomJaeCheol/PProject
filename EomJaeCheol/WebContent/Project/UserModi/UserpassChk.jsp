<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- <script src="../UserJs/id_search1.js"></script>
<script src="../UserJs/id_search2.js"></script> -->
<script type="text/javascript">

function id_search1(){
	var frm = document.idinfo;
	
	if(frm.name.value.length<1){
		frm.nametext1.value="이름을 입력해주세요!";
		return;
	}
	if(frm.name.value.length>1){
		frm.nametext1.value="";
		frm.phone1.focus();
	}
	
	
	if(frm.phone1.value.length<2 || frm.phone1.value.length>4 || frm.phone1.value.length==""){
		frm.nametext2.value="휴대폰 앞번호를 정확히 입력하세요!";
		return;
	}else{
		frm.phone2.focus();
	}
	
	if(frm.phone2.value.length<2 || frm.phone3.value.length>4){
		frm.nametext2.value="휴대폰 중간번호를 정확히 입력하세요!";
		return;
	}else{
		frm.phone3.focus();
	}
	
	if(frm.phone3.value.length<2 || frm.phone3.value.length>4){
		frm.nametext2.value="휴대폰 뒷번호를 정확히 입력하세요!";
		return;
	}
	
	frm.method="post";
	frm.action="UserpassChkPro.jsp";
	frm.submit();
}	
	 function checkEmail() {
		  var frm = document.idinfo;
		  var regExp = '/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/';
		  if (!regExp.test(frm.email.value)) {
		   alert('올바른 email을 입력해주세요.');
		   frm.email.focus();
		  }
	}

</script>
<body>
<h1>비밀번호 찾기</h1><h2>회원정보에 등록한 정보로 인증</h2>
<span><b>이름, 휴대폰 번호로 찾기</b></span><br><br><br>
<form name="idinfo">
<b>이름</b> : <input type="text" name="name" style="width: 70px" maxlength="10">
<input type="text" name="nametext1" style="border:0; color: red">
<br><br>
<b>휴대폰</b> : <input type="text" name="phone1" maxlength="3" style="width: 50px"> - <input type="text" name="phone2" maxlength="4" style="width: 70px"> - 
<input type="text" name="phone3" maxlength="4" style="width: 70px">
<input type="text" name="nametext2" style="border:0; color: red">
<br><br>

<input type="button" value="찾기" onclick='id_search1()'>
<input type="button" value="취소" onclick='window.close()'><br><br><br>

</form>
</body>
</html>