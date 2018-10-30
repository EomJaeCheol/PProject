<%@page import="java.io.PrintWriter"%>
<%@page import="com.DatabaseContents.Action.SHA256"%>
<%@page import="com.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	MemberDAO mdao = new MemberDAO();
	
	//if(id==null){
		//%>
			<!-- <script type="text/javascript">
				alert("로그인을 해주세요!");
				location.href='../Student.jsp';
			</script> -->
		//<% 
		//response.sendRedirect("../Student.jsp");
	//}
	String id = (String) session.getAttribute("id");
	if (id == null) {
		response.sendRedirect("../Student.jsp");
	}
	
	String userEmail = mdao.getUserEmail(id);

	boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;

	if(rightCode == true) {

		mdao.setUserEmailChecked(id);

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공했습니다.');");
		script.println("location.href = '../Student.jsp'");
		script.println("</script>");
		script.close();		
		return;
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 코드입니다.');");
		script.println("location.href = 'SignUp.jsp'");
		script.println("</script>");
		script.close();		
		return;
	}
%>