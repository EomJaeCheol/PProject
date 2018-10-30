<%@page import="com.member.model.ConnectDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.model.ConnectDAO"%>
<%@page import="com.DatabaseContents.Action.Naver"%>
<%@page import="com.member.model.MemberDAO"%>
<%@page import="com.member.model.MemberBeanDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 구글 app 사용, 클라이언트ip 가져옴 -->
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href="PagePaint/StudentPage.css" rel="stylesheet">
<link href="PagePaint/StudentInfo.css" rel="stylesheet">

<script type="text/javascript">
	$(document).ready(function(){
		calendar();
	});
</script>


<script type="text/javascript">
function Postview(month,Year){
	var a;
	$(document).ready(function(){
		$.ajax({
			type:"POST",
			url:"../Cal/test.jsp",
			data:{
				"month":month,
				"Year":Year
			},
			success: function(data){
				alert(data);
				var obj =JSON.parse(data);
			}
		});
	});
}
</script>

<script>

var nowDate;
var nYear;
var nMonth;
var nDate;
var nNumday;
var endDay;
var dayName;
var col;
var eDate = new Date();

function calendar(tYear,tMonth) {
	nowDate = new Date();
	nYear=nowDate.getFullYear();
	nMonth= nowDate.getMonth();
	nDate= nowDate.getDate();
	nNumday= nowDate.getDay();
	endDay= new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	dayName= new Array("일", "월", "화", "수", "목", "금", "토");
	col=0;
		 /* var nowDate = new Date(); //오늘 날짜 객체 선언  
			var nYear = nowDate.getFullYear(); //오늘의 년도  
			var nMonth = nowDate.getMonth(); //오늘의 월 ※ 0월부터 시작  
			var nDate = nowDate.getDate(); //오늘의 날  
			var nNumday = nowDate.getDay(); //오늘의 요일 0=일요일...6=토요일  
			var endDay = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31); //각달의 마지막 날짜  
			var dayName = new Array("일", "월", "화", "수", "목", "금", "토"); // 숫자 요일을 문자 요일 바꿀 함수  
			var col = 0; //나중에 앞뒤 빈 날짜칸 계산  */

			 if (tYear == null) //null 일경우, 처음 페이지가 로드 될때의 년도는   
			{
				tYear = nYear;
			} // 현재 년도를 가져오고  

			if (tMonth == null) //null 일경우, 처음 페이지가 로드 될때의 월은  
			{
				tMonth = nMonth;
			} //현재 월을 가져오고   
 
			//eDate = new Date(); // 변경된 날짜 객체 선언  
			eDate.setFullYear(tYear); // 변경된 년도 세팅  
			eDate.setMonth(tMonth); // 변경된 월 세팅  
			eDate.setDate(1); // 날짜는 1일로 설정   
			var fNumday = eDate.getDay(); // 첫번째 날짜 1일의 숫자 요일  
			var lastDay = endDay[eDate.getMonth()]; //변경된 월의 마지막 날짜


			if ((eDate.getMonth() == 1) && (((eDate.getYear() % 4 == 0) && (eDate.getYear() % 100 != 0)) || eDate.getYear() % 400 == 0)) {
				lastDay = 29;
			} // 0월 부터 시작하므로 1는 2월임. 윤달 계산 4년마다 29일 , 100년는 28일, 400년 째는 29일  

			calendarStr = "<TABLE class=MainT>"
			calendarStr += "<TR align=center><TD valign=middle>"

			calendarStr += "<a href=javascript:calendar(" + tYear + "," + (tMonth - 1) + ") onclick='Preview(tMonth-1,tYear)'class=preNext>◀</a>"
			calendarStr += "</TD><TD colspan=5 >"

			calendarStr += "<font size=3 color=black>  <b>" + eDate.getFullYear() + "년 " + (eDate.getMonth() + 1) + "월</b></font> " // 해당하는 년도와 월 표시  
			calendarStr += "</TD><TD valign=middle>"

			calendarStr += "<a href=javascript:calendar(" + tYear + "," + (tMonth + 1) + ") onclick='Postview(eDate.getMonth()+1,eDate.getFullYear())'class=preNext id=post>▶</a>"

			calendarStr += "</TD></TR><TR>"
			for (i = 0; i < dayName.length; i++) {
				calendarStr += "<TD class=week>" + dayName[i] + "</TD>" // 숫자 요일을 날짜 요일로 입력  
			}

			calendarStr += "</TR><TR align=center>"

			for (i = 0; i < fNumday; i++) { // 첫번째 날짜의 숫자 요일을 구해서 그전까지는 빈칸 처리  
				calendarStr += "<TD>&nbsp;</TD>"
				col++;
			}

			for (i = 1; i <= lastDay; i++) { // 해당 월의 달력   
				if (eDate.getFullYear() == nYear && eDate.getMonth() == nMonth && i == nDate) { //오늘이면 today 스타일로 표시  
					calendarStr += "<TD class=today >" + i + "</TD>"
				} else {
					if (col == 0) { //일요일이면  
						calendarStr += "<TD class=sunday>" + i + "</TD>"
					} else if (1 <= col && col <= 5) { //그외 평범한 날이면  
						calendarStr += "<TD class=workday>" + i + "</TD>"
					} else if (col == 6) { //토요일이면  
						calendarStr += "<TD class=satday>" + i + "</TD>"
					}
				}

				col++;

				if (col == 7) { //7칸을 만들면 줄 바꾸어 새 줄을 만들고 다시 첫 칸부터 시작  
					calendarStr += "</TR><TR align=center>"
					col = 0;
				}
			}

			for (i = col; i < dayName.length; i++) { //마지막 날에서 남은 요일의 빈 칸 만들기  
				calendarStr += "<TD>&nbsp;</TD>"
			}

			calendarStr += "</TR></TABLE>"
			//$('main_calender').html("calendarStr");
			document.getElementById('main_calender').innerHTML = calendarStr //만든 달력 소스를 화면에 보여주기  
		}

 function SelectTopMenu(){
	 location.href="StudentBasic.jsp";
 }
</script>
</head>
<body>
	<div>
	
<!-- 로고와 최상위 메뉴 탭 4개   -->	
		<jsp:include page="PagePaint/Toplogo.jsp"></jsp:include>
		<script type="text/javascript">
		$(document).ready(function(){
			$(".Top_menu2").click(function(){
			//alert("test");
				 <%-- $.ajax({
					data:{"Name":<%=session.getAttribute("name")%>}, --%>
					$(".SubLeft").load("CommonPage/SubLeftMenuBar.jsp",function(){
						$.getScript("StuJs/SubLeftMenuBar.js")
					});
			});
		});
		$(document).ready(function(){
			$(".infoup").click(function(){
					$("#main_calender").empty();
					$(".main_calender_info").empty();
					$(".getCon").empty();
					$(".main_area").load("회원수정/StuModify.jsp",function(){
					$.getScript("UserJs/StuModify.js")
				});
			});
		});
		$(document).ready(function(){
			$("#Stuin").click(function(){
					$("#main_calender").empty();
					$(".main_calender_info").empty();
					$(".getCon").empty();
					$(".main_area").load("회원수정/Modify.jsp");
			});
		});
		</script>
		<div class="left_menu">
			<form action="login.jsp" method="post">
				<div class="sub_menu">
					<table class="top_table">
						<tr class="main_tr">
							<td class="test">
							<%
							//둘중 하나가 널일때 체크 해서 세션 가져와서 뿌리기
							//일반 유저
							String U_name=(String)session.getAttribute("name");
							//학생
							String S_name=(String)session.getAttribute("StuName");
							if(U_name==null){	
								%>
									<%=S_name%>님
									환영합니다.
								<%
							}else{
							//id와 일치하는 유저의 정보를 보여주기위해 
							String id=(String)session.getAttribute("id");
								%>
									<%=U_name%>님
									환영합니다.
								<%
							}
							%>
							</td>
						</tr>
					</table>
					<div class="main_area"><!-- style="border: 3px solid red" -->
						<!-- 달력표시  -->
						<div id="main_calender"><!-- 달력표시  --></div>
						<div class="main_calender_info">
							<table class="sub_calender_title" style="height:27px" width="100%">
								<tbody>
									<tr align="center" class="Ftr">
										<th style="width: 160px;">학부/대학원</th>
											<td id="Td1" style="width: auto;">
                                            	<select name="" style="width:100%;">
													<option selected="selected" value="01">학부</option>
													<option value="02">일반대학원</option>
													<option value="03">보건대학원</option>
													<option value="04">경영대학원</option>
													<option value="05">교육대학원</option>
													<option value="06">사회복지대학원</option>
													<option value="09">산업융합대학원</option>
												</select>
                                             </td>
									</tr>
								</tbody>
							</table>
							<table width="100%" class="GridViewHeaderStyle">
								<tbody>
									<tr>
										<th width="155px" style="background-color:#DAD9FF">일정</th>
										<th style="width:auto;background-color:#DAD9FF">내용</th>
                                        <th style="width: 7px;">&nbsp;</th>            
                                    </tr>                 
								</tbody>
							</table>
								<div id="DivScroll" style="height:250px;">
                                <div>
									<table  border="1" style="width:100%;border-collapse:collapse;">
										<tbody>
											<tr style="height:24px;">
												<td align="center" id="Day" style="font-weight:bold;width:155px;"> </td>
												<td align="left" id="DayData" style="font-weight:bold;"> </td>
											</tr>
											<tr style="height:24px;">
												<td align="center" style="font-weight:normal;width:155px;">2019-03-03</td><td align="left" style="font-weight:normal;">2018-2 학기종료일자</td>
											</tr>
										</tbody>
									</table>
								</div>

							</div>
						</div>
						<div class="getCon">
							<div class="getCon_sub" id="Panel2">
                                <table id="Table3" style="height:27px" width="100%">
									<tbody>
										<tr align="center">
											<th style="width: 150px;" align="center">
                                                            최근 접속내역
                                            </th>
											<th align="right" style="width: 150px; font-size:small; font-style:normal; font-weight:normal">
                                                            비밀번호 변경일시 : 
                                            </th>
											<th align="center">
                                                <input name="utxt비밀번호변경일시" type="text" value="<%=new Naver().Time()%>" readonly="readonly" id="utxt비밀번호변경일시" disabled="disabled" style="color:Black;background-color:White;border-color:White;border-width:1px;border-style:solid;font-size:12px;height:20px;width:160px;">
                                            </th>
										</tr>
									</tbody>
									</table>
                                    <table id="Table4" width="100%" class="GridViewHeaderStyle">
										<tbody>
											<tr style="height=24px">
												<th width="110px" style="background-color:#DAD9FF">
                                                           	 로그인일시
                                                </th>
												<th width="80px" style="background-color:#DAD9FF">
                                                 IP
                                                </th>
												<th style="width:auto;background-color:#DAD9FF">
                                                            	성공
                                                </th>
												<th style="width:auto;background-color:#DAD9FF">
                                                           	 로그인 불가사유
                                                </th>
                                                <th style="width:auto;background-color:#DAD9FF">
                                                          	  비고
                                                </th>
												<th style="width: 7px;">
                                                    &nbsp;
                                                </th>
											</tr>
										</tbody>
										</table>
                                        	<div id="DivScroll접속내역" class="GridViewDivScroll" onscroll="document.getElementById('DivScroll접속내역_value').value = this.scrollTop" style="height:95px;">
                                        	<div>
												<table class="GridViewBodyStyle" cellspacing="0" rules="all" border="1" id="ugrd접속내역" style="width:100%;border-collapse:collapse;">
													<%
															ConnectDTO cdto=new ConnectDTO();
															ConnectDAO cdao=new ConnectDAO();
															
															ArrayList<ConnectDTO> list=cdao.Connectlist();
															
													%>
													<%
															for(int con=0; con<list.size(); con++){
																		cdto=list.get(con);	
													%>
													<tbody>
													<tr style="height:50px;">
														<!-- 로그인 일시 loginDay-->
														<td align="center" style="width:110px;">
															<%-- <%
																Naver T1=new Naver();
																String presentTime=T1.Time();
															%>
															<%=presentTime%> --%>
															<!-- <script type="text/javascript">  
															    var dt = new Date(); 
															    document.write(dt.getFullYear()+"-"
															    +(dt.getMonth()+1)+"-"+dt.getDate()+'<br>'
															    +dt.getHours()+":"+dt.getMinutes()+":"+dt.getSeconds());
															</script> -->
															<%=cdto.getLoginDay()%>
														</td>
														<!-- 접속한 IP 내역 ip-->
														<td align="center" style="width:80px;">
															<!-- /* ip버전 */
															//ipv6이면 6으로 통과
															/* function ipv(){
																  return -1 !=ip().indexOf(":")?6:4
																} */
																 //document.write(ip()); -->
															 <%=cdto.getIp()%>
														</td>
														<td align="center" style="font-size:Small;width:70px;">
															<!-- 성공 여부 success -->
															<%
															String error=(String)session.getAttribute("Error");
															String fail=(String)session.getAttribute("Fail");
															//String fail=request.getParameter("idses");
															//System.out.println("실패값은?"+fail);
															//System.out.println("성공값은?"+error);
															if(error=="true"){
															%>
																<input id="" type="checkbox" checked="checked" disabled="disabled">
															<%
															}
															else if(fail=="false"){
																//System.out.println("실패들어와?");
															%>
																<input id="" type="checkbox" disabled="disabled">
															<%}
															%>
														</td>
														<!-- 로그인 불가사유loginerror  -->
														<td align="center">
															<%=cdto.getLoginerror() %>
														</td>
														<!-- 비고remark -->
														<td style="width:60px;">
															<%=cdto.getRemark() %>
														</td>
													</tr>
													</tbody>
													<%}
													%>
												</table>
											</div>
                                                <input name="DivScroll접속내역_value" type="hidden" id="DivScroll접속내역_value">
											</div>
										</div>
						
						
						</div>
					</div>
					<table class="Second_table">
						<tr>
							<%
							if(U_name==null){
								%>
								<!-- href="회원수정/StuModify.jsp" -->
							<td class="log_td">
								<a href="로그인/logoutPro.jsp" class="log"><b>로그아웃</b></a>
							</td>
								<td class="Up_td">
									<a href="#" class="infoup">학생 정보변경</a>
								</td>	
								<%
							}else{
								%>
								<td class="log_td">
								<a href="로그인/logoutPro.jsp" class="log"><b>로그아웃</b></a>
								</td>
								<td class="Up_td">
								<a href="#" id="Stuin" style="text-decoration: none; color: #000;">내 정보변경</a>
								</td>							
								<%
							}
							%>
						</tr>
						<%
						
						if(U_name!=null && U_name.equals("관리자")){
						
						//if(U_name.equals("관리자") && (U_name!=null)){
						%>
						<tr>
							<td>
								<a href="관리자/StudentEnrollment.jsp"><b>학생 등록</b></a>
							</td>
						</tr>
						<%}%>
						
					</table>
					<!-- 바로가기 메뉴 -->
					<div class="bot_div">
						<div class="bot_sub">
							<select name="ddlFavorite" id="ddlFavorite" onchange="return GoToMenu();" style="width:140px;">
								<option selected="selected" value="">===== 바로가기 =====</option>
								<option value="0002067">01. 학기성적조회</option>
								<option value="0002507">02. 수업시간표조회</option>
								<option value="0002047">03. 수업계획서</option>
								<option value="0003301">04. 학적조회</option>
								<option value="0002068">05. 성적평가서조회</option>
								<option value="0002096">06. 등록금납부고지서출력</option>
								<option value="0002499">07. 수강신청확인서</option>
								<option value="0002506">08. 수강신청</option>
								<option value="0002065">09. 수업피드백</option>
								<option value="0002091">10. 장학내역조회</option>
							</select>
						</div>
					</div>
					<!-- 바로가기 메뉴 끝-->
					<!-- 바로가기 서브메뉴-->
					<div class="SubLeft"></div>
					<!-- 바로가기 서브메뉴 끝-->
				</div>
			</form>	
		</div>
	</div>

</body>
</html>