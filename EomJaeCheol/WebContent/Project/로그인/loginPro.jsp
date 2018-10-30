<%@page import="com.member.model.ConnectDAO"%>
<%@page import="com.DatabaseContents.Action.Naver"%>
<%@page import="com.member.model.ConnectDTO"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.INSTANCEOF"%>
<%@page import="com.member.model.StudentInfoBeanDTO"%>
<%@page import="com.member.model.MemberBeanDTO"%>
<%@page import="com.member.model.MemberDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
</head>
<body>
<!-- 디비 처리  -->
<jsp:useBean id="mdao" class="com.member.model.MemberDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.member.model.StudentInfoBeanDTO"></jsp:useBean>
<jsp:useBean id="dao" class="com.member.model.StudentInfoDAO"></jsp:useBean>
<%
	//네이버 시간을 가져옴
	Naver t = new Naver();
	String Time = t.Time();
	//Connect 객체생성
	ConnectDTO con = new ConnectDTO();
	ConnectDAO conn = new ConnectDAO();
%>
<!-- 숫자인자 문자인가  -->
<%!public static boolean isNumber(String str) {
		boolean check = true;
		for (int i = 0; i < str.length(); i++) {
			if (!Character.isDigit(str.charAt(i)))

			{
				check = false;
				break;
			}
		}
		return check;
	}//isNumber 
%>
	<%
		request.setCharacterEncoding("UTF-8");
			
			//Student.jsp에서 온다.
			String id= request.getParameter("id");
			String pass=request.getParameter("pass");
			
			
		//일반 유저
		if(isNumber(id)==false){
		boolean UseremailChecked = mdao.getUserEmailChecked(id);
		if(UseremailChecked == false) {
			//System.out.println("if문 진입!");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디가 없거나 이메일 인증 후에 사용을 해주세요.');");
			script.println("location.href = '../Student.jsp'");
			script.println("</script>");
			script.close();		
			return;
			}
		}
			
		//학생
		if(isNumber(id)==true){
		int Stuid = Integer.parseInt(request.getParameter("id"));
		String Stupass = request.getParameter("pass"); 
		StudentInfoBeanDTO Stuname = dao.read(Stuid);
		//학생 이름을 가져오기 위해 객체 선언
		int Stucheck = dao.idCheck(Stuid, Stupass);
		

			if (Stucheck == 1) {
				String ip = request.getParameter("ip");
				con.setLoginDay(Time);
				con.setIp(ip);
				con.setSuccess(true);
				con.setLoginerror("*");
				con.setRemark("학생");
				conn.insertWhois(con);
				//테이블 내 데이터 삽입 끝
				
				session.setAttribute("Error", "true");
				//session.setAttribute("name", "tt");
				session.setAttribute("StuName", Stuname.getName());
				response.sendRedirect("../StudentPage.jsp");
				//System.out.println(Stucheck);
			} else if (Stucheck == 0) {
				String ip = request.getParameter("ip");
				con.setLoginDay(Time);
				con.setIp(ip);
				con.setSuccess(false);
				con.setLoginerror("비밀번호 에러");
				con.setRemark("학생");
				conn.insertWhois(con);
				session.setAttribute("Fail", "false");
				//response.sendRedirect("../StudentPage.jsp");
			%>
				<script type="text/javascript">
				//alert("아작스 통과전");
			 	/* $(document).ready(function(){
					var ses="false";
					$.ajax({
						type:"POST",
						url:"../StudentPage.jsp",
					 	data:
						{
					 		//idses:ses
					 		//"idses":"false"
							idses:ses
						}
					});
				});  */
					alert("비밀번호가 틀립니다.");
					history.back();
				</script>
			<%
			
		}else if(Stucheck == -1){
			String ip = request.getParameter("ip");
			con.setLoginDay(Time);
			con.setIp(ip);
			con.setSuccess(false);
			con.setLoginerror("아이디 오류");
			con.setRemark("학생");
			conn.insertWhois(con);
			session.setAttribute("Fail", "false");
			//response.sendRedirect("../StudentPage.jsp");
			%>
				<script type="text/javascript">
					alert("아이디가 존재하지 않습니다.");
					history.back();
					//location.href="../StudentPage.jsp";
				</script>
			<%
		}
	}
		/* for(int i=0;i<id.length();i++){
			char ch = id.charAt(i);
			
			if('0'<=ch && ch <='9'){
				Integer.parseInt(request.getParameter("id"));
			}else{
				'a' <=ch && ch<='z'
				
			}
		} */
		//id,pass 해당하는 회원정보 찾아오기
		//아이디, 비밀번호 둘다 같다 => 1 리턴
		//아이디만 같다 => 0 리턴
		//아이디가 다르다 => -1 리턴
if(isNumber(id)==false){
		int check = mdao.idCheck(id, pass);

		//일반 유저 이름을 가져오기 위해 객체 선언
		MemberBeanDTO name = mdao.getMember(id);

		if (check == 1) {
			String ip = request.getParameter("ip");
			con.setLoginDay(Time);
			con.setIp(ip);
			con.setSuccess(true);
			con.setLoginerror("*");
			con.setRemark("유저");
			conn.insertWhois(con);
			
			session.setAttribute("Error", "true");
			session.setAttribute("id", id);
			session.setAttribute("name", name.getName());
			response.sendRedirect("../StudentPage.jsp");
		} else if (check == 0) {
			String ip = request.getParameter("ip");
			con.setLoginDay(Time);
			con.setIp(ip);
			con.setSuccess(false);
			con.setLoginerror("비밀번호 에러");
			con.setRemark("유저");
			conn.insertWhois(con);
			session.setAttribute("Fail", "false");
			//response.sendRedirect("../StudentPage.jsp");
		%>
	<script type="text/javascript">
				alert("비밀번호가 틀립니다.");
				history.back();
			</script>
		<%
	}else{
		String ip = request.getParameter("ip");
		con.setLoginDay(Time);
		con.setIp(ip);
		con.setSuccess(true);
		con.setLoginerror("아이디 오류");
		con.setRemark("유저");
		conn.insertWhois(con);
		session.setAttribute("Fail", "false");
		//response.sendRedirect("../StudentPage.jsp");
		%>
		<script type="text/javascript">
			alert("아이디가 존재하지 않습니다.");
			history.back();
		</script>
		<%
	}
}
%>
</body>
</html>