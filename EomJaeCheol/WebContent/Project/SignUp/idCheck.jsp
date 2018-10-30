<%@page import="com.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
    function result(){
    	// 중복체크된 id값을 회원가입 페이지 id값에 대입 
    	// 회원가입(join.jsp)에서 새창 열기로(window open()) 창을 열어서 체크하기 때문에
    	// 두개의 페이지가 다른상태이다 그래서 부모역활을 하는 페이지(새창열기를 해준 페이지)는
    	// opener 객체를 사용해서 접근해야한다. 
    	opener.document.frr.id.value = document.wfr.fid.value;
    	// 새창 닫기 
    	window.close();
    }
</script>
<style type="text/css">
#msg{

	border:3px solid red;
	width:100px;
	height: 100px;
}

</style>
</head>
<body>
<%
 // 한글처리 
 request.setCharacterEncoding("UTF-8");

 // 회원가입 창에서 전달된 ID값 받아오기 
 String id = request.getParameter("fid");
 
 // 디비 객체 생성
 MemberDAO mdao = new MemberDAO();
 int check = mdao.joinIdCheck(id);
 
 // 아이디 존재유무 체크
 //  0/1  
 // 0 - 중복된 아이디 없음-> "사용가능한 아이디 입니다."
 // 1 - 중복된 아이디가 있다 -> "사용중인 아이디 입니다."

 if(check == 1){
	 %>
	 	<script type="text/javascript">
	 		$(function(){
	 		   $('.idtext').css("color","red").text('이미 사용중인 아이디 입니다!');
	 		   $('#useBtn').hide();
	 		 });
	 	</script>
	 <%
 }else{
	 %>
		<script type="text/javascript">
			$(function() {
				$('.idtext').css("color", "red").text('사용가능한 아이디 입니다!');
				$('#useBtn').show();
			});
		</script>
	<%
 }

%>
<br>
    <b><font size="4" color="gray">아이디 중복체크</font></b>
    <hr size="1">
    <br>
<br><br>
<form action="idCheck.jsp" method="post" name="wfr">
  <input type="text" name="fid" value="<%=id%>">
  <input type="submit" value="중복확인"> <br><br>
  <div class="idtext"></div><br>
  <input type="button" id="cancelBtn" value="취소" onclick="window.close()">
  <input type="button" id="useBtn" value="사용하기" onclick="result()">
</form>
</body>
</html>