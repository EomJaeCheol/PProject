<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.model.CalenderDateDTO"%>
<%@page import="com.member.model.CalenderDateDAO"%>
<%@page import="com.DatabaseContents.Action.Naver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	CalenderDateDTO cdto=new CalenderDateDTO();
	CalenderDateDAO cdao=new CalenderDateDAO();
	
	String Year=request.getParameter("Year");
	String month=request.getParameter("month");
	
	String yy=null;
	String cc=null;
	JSONObject obj=null;
	String CalDate="";
	
	ArrayList<CalenderDateDTO> list=cdao.showCalender(Year,month);
	for(int con=0; con<list.size(); con++){
		cdto=list.get(con);
		yy=cdto.getDate().substring(0,4);
		cc=cdto.getDate().substring(5,6);
		 if(Integer.parseInt(month)>=1 && Integer.parseInt(month)<=9){
			if(yy.equals(Year) && cc.equals(month)){
				obj=new JSONObject();
				obj.put("Da", cdto.getDate());
				obj.put("Con",cdto.getContent());
				CalDate = obj.toString();
				//JSONParser JP=new JSONParser();
				System.out.println(CalDate);
				%>
				<%-- <%=CalDate %> --%>
				<%
			}else{
			}
		}else{
			obj=new JSONObject();
			obj.put("Da", cdto.getDate());
			obj.put("Con",cdto.getContent());
			CalDate = obj.toString();
			%>
			<%-- <%=CalDate %> --%>
			<%
			System.out.println(CalDate);
		}
	}
%>
<%=CalDate%>