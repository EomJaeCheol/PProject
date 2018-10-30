<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.member.model.MemberBeanDTO"%>
<%@page import="com.member.model.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
 	<%
		//세션값 있을때만 수정
		String id = (String) session.getAttribute("id");
 		//System.out.println("세션"+id);
		if (id == null) {
			response.sendRedirect("../Student.jsp");
		}

		//MemberDAO 객체 생성 -> 회원 정보 찾아오기
		MemberDAO mdao = new MemberDAO();
		//MemberBean 타입 객체 <- getMember(id)
		// MemberBeanDTO mb=mdao.getMember(id);
        MemberBeanDTO memberBean=mdao.getMember(id);

	%>
	<script type="text/javascript">
	function Modify1(){
		var check1 =document.value;
		window.open('', '정보수정','width=800, height=500');
		check1.action='회원수정/ModifySub.jsp';
		check1.target='정보수정';
		check1.submit();
	}
	function Modify2(){
		var check2 =document.value;
		window.open('', '회원탈퇴','width=800, height=500');
		check2.action='회원수정/ModifySub1.jsp';
		check2.target='회원탈퇴';
		check2.submit();
	}
	
	</script>
 	<form name="value" method="post">
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
    <div style="height:20px;"></div>
			<table border="0" cellpadding="0" cellspacing="1" align="center"
				style="background-color: #BFCDDB;">
				<tbody>
					<tr>
						<td
							style="width: 130px; height: 28px; padding-left: 10px; background-color: #F0F0F0;"
							colspan="2">이름</td>
						<td
							style="width: 570px; padding-left: 5px; background-color: #FFFFFF;">
							<input type="text" id="pInput" value="<%=memberBean.getName()%>" readonly
							style="width: 150px;" name="name" border="none">
						</td>
					</tr>
					<tr>
						<td
							style="width: 130px; height: 28px; padding-left: 10px; background-color: #F0F0F0;"
							colspan="2">아이디(ID)</td>
						<td
							style="width: 570px; padding-left: 5px; background-color: #FFFFFF;">
							<input type="text" name="id"  value="<%=memberBean.getId()%>" readonly
							style="width: 150px;">
						</td>
					</tr>
					<tr>
						<td
							style="width: 130px; height: 28px; padding-left: 10px; background-color: #F0F0F0;"
							colspan="2">비밀번호</td>
						<td
							style="width: 570px; padding-left: 5px; background-color: #FFFFFF;">
							<input type="password" name="pass" value="<%=memberBean.getPass()%>" readonly
							style="width: 150px;">
						</td>
					</tr>
					<tr>
						<td
							style="width: 130px; height: 28px; padding-left: 10px; background-color: #F0F0F0;"
							colspan="2">이메일</td>
						<td
							style="width: 570px; padding-left: 5px; background-color: #FFFFFF;">
							<input name="email" type="text"  value="<%=memberBean.getEmail()%>" readonly
							style="width: 150px;">
						</td>
					</tr>
					<tr>
						<td
							style="width: 130px; height: 28px; padding-left: 10px; background-color: #F0F0F0;"
							colspan="2">휴대폰</td>
						<td
							style="width: 570px; padding-left: 5px; background-color: #FFFFFF;">
							<input name="phone" type="text"  value="<%=memberBean.getPhone1()%>" readonly
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
							<input type="button" value="회원 수정" class="bBtn04" onclick="Modify1()">
							<input type="button" value="회원 탈퇴" class="bBtn04" onclick="Modify2()">
							<input type="button" onclick="location='../StudentPage.jsp'" value="취소" class="bBtn04">
						</td>
					</tr>
				</tbody>
			</table>
 			</div>
		</form>
	</body>
</html>
