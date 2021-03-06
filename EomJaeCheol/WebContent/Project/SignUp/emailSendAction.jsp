<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.member.model.MemberDAO"%>
<%@page import="com.DatabaseContents.Action.SHA256"%>
<%@page import="com.DatabaseContents.Action.Gmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	

	//System.out.println("test");
	MemberDAO mdao = new MemberDAO();
	
	String id = (String) session.getAttribute("id");
	if (id == null) {
		response.sendRedirect("../Student.jsp");
	}
	
	String U_name=(String)session.getAttribute("id");
	
	//System.out.println("세션값은?: "+U_name);
	
	boolean emailChecked = mdao.getUserEmailChecked(U_name);
	
	//System.out.println("불리안값이 들어가니?:"+ emailChecked);
	if(emailChecked == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 인증 된 회원입니다.');");
		script.println("location.href = '../Student.jsp'");
		script.println("</script>");
		script.close();		
		return;
	}
	
		// 사용자에게 보낼 메시지를 기입
		String host = "http://localhost:8088/1/Project/";
		String from = "abctmxk@gmail.com";
		String to = mdao.getUserEmail(id);
		String subject = "인증을 위한 이메일";
		String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." +
			"<a href='" + host + "회원가입/emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";

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
	
	try{

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

	} catch(Exception e){
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
    	.Content{
    		border: 3px solid black;
    		width:500px;
    		height:150px;
    		margin: auto;
    	}
    </style>
  </head>
  <body>
	    <div class="Content">
		  이메일 주소 인증 메일이 전송되었습니다. 이메일에 들어가셔서 인증해주세요.
		</div>
  </body>
</html>

