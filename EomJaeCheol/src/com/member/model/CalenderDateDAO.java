package com.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.member.jdbc.DBConnection;
import com.mysql.cj.xdevapi.JsonArray;

public class CalenderDateDAO {
	Connection con =null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	
		public int insertDate(CalenderDateDTO date){	
		try{
			con = DBConnection.getConnect();
			
			// sql 작성 & 객체 생성
			sql = "insert into calenderdate values(?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, date.getDate());
			pstmt.setString(2, date.getContent());
			// sql 실행
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("디비 연결 실패 || 데이터 삽입 실패");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 해제
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		//insert 실패
		return -1;
	}
		
	public ArrayList<CalenderDateDTO> showCalender(String Year,String month) {

		ArrayList<CalenderDateDTO> showCalender = null;

		try {
			con = DBConnection.getConnect();
			sql = "select * from calenderdate where Date like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,"%"+Year+"년"+month+"%");
			
			
			rs = pstmt.executeQuery();
			showCalender = new ArrayList<CalenderDateDTO>();
			CalenderDateDTO dto = null;
			//System.out.println("test1");
			while (rs.next()) {
				//System.out.println("test2");
				dto = new CalenderDateDTO();
				dto.setDate(rs.getString("Date"));
				dto.setContent(rs.getString("Content"));
				/*if(rs.getString("Date").substring(0, 3).equals(Year) &&
					rs.getString("Date").substring(5,5).equals(month)){
					System.out.println("Test");
					//System.out.println(dto.getDate());
					showCalender.add(dto);
				}*/
				showCalender.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 해제
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (con != null) {
					con.close();
					con = null;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return showCalender;
	}
/*		public ArrayList<CalenderDateDTO> showCalender(String Year,String month) {

			JsonArray arr=null;

			try {
				con = DBConnection.getConnect();
				sql = "select * from calenderdate";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				arr = new JsonArray();
				CalenderDateDTO dto = null;
				//System.out.println("test1");
				while (rs.next()) {
					//System.out.println("test2");
					dto = new CalenderDateDTO();
					dto.setDate(rs.getString("Date"));
					dto.setContent(rs.getString("Content"));
					if(rs.getString("Date").substring(0, 3).equals(Year) &&
						rs.getString("Date").substring(5,5).equals(month)){
						System.out.println("Test");
						//System.out.println(dto.getDate());
						showCalender.add(dto);
					}
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// 자원 해제
				try {
					if (pstmt != null) {
						pstmt.close();
						pstmt = null;
					}
					if (con != null) {
						con.close();
						con = null;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return arr;
		}*/
}
