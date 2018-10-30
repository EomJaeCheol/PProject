<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../UserJs/UseridChk.js"></script>
</head>
<body>
<h1>아이디 찾기 회원정보에 등록한 정보로 인증</h1>
<span><b>이름, 휴대폰 번호로 찾기</b></span><br><br><br>
<form name="idinfo">
<b>이름</b> : <input type="text" name="name" style="width: 70px" maxlength="10">
<input type="text" name="nametext1" style="border:0; color: red">
<br><br>
<b>휴대폰</b> : <input type="text" name="phone1" maxlength="3" style="width: 50px"> - <input type="text" name="phone2" maxlength="4" style="width: 70px"> - 
<input type="text" name="phone3" maxlength="4" style="width: 70px">
<input type="text" name="nametext2" size="50" style="border:0; color: red;" value="">
<br><br>

<input type="button" value="찾기" onclick='id_search1()'>
<input type="button" value="취소" onclick='window.close()'><br><br><br>


<span><b>이름, 이메일 주소로 찾기</b></span><br><br><br>
<b>이름</b> : <input type="text" name="name1" style="width: 70px" maxlength="10">
<input type="text" name="nametext3" style="border:0; color: red">
<br><br>
<b>이메일</b> : <input type="text" name="email" maxlength="20" style="width: 150px" onblur="checkEmail()"> 
<input type="text" name="nametext4" style="border:0; color: red" value="">
<br><br>

<input type="button" value="찾기" onclick='id_search2()'>
<input type="button" value="취소" onclick='window.close()'>
</form>
</body>
</html>