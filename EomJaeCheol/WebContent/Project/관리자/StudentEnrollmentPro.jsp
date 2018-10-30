<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.awt.Image"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="com.member.model.StudentInfoBeanDTO"></jsp:useBean>
<jsp:useBean id="dao" class="com.member.model.StudentInfoDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	try{
		int maxPostSize=100*1024*1024;
		// 실제주소 이미지 경로
		//집
		//String saveDirectory="D:\\workplace_jsp7\\1\\WebContent\\Project\\img\\학생사진";
		//학원
		//String saveDirectory="D:\\workspace_jsp7\\1\\WebContent\\Project\\img\\학생사진";
		ServletContext ctx = getServletContext();
		String saveDirectory = ctx.getRealPath("/upload");
		
		
		MultipartRequest mr=new MultipartRequest(
				request,
				saveDirectory,
				maxPostSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		String fileInput="";
		String fileName=""; //파일이름
		File fileObj=null;
		long fileSize=0;
		Enumeration formNames=mr.getFileNames();
		
		while(formNames.hasMoreElements()){
			fileInput=(String)formNames.nextElement();  //첫번째 type=file
			fileName=mr.getFilesystemName(fileInput);
			if(fileName!=null){
				
				fileObj=mr.getFile(fileInput);
				fileSize=(long)fileObj.length();
			}
		}
		
		//파일 정보저장
		String name=mr.getParameter("name");
		int StuNumber=Integer.parseInt(mr.getParameter("StuNumber"));
		String department=mr.getParameter("department");
		String grade=mr.getParameter("grade");
		String pass=mr.getParameter("pass");
		String majorin=mr.getParameter("majorin");
		String jumin=mr.getParameter("jumin");
		String gender=mr.getParameter("gender");
		String phone=mr.getParameter("phone");
		String email=mr.getParameter("email");
		String post=mr.getParameter("addr")+mr.getParameter("addr1");
		
		dto.setName(name);	dto.setStuNumber(StuNumber);	dto.setGrade(grade);	dto.setDepartment(department);
		dto.setPass(pass);	dto.setMajorin(majorin);	dto.setJumin(jumin);
		dto.setGender(gender);	dto.setPhone(phone);	dto.setEmail(email);
		dto.setPost(post);	dto.setFilename(fileName);	dto.setFilesize(fileSize);
		boolean flag=dao.insert(dto);
		if(flag==true){
			%>
				<script type="text/javascript">
					alert("학생 등록 성공!");
					history.back();
				</script>
				<%-- <a href="readTest.jsp?name=<%=name%>">상세보기</a> --%>
				
			<%
		}else{
			out.print("<p> 이미지 등록 실패 </p>");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>