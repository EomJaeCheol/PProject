<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.member.model.MemberBeanDTO"%>
<%@page import="com.member.model.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

.font{
	font-family: Dotum;
    font-size: 12px;
}
</style>
<jsp:useBean id="dto" class="com.member.model.StudentInfoBeanDTO"></jsp:useBean>
<jsp:useBean id="dao" class="com.member.model.StudentInfoDAO"></jsp:useBean>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
 	<%
		//세션값 있을때만 수정
		
		
		String name=(String)session.getAttribute("StuName");
		//System.out.println("search에서 받은 이름은?"+name);
		int Stu_num=dao.StuNumbersearch(name);
		//int No=Integer.parseInt(request.getParameter("No"));
		//System.out.println("Stusearch에서 받은 넘버값은?"+Stu_num);
		//session.setAttribute("Stu_num", Stu_num);
 		//int Stu_num=(Integer)session.getAttribute("Stu_num");

		if (Stu_num==0) {
			response.sendRedirect("../Student.jsp");
		}
		dto=dao.read(Stu_num);
	%>

 	<form name="fr" action="StuModifyPro.jsp" method="post">
	<div class="ContentsArea">
	<!--네비게이션 -->
	<!--  <div class="NavigationHistory">홈 &gt; 내정보변경</div> -->
	<table border="0" cellpadding="0" cellspacing="1" align="center" style="margin-top:10px;background-color:#D0D0D0;">
            <tbody>
            	<tr>
                	<td style="width:717px;height:50px;text-align:left;font-size:13px;line-height:25px;background-color:#FFFFBF;">
                    	<div style="padding:10px 10px 10px 10px;">
                        	&gt;&gt; 아래 동일한 아이디와 비밀번호를 반드시 입력하십시오.<font color="red"><b>&nbsp; 미 입력 시 수정 및 탈퇴를 할수 없습니다.</b> </font>  <br>
                        	&gt;&gt; 이메일 인증을 완료후 변경사항을 변경해주십시오.<br>
                        	&gt;&gt; 비밀번호를 변경시 비밀번호는 8-20자리, 영문, 숫자, 특수문자가 모두 1개이상 포함되어야 합니다.
                    	</div>
                	</td>
            	</tr>
        </tbody>
    </table>
    <div style="height:20px;"></div>
			<table border="0" cellpadding="0" cellspacing="1" align="center"
				style="background-color: #BFCDDB;" >
				<tbody>
					<tr class="font">
						<td
							style="width: 130px; height: 28px; padding-left: 10px; background-color: #F0F0F0;
							"
    												
							colspan="2">이름</td>
						<td
							style="width: 570px; padding-left: 5px; background-color: #FFFFFF;">
							<input type="text" id="pInput" value="<%=dto.getName()%>" readonly
							style="width: 150px;" name="name" border="none">
						</td>
					</tr>
					<tr class="font">
						<td
							style="width: 130px; height: 28px; padding-left: 10px; background-color: #F0F0F0;"
							colspan="2">아이디(ID)</td>
						<td
							style="width: 570px; padding-left: 5px; background-color: #FFFFFF;">
							<input type="text" name="id"  value="<%=dto.getStuNumber()%>" readonly
							style="width: 150px;">
						</td>
					</tr>
					<tr class="font">
						<td
							style="width: 130px; height: 28px; padding-left: 10px; background-color: #F0F0F0;"
							colspan="2">비밀번호</td>
						<td
							style="width: 570px; padding-left: 5px; background-color: #FFFFFF;">
							<input type="password" name="pass" onblur=allCheck();
							style="width: 150px;">
							<input type="text" name="error1" style="border:0;color:red;font size:12px;width:160">
						</td>
					</tr>
				
					<tr class="font">
						<td
							style="width: 130px; height: 28px; padding-left: 10px; background-color: #F0F0F0;"
							colspan="2">새 비밀번호</td>
						<td
							style="width: 570px; padding-left: 5px; background-color: #FFFFFF;">
							 <input type="password" name="Newpass1" style="border:1 solid;font size:12px 굴림;" size="8" onblur=allCheck();>
						</td>
					</tr>
					<tr class="font">
						<td
							style="width: 130px; height: 28px; padding-left: 10px; background-color: #F0F0F0;"
							colspan="2">새 비밀번호 확인</td>
						<td
							style="width: 570px; padding-left: 5px; background-color: #FFFFFF;">
							<input type="password" name="Newpass2" style="border:1 solid;font size:12px 굴림;" size="8" onblur=allCheck();> 
							<input type="text" name="error2" style="border:0;color:red;font size:12px 굴림;width:160" readonly onblur=allCheck(); value="">
						</td>
					</tr>
					<tr class="font">
						<td
							style="width: 130px; height: 28px; padding-left: 10px; background-color: #F0F0F0;"
							colspan="2">이메일</td>
						<td style="width: 570px; padding-left: 5px; background-color: #FFFFFF;">
							<input name="email" type="text" style="width: 150px;">
							<script type="text/javascript">
							 function Sucess(data){
								 
								 if(data==1){
									aa.style.display='none';
									document.fr.error3.value="";
									document.fr.EECheck.value=1;
								 }else{
									aa.style.display='show';
								 }
							 } 
							 </script>	
							 <input type="button" id="aa" value="이메일 인증" onclick="emailCheck()">
							 <input type="text" name="EECheck" style="border:0;color:white;">
							 <input type="text" name="error3" style="border:0;font size:12px;width:160">
					</tr>
					<tr class="font">
						<td
							style="width: 130px; height: 28px; padding-left: 10px; background-color: #F0F0F0;"
							colspan="2">주소</td>
						<td
							style="width: 570px; padding-left: 5px; background-color: #FFFFFF;">
							<input name="addr" type="text" id="sample6_address2" value="<%=dto.getPost()%>"
							 style="width: 300px;" readonly><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							 
							<input type="text" name="addr" id="sample6_address" placeholder="주소">
							<input type="text" id="sample6_postcode" placeholder="우편번호">
							<input name="addr1" type="text" id="sample6_address2" placeholder="상세주소">
							 
							 
						</td>
					</tr>
				</tbody>
			</table>
			<table border="0" cellpadding="0" cellspacing="1" align="center"
				style="margin-top: 10px;">
				<tbody>
					<tr>
						<td style="width: 717px; text-align: center;">
							<input type="button" value="확인" class="bBtn04" onclick="allCheck()">
							<input type="button" onclick="location='../StudentPage.jsp'" value="취소" class="bBtn04">
						</td>
					</tr>
				</tbody>
			</table>
 			</div>
		</form>
	</body>
</html>
