<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="PagePaint/StudentPage.css" rel="stylesheet">
<link href="PagePaint/StudentInfo.css" rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<!-- 달력 -->
<script type="text/javascript" src="StuJs/Calender.js"></script>
<jsp:useBean id="dto" class="com.member.model.StudentInfoBeanDTO"></jsp:useBean>
<jsp:useBean id="dao" class="com.member.model.StudentInfoDAO"></jsp:useBean>
<!-- <script type="text/javascript">

function imgSize(which){
    var width = eval("document."+which+".width");
    var height = eval("document."+which+".height");
    var temp = 0; 
    var max_width= 100;   // 이미지의 최대 크기     
    
    if ( width > max_width ) {     
       height = height/(width/max_width);
       eval("document."+which+".width = max_width");     
       eval("document."+which+".height = height");
    }     
}
</script> -->
</head>

<body>
	<!-- <div> -->
		
		<!-- <div class="left_menu"> -->
			<!-- <div class="sub_menu"> -->
				<%
					int Stu_num = (Integer) session.getAttribute("Stu_num");
					dto = dao.read(Stu_num);
					String Admin=(String)session.getAttribute("name");
					//System.out.println(Admin);
					
					if (Stu_num == 0 && Admin==null) {
						out.println("없는 학생입니다!");
					} else if(Stu_num!=0){
				%>
				<!-- <div class="main_area"> -->
					<form action="#" method="post">
						<div class="NaviHistory" id="H">학적정보>학적조회</div>
						<div class="ContentsArea">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td class="ContentsTitle"><span id="lbl타이틀"><%=dto.getName()%>
												님의 학생정보</span></td>
									</tr>
								</tbody>
							</table>
							<table width="100%" cellspacing="0" cellpadding="0"
								class="TableStyle00"
								style="margin-top: 10px; margin-bottom: 10px">
								<tbody>
									<tr>
										<th width="100" scope="col">학생정보</th>
										<td><span id="lbl학생정보"><%=dto.getDepartment() %>
										<%=dto.getMajorin()%> <%=dto.getGrade()%>학년 /
												학사과정 / <%=dto.getName()%> / 졸업
										</span></td>
									</tr>
								</tbody>
							</table>
							<div class="TabArea">
								<input type="submit" name="btnTab00" value="기본" id="btnTab00"
									class="tabmenu_05_on"> <input type="submit"
									name="btnTab01" value="연락처" id="btnTab01" class="tabmenu_05">

								<input type="submit" name="btnTab02" value="학적변동" id="btnTab02"
									class="tabmenu_05"> <input type="submit"
									name="btnTab03" value="전공이수" id="btnTab03" class="tabmenu_05">

								<input type="submit" name="btnTab04" value="성적" id="btnTab04"
									class="tabmenu_05"> <input type="submit"
									name="btnTab05" value="장학" id="btnTab05" class="tabmenu_05">

								<input type="submit" name="btnTab06" value="등록" id="btnTab06"
									class="tabmenu_05"> <input type="submit"
									name="btnTab07" value="입학" id="btnTab07" class="tabmenu_05">

								<input type="submit" name="btnTab08" value="졸업" id="btnTab08"
									class="tabmenu_05">
							</div>
							<table width="100%" cellspacing="0" cellpadding="0"
								class="TableStyle01">
								<tbody>
									<tr>
										<th width="10" height="10" rowspan="6" scope="col" align="center"
											valign="middle" bgcolor="#ffffff"><img name="img"
											style="width:120px; height:auto;"
											src="../upload/<%=dto.getFilename()%>"></th>
									</tr>
									<tr>
										<th scope="col">소속</th>
										<td colspan="3" align="center"><span id="lbl소속"><%=dto.getDepartment() %>
												<%=dto.getMajorin() %></span></td>
										<th scope="col">학년(학기차)</th>
										<td align="center"><span id="lbl학년학기차"><%=dto.getGrade()%></span></td>
									</tr>
									<tr>
										<th scope="col">전공</th>
										<td align="center"><span id="lbl전공"><%=dto.getMajorin() %></span></td>
										<th scope="col">학번</th>
										<td align="center"><span id="lbl학번"><%=dto.getStuNumber()%></span></td>
										<th scope="col">이름</th>
										<td align="center"><span id="lbl성명"><%=dto.getName()%></span></td>
									</tr>
									<tr>
										<th scope="col">주민번호</th>
										<td align="center"><span id="lbl주민번호"><%=dto.getJumin() %></span></td>
										<th scope="col">성별</th>
										<td align="center"><span id="lbl성별"><%=dto.getGender() %></span></td>
										<th scope="col">휴대폰 번호</th>
										<td align="center"><span id="lbl휴대폰번호"><%=dto.getPhone() %></span>
										</td>
									</tr>
									<tr>
										<th scope="col">이메일 주소</th>
										<td align="center"><span id="lbl이메일주소"><%=dto.getEmail()%></span></td>
										<th scope="col">병력구분</th>
										<td align="center"><span id="lbl병력구분">-</span></td>
										<th scope="col">추후입력</th>
										<td align="center"><span>*</span></td>
									</tr>
									<tr>
										<th scope="col">학적상태</th>
										<td align="center"><span id="lbl학적상태">*</span></td>
										<th scope="col">최종학적변동</th>
										<td align="center"><span id="lbl최종학적변동">*</span></td>
										<th scope="col">추후입력</th>
										<td align="center"><span>*</span></td>
									</tr>
								</tbody>
							</table>
							<table width="100%" cellspacing="0" cellpadding="0"
								class="TableStyle01" style="margin-top: 5px">
								<tbody>
									<tr>
										<th width="120" scope="col">성명영문</th>
										<td width="130" align="center"><span id="lbl성명영문">*&nbsp;</span>
										</td>
										<th width="120" scope="col">성명한자</th>
										<td width="130" align="center"><span id="lbl성명한자">*&nbsp;</span>
										</td>
										<th width="120" scope="col">학기제</th>
										<td align="center"><span id="lbl학기제">*&nbsp;</span></td>
									</tr>
									<tr>
										<th scope="col">복학예정학년도학기</th>
										<td align="center"><span id="lbl복학예정학년도학기">&nbsp;</span>
										</td>
										<th scope="col">일반휴학잔여학기</th>
										<td align="center"><span id="lbl일반휴학잔여학기">*&nbsp;</span>
										</td>
										<th scope="col">재한연한잔여학기</th>
										<td align="center"><span id="lbl재학연한잔여학기">*&nbsp;</span>
										</td>
									</tr>
								</tbody>
							</table>
							<table width="100%" cellspacing="0" cellpadding="0"
								class="TableStyle01" style="margin-top: 5px">
								<tbody>
									<tr>
										<th scope="col">입학학년도학기</th>
										<td align="center"><span id="lbl입학학년도학기">추후입력 &nbsp;</span></td>
										<th scope="col">등록금책정계열</th>
										<td colspan="3" align="center"><span id="lbl등록금책정계열">추후입력&nbsp;</span>
										</td>
									</tr>
									<tr>
										<th width="120" scope="col">입학전형</th>
										<td width="130" align="center"><span id="lbl입학전형">추후입력&nbsp;</span>
										</td>
										<th width="120" scope="col">정원외내역</th>
										<td width="130" align="center"><span id="lbl정원외내역">추후입력&nbsp;</span>
										</td>
										<th width="120" scope="col">성적등급점수여부</th>
										<td align="center"><span id="lbl성적등급점수여부">추후입력&nbsp;</span>
										</td>
									</tr>
								</tbody>
							</table>
							<table width="100%" cellspacing="0" cellpadding="0"
								class="TableStyle01" style="margin-top: 5px">
								<tbody>
									<tr>
										<th width="120" scope="col">추후</th>
										<td align="left"><span id="lbl공학인증프로그램">추후입력 &nbsp;</span></td>
									</tr>
								</tbody>
							</table>
							<table width="100%" cellspacing="0" cellpadding="0"
								class="TableStyle01" style="margin-top: 5px">
								<tbody>
									<tr>
										<th width="120" scope="col">추후입력</th>
										<td width="130" align="center"><span id="lbl휴대폰번호">*&nbsp;</span>
										</td>
										<th width="120" scope="col">추후입력</th>
										<td width="130" align="center"><span id="lbl전화번호">*&nbsp;</span>
										</td>
										<td rowspan="2" align="center">&nbsp;</td>
									</tr>
									<tr>
										<th scope="col">주소</th>
										<td colspan="3" align="center"><%=dto.getPost()%><span
											id="lbl주소">&nbsp;</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
				<!-- </div> -->
				<%
					}
				%>
				<%
					if(Stu_num==0 && Admin!=null){
				%>
				<h2>일정 등록</h2>
				<script type="text/javascript">
				$(document).ready(function(){
					$("#Calender").click(function(){
						$("#main_calenders").empty();
						Scalendar();
					});
				});
				$(document).ready(function(){
					$("#content").click(function(){
						$("#main_calenders").empty();
					});
				});
				</script>
				<script type="text/javascript">
				$(document).ready(function(){
					$("#DateEn").click(function(){
						var Date = document.getElementById('Calender').value;
						var Content=document.getElementById('content').value;
						$.ajax({
							type:"POST",
							url:"관리자/CalenderEn.jsp",
							data:{
								"Date":Date,
								"Content":Content
							},
							success:function(data){
								alert("입력성공!");
							}
						});
					});
				});
				</script>
				<table>
					<tr><td>Date: <input type="text" id="Calender" name="selDate" readonly></td></tr>
				</table>
				<table style="margin-left: 400px; margin-top:-30px;">
					<tr><td>내용</td></tr>
					<tr><td><textarea id="content" cols="30" rows="5" ></textarea></td></tr>
					<tr><td><input type="button" value="일정 등록" id="DateEn"></td></tr>
				</table>
				<div id="main_calenders" style="margin-top: -115px; margin-left: -10px;"><!-- 달력표시  --></div>
			<% }%>
</body>
</html>