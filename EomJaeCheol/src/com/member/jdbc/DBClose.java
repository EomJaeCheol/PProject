package com.member.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class DBClose {
	public static void CloseDB(){
		
		Connection con=null;  //멤버변수로 사용 , 즉 인스턴스 변수로 사용한다!
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	
		if(rs!=null){
			try {
				rs.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		if(con!=null){
			try {
				con.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
}
