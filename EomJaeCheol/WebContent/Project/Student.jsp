<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="PagePaint/Student.css" rel="stylesheet">
<!-- 구글 app 사용, 클라이언트ip 가져옴 -->
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="UserJs/Student.js"></script>
<script type="text/javascript">

	var imgArray = new Array();

	imgArray[0] = "img/봄1.jpg";
	imgArray[1] = "img/봄2.jpg";
	imgArray[2] = "img/가을.png";
	imgArray[3] = "img/겨울.jpg";

		function showImage() {
		//alert("함수입장!");
		var imgNum = Math.round(Math.random() * 3);
		var objImg = document.getElementById("introImg");
		objImg.src = imgArray[imgNum];
		setTimeout("showImage()", 1500);
	}
</script>
<style type="text/css">
.Infotext{
    font-weight: bold;
    font-size: 9pt;
    cursor: default;
    color: #1b70c1;
    font-family: arial;
    text-decoration:none;
    text-indent: 3%;
   }
.Subtext{
	font-size: 9pt;
    cursor: default;
    color: #000000;
    font-family: arial;
    text-decoration: none;
    text-indent: 3%;
}
</style>
<style type="text/css">
.BoxText1{
	margin-top:-88px;
	width:200px;
	height:100px;
}
.BoxText2{
 	margin-top:-30px;
	width:200px;
	border: 0;
}
</style>
</head>
<body onload="showImage()">
	 <aside>
		<div class="test"><img alt="Top_logo" src="img/Top_logo.jpg"></div>
		<div class="left_menu">
			<form action="로그인/loginPro.jsp" method="post" name="infoinfo">
					<table>
						<tr>
							<td>
						 		<input class="id" type="text" placeholder="아이디" name="id" id="infotext">
							</td><br>
							<td rowspan="2" class="login">
								<input type="submit" value="">
							</td>
						</tr>
						<tr>
							<td><input class="password" type="password" name="pass" placeholder=" 비밀번호"></td>
							<td><input type="hidden" name="ip" id="ip" value=""></td>
						</tr>
					</table>
			</form>
					<table>
						<tr>
							<td colspan="9">
								<input class="join" type="button" name="join" value="회원가입"
							 	onclick="location.href='SignUp/SignUp.jsp'">
							</td>
						</tr>
						<tr>
						<td class="info" colspan="2">
							<input type="button" name="SearchID" value="아이디 찾기" onclick='idChk()'>
							<input type="button" name="SearchPass" value="비밀번호 찾기" onclick='passChk()'>
						</td>
						</tr>
						<tr>
							<td class="BoxText1"></td>
						</tr>
					</table>
					<table class="BoxText2">
						<tr><td></td></tr>
					</table>
			</div>
		</aside>
		<nav>
			<div>
				<a href="main.jsp">홈</a>
				<a href="Enrolment.jsp">수강신청</a>
				<a href="Staff.jsp"> 교직원</a>
				<a href="#" onclick="Enrollment()">등록</a>
			</div>
		</nav>
		<div class="slide">
			<img id ="introImg">
		</div>
</body>
</html>