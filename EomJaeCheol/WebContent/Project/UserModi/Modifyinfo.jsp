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
<h1> 정 보 수 정</h1>
<%
	//세션값 유지
	 String id=(String)session.getAttribute("id");
	
	System.out.println("세션: "+id);
	if(id==null){
		response.sendRedirect("../Student.jsp");
	}
	//한글처리 업데이트 폼에서 들고오는데 한글이 있으므로
	request.setCharacterEncoding("UTF-8");
	
/* 	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	String year = request.getParameter("birth1");
    String month =request.getParameter("birth2");
    String day = request.getParameter("birth3");
    
    Date brith = Date.valueOf(year+"-"+month+"-"+day);
	
	
	//MemberBean 객체를 사용해서 모두 저장
 	MemberBeanDTO member =new MemberBeanDTO();
	member.setId(id);
	member.setPass(pass);
	member.setName(name);
	member.setEmail(email);
	 */
	
%>
 	 <jsp:useBean id="MemberBean" class="com.member.model.MemberBeanDTO"></jsp:useBean>
    <jsp:setProperty property="*" name="MemberBean"/>   
<%
	MemberDAO mdao=new MemberDAO();
	//=> 자바스크립트 사용
	// 1  수정 성공
	// 0 비밀번호 오류
	// -1 아이디 없음
	
	int check=mdao.updateMember(MemberBean);
	System.out.print(check);
	
	if(check==1){
		%>
			<script type="text/javascript">
			alert("수정 성공");
			//location.href="../Student.jsp";
			window.opener.top.location.href="../Student.jsp";
			//window.opener.top.location.reload();//새로고침
			window.close();
			</script>
		<%
		
	}else if(check==0){
		%>
		<script type="text/javascript">
		alert("비밀번호 오류");
		history.back();
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("아이디 없음");
		history.back();
		</script>
		<%
		
	}
	
	
%>
</body>
</html>