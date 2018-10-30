<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:useBean id="dto" class="com.member.model.StudentInfoBeanDTO"></jsp:useBean>
<jsp:useBean id="dao" class="com.member.model.StudentInfoDAO"></jsp:useBean>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<%
	
	String name=(String)session.getAttribute("StuName");
	String Adminname=(String)session.getAttribute("name");
	int Stu_num=dao.StuNumbersearch(name);
	session.setAttribute("Stu_num", Stu_num);
%>
<!-- href="StudentInfo.jsp?Stu_num=<//Stu_num%>" -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#divCall01").click(function(){
			$.ajax({
				type:"POST",
				url:"StudentInfo.jsp",
				<%-- data:<%=//Stu_num%>, --%>
				success:function(data){
					$("#main_calender").empty();
					$(".main_calender_info").empty();
					$(".getCon").empty();
					$(".main_area").load("StudentInfo.jsp");
				},
			});				
		});
	});
</script>
<%
	if(Adminname!=null && Adminname.equals("관리자")){
%>
<div class="SubMenu">
	<table>
		<tr>
			<td class="Menu">
				<a class="Title_Menu" id="divCall00"><img style="border-width: 0;" src="img/SubMenu1.gif" alt="메뉴1">학생/일정</a>
					<ul class="InfoHak">
						<li><a class="Hak" id="divCall01" href="#">학생등록</a></li>
						<li><a class="Hak" id="divCall02" href="#">일정등록</a></li>
					</ul>	
			</td>
		</tr>
	</table>
</div>
<%
	}else if(Adminname==null && name!=null){
%>
<div class="SubMenu">
					<table>
						<tr>
							<td class="Menu">
								<a class="Title_Menu" id="divCall00"><img style="border-width: 0;" src="img/SubMenu1.gif" alt="메뉴1">학적정보</a>
									<ul class="InfoHak">
										<li><a class="Hak" id="divCall01">학적조회</a></li>
										<li><a class="Hak" id="divCall02" href="#">학적부정정신청</a></li>
									</ul>
								<a class="Title_Menu" id="divCall03"><img style="border-width: 0;" src="img/SubMenu2.gif" alt="메뉴2">수강신청</a>
									<ul class="Class">
										<li><a class="Hak" id="divCall04" href="#">수업계획서</a></li>
									</ul>
								<a class="Title_Menu" id="divCall05"><img style="border-width: 0;" src="img/SubMenu3.gif" alt="메뉴3">기타</a>
									<ul class="Class">
										<li><a class="Hak" id="divCall06" href="#">강의실시간표조회</a></li>
									</ul>
								<a class="Title_Menu" id="divCall07"><img style="border-width: 0;" src="img/SubMenu3.gif" alt="메뉴3">성적정보</a>
									<ul class="InfoHak">
										<li><a class="Hak" id="divCall08" href="#">학기성적조회</a></li>
										<li><a class="Hak" id="divCall09" href="#">성적평가서조회</a></li>
										<li><a class="Hak" id="divCall10" href="#">학기교류성적내역</a></li>
									</ul>
								<a class="Title_Menu" id="divCall11"><img style="border-width: 0;" src="img/SubMenu2.gif" alt="메뉴3">등록정보</a>
									<ul class="Class">
										<li><a class="Hak" id="divCall12" href="#">등록금납입확인서출력</a></li>
									</ul>			
							</td>
						</tr>
					</table>
				</div>
				<%} %>
			</body>
		</html>