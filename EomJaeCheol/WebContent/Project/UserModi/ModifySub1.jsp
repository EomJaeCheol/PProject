<%@page import="com.member.model.MemberBeanDTO"%>
<%@page import="com.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.bBtn04{
    font-family: Dotum;
    font-size: 14px;
    color: #000;
    text-align: center;
    border: none;
    background: url("../img/CkBtn.gif") no-repeat;
    width: 75px;
    height: 26px;
    cursor: hand;
    padding-top: 3px;
   }
.CK_box{
	width:717px;
	text-align: center;
}
.ContentsArea{
	padding: 10px 15px;
    font-family: Dotum;
    font-size: 12px;
	width:800px;
	height: 350px;
	position: relative;
	vertical-align:center;
}

</style>
<%
	String id = (String) session.getAttribute("id");
	if (id == null) {
		response.sendRedirect("../Student.jsp");
	}
	request.setCharacterEncoding("UTF-8");
	/* String _id = request.getParameter("id");
	String _pass = request.getParameter("pass"); */

	//한글처리 업데이트 폼에서 들고오는데 한글이 있으므로
	request.setCharacterEncoding("UTF-8");
	MemberDAO mdao = new MemberDAO();
	MemberBeanDTO memberBean = mdao.getMember(id);
%>
</head>
<body>
    <form action="Deleteinfo.jsp" method="post">
    <div class="ContentsArea">
    <table border="0" cellpadding="0" cellspacing="1" align="center" style="margin-top:10px;background-color:#D0D0D0;">
            <tbody>
            	<tr>
                	<td style="width:717px;height:50px;text-align:left;font-size:13px;line-height:25px;background-color:#FFFFBF;">
                    	<div style="padding:10px 10px 10px 10px;">
                        	&gt;&gt; 아래 동일한 아이디와 비밀번호를 반드시 입력하십시오.<font color="red"><b>&nbsp; 미 입력 시 수정 및 탈퇴를 할수 없습니다.</b> </font>  <br>
                        	&gt;&gt; 비밀번호를 잊어버린 경우 이메일 인증으로 찾을수 있습니다.<br>
                        	&gt;&gt; 비밀번호를 변경시 비밀번호는 8-20자리, 영문, 숫자, 특수문자가 모두 1개이상 포함되어야 합니다.
                    	</div>
                	</td>
            	</tr>
        </tbody>
    </table>
 	<table border="0" cellpadding="0" cellspacing="1" align="center"
				style="background-color: #BFCDDB;">
				<tbody>
					<tr>
						<td
							style="width: 130px; height: 28px; padding-left: 10px; background-color: #F0F0F0;"
							colspan="2">아이디(ID)</td>
						<td
							style="width: 570px; padding-left: 5px; background-color: #FFFFFF;">
							<input type="text" name="id" id="_id" <%-- value="<%=_id%>" --%>
							style="width: 150px;">
						</td>
					</tr>
					<tr>
						<td
							style="width: 130px; height: 28px; padding-left: 10px; background-color: #F0F0F0;"
							colspan="2">비밀번호</td>
						<td
							style="width: 570px; padding-left: 5px; background-color: #FFFFFF;">
							<input type="password" name="pass" id="_pass" <%-- value="<%=_pass%>" --%>
							style="width: 150px;">
						</td>
					</tr>
				</tbody>
			</table>
			<table border="0" cellpadding="0" cellspacing="1" align="center"
				style="margin-top: 10px;">
				<tbody>
					<tr>
						<td style="width: 717px; text-align: center;">
							<input type="submit" value="확인" class="bBtn04">
							<input type="button" value="취소" onclick="window.close()" class="bBtn04">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>