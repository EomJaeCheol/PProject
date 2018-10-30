<%@page import="java.util.Random"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.DatabaseContents.Action.SHA256"%>
<%@page import="com.DatabaseContents.Action.Gmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	

	String email=request.getParameter("email");
	//System.out.println("이메일:" +email);
	
	 StringBuffer temp = new StringBuffer();
	Random rnd = new Random();
	for (int i = 0; i < 6; i++) {
		int rIndex = rnd.nextInt(3);
		switch (rIndex) {
		case 0:
			// a-z
			temp.append((char) ((int) (rnd.nextInt(26)) + 97));
			break;
		case 1:
			// A-Z
			temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			break;
		case 2:
			// 0-9
			temp.append((rnd.nextInt(10)));
			break;
		}
	}
	String code=temp.toString();
	session.setAttribute("code", code);
	
	

	// 사용자에게 보낼 메시지를 기입
	String host = "http://localhost:8088/1/Project/";
	String from = "abctmxk@gmail.com";
	String to = email;
	String subject = "정보 변경 인증번호입니다.";
	String content="인증번호는["+code+"] 입니다.";
	//String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." + "<a href='" + host + "회원가입/emailCheckAction.jsp?code="

	// SMTP에 접속하기 위한 정보
	// 구글 메일이 제공하는 틀
	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");

	try {

		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html;charset=UTF-8");
		Transport.send(msg);

	} catch (Exception e) {
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다..');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} 
%>
<!doctype html>
<html>
<head>
<title>인증!</title>
<meta charset="utf-8">
<style type="text/css">
.Content {
	border: 3px solid black;
	width: 500px;
	height: 150px;
	margin: auto;
}
</style>
<script type="text/javascript">
function numcheck(){
	
	var no1 =document.getElementById("code").value;

	var no2= document.getElementById("authno").value;

	if(no1==no2){
		alert("인증 성공");
		/* opener.document.value.qq.value =1; */
		window.opener.Sucess(1);
		//opener.document.value.EECheck.value=1;
		window.close();

	}else{
		
		alert("인증번호가 다릅니다.");
		
	} 
}

</script>
</head>
<body>
	<div class="Content">
		<input type="text" id="authno" placeholder="인증코드" onclick="check()">
		<input type="hidden" id="code" value="<%=session.getAttribute("code")%>">
		<input type="button" value="전송" onclick="numcheck()">
	</div>
</body>
</html>

