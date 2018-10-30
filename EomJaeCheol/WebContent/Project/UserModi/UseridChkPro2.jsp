<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:useBean id="dto" class="com.member.model.MemberBeanDTO"></jsp:useBean>
<jsp:useBean id="dao" class="com.member.model.MemberDAO"></jsp:useBean>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name=request.getParameter("name1");
	String email=request.getParameter("email");
	
	dto.setName(name);
	dto.setEmail(email);
	
	String User_id=dao.Search_id2(dto);
	 if(User_id!=null){
		 %>
		 <script type="text/javascript">
		 	alert('찾는아이디는'+'<%=User_id%>');
		 	window.close();
		 </script>
		 <%
	 }else{
		 %>
		 	<script type="text/javascript">
		 	alert("이름이 일치하지 않거나 이메일 주소가 틀렸습니다!");
		 	location.href="UseridChk.jsp";
		 	</script>
		 <%
	 }
%>
</body>
</html>