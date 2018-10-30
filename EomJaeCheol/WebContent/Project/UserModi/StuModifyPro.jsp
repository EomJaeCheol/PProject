<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="dto" class="com.member.model.StudentInfoBeanDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="dao" class="com.member.model.StudentInfoDAO"></jsp:useBean>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String name = (String) session.getAttribute("StuName");
	//System.out.println("search에서 받은 이름은?"+name);
	int Stu_num = dao.StuNumbersearch(name);
	if (Stu_num == 0) {
		response.sendRedirect("../Student.jsp");
	}
	//System.out.println(dto.getPass());
	String Newpass=request.getParameter("Newpass1");
	dto.setStuNumber(Stu_num);
	//System.out.println(Newpass);
	int check=dao.updateStu(dto,Newpass);
	System.out.println(check);
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