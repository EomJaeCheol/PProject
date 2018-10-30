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
	
	String name=request.getParameter("name");
	String phone1=request.getParameter("phone1");
	String phone2=request.getParameter("phone2");
	String phone3=request.getParameter("phone3");
	
	dto.setName(name);
	 System.out.println(dto.getName());
	dto.setPhone1(phone1);	dto.setPhone2(phone2);	dto.setPhone3(phone3);
	String User_pass=dao.Search_pass(dto);
	
	 if(User_pass!=null){
		 %>
		 <h1><%=User_pass%></h1>
		 <%
	 }else{
		 %>
		 	<script type="text/javascript">
		 	alert("이름이 일치하지 않거나 휴대폰 번호가 틀렸습니다!");
		 	location.href="UseridChk.jsp";
		 	</script>
		 <%
	 }
%>
</body>
</html>