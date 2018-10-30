<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>O O 정보 시스템</title>
<style type="text/css">

#wrap { 
   width: 920px;   min-height: 900px; 
    margin: 10px auto;
   background-image: url("img/main.jpg");
   background-repeat: no-repeat;
   background-position: cover;
   position: relative;
 }
#inje{
	width: 20%;
	height:auto;
    vertical-align: middle;
    position:absolute;
    top:15%;
    left:45%;
} 
 .txt {
     width :  600px;  height:100px;
     padding : 20px;
     font-size: 1.1em;
     letter-spacing: -0.12em;
     line-height: 1.8;  
     transition: all 1.2s;
     position: absolute; 
     left: 300px; top:-1000px;
   }
      
#wrap:HOVER .txt {top:300px;}
nav ul{
 		padding-top:10px;
}
nav ul li{
		 display:inline;
		 text-decoration:none;                   
         border-left:1px solid #999;
         /* border-right:1px solid #999;  */           
         font:bold 18px Malgun Gothic;
         letter-spacing: 2px;
         padding:0 15px; 
}
na ul li:FIRST-CHILD{border-left:none;}
li a{
	text-decoration: none;
    color: black;
}

</style>

</head>
<body>
 <div id="wrap">
  <img id="inje" alt="inje로고" src="img/logo.jpg">
  
   <nav class="txt">
    <ul>
     <li><a href="Student.jsp">학생용</a></li>
     <li><a href="#">교직원용</a></li>
     <li><a href="#">수강신청</a></li>
    </ul>
   </nav>
 </div>
 


</body>
</html>