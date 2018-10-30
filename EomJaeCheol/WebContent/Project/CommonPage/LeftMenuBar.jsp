<%@page import="java.util.ArrayList"%>
<%@page import="com.member.model.ConnectDAO"%>
<%@page import="com.member.model.ConnectDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.DatabaseContents.Action.Naver"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../PagePaint/StudentPage.css" rel="stylesheet">
<link href="../PagePaint/StudentInfo.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript">
/* 상위메뉴 4개 네비게이션 */
    $(document).ready(function(){
        $(".Menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
    /* 왼쪽 메뉴바 네비게이션 시작 */
    /*.one("click"  */
    /* 학적정보 */
    var cnt=0;
    $(document).ready(function(){
    	$(".NaviHistory").hide();
    	$("#divCall01").click(function(){
    		cnt++;
    		$(".NaviHistory").show('#z');
    	    $(".NaviHistory").append(">"+$("#divCall00").text()+">"+$("#divCall01").text());
    	 	if(cnt>0){
    	 		$(".NaviHistory").html(">"+$("#divCall00").text()+">"+$("#divCall01").text());
    	 	}
    	});
    });
    	cnt=0;
    	 $(document).ready(function(){
        	$("#divCall02").click(function(){
        		cnt++;
        		$(".NaviHistory").show('#H');
        		$(".NaviHistory").append(">"+$("#divCall02").text());
        		if(cnt>0){
        	 		$(".NaviHistory").html(">"+$("#divCall00").text()+">"+$("#divCall02").text());
        	 	}
        	});
        }); 
    /* 수강신청 */
    cnt=0;
    	 $(document).ready(function(){
        	$("#divCall04").click(function(){
        		cnt++;
        		$(".NaviHistory").show('#H');
        		$(".NaviHistory").append(">"+$("#divCall03").text());
        		if(cnt>0){
        	 		$(".NaviHistory").html(">"+$("#divCall03").text()+">"+$("#divCall04").text());
        	 	}
        	});
        });
    	 /* 기타 */
    	 cnt=0;
    	 $(document).ready(function(){
        	$("#divCall06").click(function(){
        		cnt++;
        		$(".NaviHistory").show('#H');
        		$(".NaviHistory").append(">"+$("#divCall05").text());
        		if(cnt>0){
        	 		$(".NaviHistory").html(">"+$("#divCall05").text()+">"+$("#divCall06").text());
        	 	}
        	});
        }); 
    	/* 성적 정보 */
    	cnt=0;
    	 $(document).ready(function(){
        	$("#divCall08").click(function(){
        		cnt++;
        		$(".NaviHistory").show('#H');
        		$(".NaviHistory").append(">"+$("#divCall07").text());
        		if(cnt>0){
        	 		$(".NaviHistory").html(">"+$("#divCall07").text()+">"+$("#divCall08").text());
        	 	}
        	});
        });
    	 cnt=0;
    	 $(document).ready(function(){
        	$("#divCall09").click(function(){
        		cnt++;
        		$(".NaviHistory").show('#H');
        		$(".NaviHistory").append(">"+$("#divCall07").text());
        		if(cnt>0){
        	 		$(".NaviHistory").html(">"+$("#divCall07").text()+">"+$("#divCall09").text());
        	 	}
        	});
        });
    	cnt=0;
    	 $(document).ready(function(){
        	$("#divCall10").click(function(){
        		cnt++;
        		$(".NaviHistory").show('#H');
        		$(".NaviHistory").append(">"+$("#divCall07").text());
        		if(cnt>0){
        	 		$(".NaviHistory").html(">"+$("#divCall07").text()+">"+$("#divCall10").text());
        	 	}
        	});
        });
    	/* 등록 정보 */
    	cnt=0;
    	 $(document).ready(function(){
        	$("#divCall12").click(function(){
        		cnt++;
        		$(".NaviHistory").show('#H');
        		$(".NaviHistory").append(">"+$("#divCall11").text());
        		if(cnt>0){
        	 		$(".NaviHistory").html(">"+$("#divCall11").text()+">"+$("#divCall12").text());
        	 	}
        	});
        });
    	 /* 왼쪽 메뉴바 네비게이션 끝 */
			function calendar(tYear,tMonth) {
			var nowDate = new Date();   
			var nYear = nowDate.getFullYear();   
			var nMonth = nowDate.getMonth();   
			var nDate = nowDate.getDate(); 
			var nNumday = nowDate.getDay();   
			var endDay = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31); 
			var dayName = new Array("일", "월", "화", "수", "목", "금", "토");   
			var col = 0;   

			if (tYear == null)    
			{
				tYear = nYear;
			}  

			if (tMonth == null)   
			{
				tMonth = nMonth;
			} 

			eDate = new Date();   
			eDate.setFullYear(tYear); 
			eDate.setMonth(tMonth); 
			eDate.setDate(1); 
			var fNumday = eDate.getDay();   
			var lastDay = endDay[eDate.getMonth()]; 


			if ((eDate.getMonth() == 1) && (((eDate.getYear() % 4 == 0) && (eDate.getYear() % 100 != 0)) || eDate.getYear() % 400 == 0)) {
				lastDay = 29;
			} 

			calendarStr = "<TABLE class=MainT>"
			calendarStr += "<TR align=center><TD valign=middle>"

			calendarStr += "<a href=javascript:calendar(" + tYear + "," + (tMonth - 1) + ") onclick='Preview()'class=preNext>◀</a>"
			calendarStr += "</TD><TD colspan=5 >"

			calendarStr += "<font size=3 color=black>  <b>" + eDate.getFullYear() + "년 " + (eDate.getMonth() + 1) + "월</b></font> " // 해당하는 년도와 월 표시  
			calendarStr += "</TD><TD valign=middle>"

			calendarStr += "<a href=javascript:calendar(" + tYear + "," + (tMonth + 1) + ") onclick='Postview()'class=preNext>▶</a>"

			calendarStr += "</TD></TR><TR>"
			for (i = 0; i < dayName.length; i++) {
				calendarStr += "<TD class=week>" + dayName[i] + "</TD>"   
			}

			calendarStr += "</TR><TR align=center>"

			for (i = 0; i < fNumday; i++) {   
				calendarStr += "<TD>&nbsp;</TD>"
				col++;
			}

			for (i = 1; i <= lastDay; i++) {  
				if (eDate.getFullYear() == nYear && eDate.getMonth() == nMonth && i == nDate) { //오늘이면 today 스타일로 표시  
					calendarStr += "<TD class=today >" + i + "</TD>"
				} else {
					if (col == 0) {  
						calendarStr += "<TD class=sunday>" + i + "</TD>"
					} else if (1 <= col && col <= 5) { 
						calendarStr += "<TD class=workday>" + i + "</TD>"
					} else if (col == 6) { 
						calendarStr += "<TD class=satday>" + i + "</TD>"
					}
				}

				col++;

				if (col == 7) {  
					calendarStr += "</TR><TR align=center>"
					col = 0;
				}
			}

			for (i = col; i < dayName.length; i++) { 
				calendarStr += "<TD>&nbsp;</TD>"
			}

			calendarStr += "</TR></TABLE>"
			document.getElementById('main_calender').innerHTML = calendarStr   
		}
 
</script>
</head>

<body onload="calendar()">
	<div>
		<div class="test">
			<table class="aa">
				<tr>
					<td class="img_td">
						<img alt="Top_logo" src="../img/Top_logo.jpg">
					</td>
				</tr>
			</table>
			<!-- <form name="form1" action="Top.jsp" id="form1"> -->
			<table>
				<tr>
					<td class="Top_menu1"></td>
					<td class="Top_menu2" onclick="location.href='LeftMenuBar.jsp'"></td>
					<td class="Top_menu3" onclick="fun3()"></td>
					<td class="Top_menu4" onclick="fun4()"></td>
					<td class="Top_menu5"></td>
				</tr>
			</table>
			<!-- </form> -->
		</div>
		<div class="left_menu">
			<form action="login.jsp" method="post">
				<div class="sub_menu">
					<table class="top_table">
						<tr class="main_tr">
							<td>
							 <%
							//String id=(String)session.getAttribute("id");
							
							String U_name=(String)session.getAttribute("name");
							//학생
							String S_name=(String)session.getAttribute("StuName");
							if(U_name==null){	
								%>
									<%=S_name%>님
									환영합니다.
								<%
							}else{
								%>
									<%=U_name%>님
									환영합니다.
								<%
							}
							%>
							</td>
						</tr>
					</table>
					<div class="main_area">
						<!-- 달력표시  -->
						<div id="main_calender"></div>
						<div class="main_calender_info">
							<table class="sub_calender_title" style="height:27px" width="100%">
								<tbody>
									<tr align="center" class="Ftr">
										<th style="width: 160px;">학부/대학원</th>
											<td id="Td1" style="width: auto;">
                                            	<select name="uddl학사시스템코드조회" style="width:100%;">
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
												<td align="center" id="Day" style="font-weight:bold;width:155px;">
 </td><td align="left" style="font-weight:bold;">2018-1 휴학가능기간</td>
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
												<th width="35px" style="background-color:#DAD9FF">
                                                            성공
                                                </th>
												<th style="width:auto;background-color:#DAD9FF">
                                                            로그인 불가사유
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
															if(error=="true"){
															%>
																<input id="" type="checkbox" checked="checked" disabled="disabled">
															<%
															}
															else if(fail=="false"){
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
							<td class="log_td">
								<a href="../로그인/logoutPro.jsp" class="log"><b>로그아웃</b></a>
							</td>
							<td class="Up_td">
								<a href="../회원수정/Modify.jsp" class="infoup">내 정보변경</a>
							</td>
						</tr>
						<%
						if(U_name!=null && U_name.equals("관리자")){
						%>
						<tr>
							<td>
								<a href="../관리자/StudentEnrollment.jsp"><b>관리자</b></a>
							</td>
						</tr>
						<%}%>
					</table>
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
					<jsp:include page="../CommonPage/SubLeftMenuBar.jsp"></jsp:include>
				</div>
			</form>	
		</div>
	</div>

</body>
</html>