<%@page import="java.sql.Date"%>
<%@page import="com.member.model.MemberBeanDTO"%>
<%@page import="com.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회 원 탈 퇴</h1>
<%
	//세션값 유지
	 String id=(String)session.getAttribute("id");
	
	System.out.println("세션: "+id);
	if(id==null){
		response.sendRedirect("../Student.jsp");
	}
	//한글처리 업데이트 폼에서 들고오는데 한글이 있으므로
	request.setCharacterEncoding("UTF-8");
	
	  id = request.getParameter("id");
	  String pass = request.getParameter("pass");
	  
	  MemberDAO mdao=new MemberDAO();
	  
	  //삭제시 아이디와 비빌번호가 필요하므로 가지고 이동~
	  int check= mdao.deleteMember(id,pass);
	  
	  if(check==1){
		  session.invalidate();
		  %>
		  <script type="text/javascript">
		  alert("회원탈퇴 성공");
		  window.opener.top.location.href="../Student.jsp";
			//window.opener.top.location.reload();//새로고침
			window.close();
		  </script>
		  <%
	  }else if(check==0){
		  %>
		  <script type="text/javascript">
		  alert("비밀번호가 다릅니다.");
		  history.back();
		  </script>
		  <% 
	  }else{
		  %>
		  <script type="text/javascript">
		  alert("아이디가 존재 하지 않습니다.");
		  history.back();
		  </script>
		  <%
	  }
	  
	%>
</body>
</html>