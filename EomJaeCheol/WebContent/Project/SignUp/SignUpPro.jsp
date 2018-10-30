<%@page import="com.member.model.MemberBeanDTO"%>
<%@page import="com.member.model.MemberDAO"%>
<%@ page import="com.DatabaseContents.Action.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	//한글 처리
	request.setCharacterEncoding("UTF-8"); 
%>
	<jsp:useBean id="memberBean" class="com.member.model.MemberBeanDTO"></jsp:useBean>
    <jsp:setProperty property="*" name="memberBean"/>

<%
	String email=request.getParameter("email");
	String id=request.getParameter("id");
	MemberDAO mdao=new MemberDAO();
	SHA256.getSHA256(email);
	memberBean.setUserEmailHash(SHA256.getSHA256(email));
	memberBean.setUserEmailChecked(false);
	
	int check=mdao.insertMember(memberBean);
	
	if(check==1){
		session.setAttribute("id", id);
		response.sendRedirect("emailSendAction.jsp");
	}else{
		%>
		<script type="text/javascript">
		alert("회원가입 실패!!");
		location.href="../main.jsp";
		</script>
	<%
	}
%>
</body>
</html>