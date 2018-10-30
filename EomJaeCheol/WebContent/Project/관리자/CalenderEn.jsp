
<%@page import="com.member.model.CalenderDateDAO"%>
<%@page import="com.member.model.CalenderDateDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String date=request.getParameter("Date");
	String Content=request.getParameter("Content");
	System.out.println(date);
	System.out.println(Content);
	
	
	CalenderDateDTO cdto=new CalenderDateDTO();
	CalenderDateDAO cdao=new CalenderDateDAO();
	
	cdto.setDate(date);	cdto.setContent(Content);
	
	int check=cdao.insertDate(cdto);
	// 1 성공
	// -1 실패
%>

</body>
</html>