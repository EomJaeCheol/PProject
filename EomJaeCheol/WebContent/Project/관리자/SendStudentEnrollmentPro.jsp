<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 메일보내기에 사용되는 라이브러리  -->
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

<!-- 파일업로드에 사용되는 라이브러리  -->
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<!-- 메일 첨부시에 사용되는 라이브러리 -->
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.activation.FileDataSource"%>
<%@page import="javax.activation.DataHandler"%>
<%
	request.setCharacterEncoding("UTF-8");

	int maxPostSize = 100 * 1024 * 1024;
	//집
	//String saveDirectory = "D:\\workplace_jsp7\\1\\WebContent\\Project\\img\\학생사진";
	//학원
	//String saveDirectory="D:\\workspace_jsp7\\1\\WebContent\\Project\\관리자\\StudentCollection";
	ServletContext ctx = getServletContext();
	String saveDirectory = ctx.getRealPath("/upload");
	//System.out.println("파일의 경로"+saveDirectory);
	
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, "UTF-8",
			new DefaultFileRenamePolicy());

	String fileInput = "";
	String fileName = ""; //파일이름
	File fileObj = null;
	long fileSize = 0;

	Enumeration formNames = mr.getFileNames();
	while (formNames.hasMoreElements()) {
		fileInput = (String) formNames.nextElement(); //첫번째 type=file
		fileName = mr.getFilesystemName(fileInput);
		if (fileName != null) {
			fileObj = mr.getFile(fileInput);
			fileSize = (long) fileObj.length();
		}
	}
	String name=mr.getParameter("name");
	String majorin=mr.getParameter("majorin");
	String jumin=mr.getParameter("jumin");
	String gender=mr.getParameter("gender");
	String phone=mr.getParameter("phone");
	String email=mr.getParameter("email");
	String addr=mr.getParameter("addr");
	String addr1=mr.getParameter("addr1");
	
	//System.out.println("업로드 성공!");
	//System.out.println("파일 이름: " +fileName);

	//String email=request.getParameter("to");

	// 사용자에게 보낼 메시지를 기입
	String host = "http://localhost:8088/1/Project/";
	String from = "abctmxk@gmail.com";
	String to = email;
	//System.out.print("이메일 주소"+to);
	String subject = "학생등록을 위한 메일입니다";
	String content="학생정보는 아래와 같습니다<br>";
	content+="이름 : "+name+"<br>";
	content+="학과/학부 : "+majorin+"<br>";
	content+="주민번호 : "+jumin+"<br>";
	content+="성별 : "+gender+"<br>";
	content+="휴대폰 번호 : "+phone+"<br>";
	content+="주소 : "+addr+addr1+"";
	//String content = "학생 정보["+name+majorin+"] 입니다";

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
		
		//수신자의 메일 제목에 나오는 내용
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		//msg.setContent(content, "text/html;charset=UTF-8");
		
		//첨부파일
		MimeMultipart multipart=new MimeMultipart();
		
		MimeBodyPart part=new MimeBodyPart();
		part.setContent(content, "text/html;charset=UTF-8");
		multipart.addBodyPart(part);
		
		//한개의 이미지 파일만 가져오기 위해 객체 초기화
		part=new MimeBodyPart();
		FileDataSource fds=new FileDataSource(saveDirectory+"\\"+fileName);
		part.setDataHandler(new DataHandler(fds));
		part.setFileName(fileName);
		multipart.addBodyPart(part);
		
		//파일 첨부
		msg.setContent(multipart);
		//파일 첨부후 전송
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
<script type="text/javascript">
	alert("관리자에게 메일이 발송되었습니다.\n24시간내에 학생등록이 완료됩니다!");
	window.close();
</script>
</head>
<body>
</body>
</html>

