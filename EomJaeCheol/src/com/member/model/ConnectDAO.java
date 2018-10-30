package com.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.member.jdbc.DBConnection;

public class ConnectDAO {
	
	
	Connection con =null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	
		public int insertWhois(ConnectDTO conn){	
		try{
			con = DBConnection.getConnect();
			
			// sql 작성 & 객체 생성
			sql = "insert into connect values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, conn.getLoginDay());
			pstmt.setString(2, conn.getIp());
			pstmt.setBoolean(3, conn.isSuccess());
			pstmt.setString(4, conn.getLoginerror());
			pstmt.setString(5, conn.getRemark());
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

	/*public ArrayList<ConnectDTO> Connectlist() {

		ArrayList<ConnectDTO> Connectlist = null;

		try {
			sql = "select * from connect";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Connectlist = new ArrayList<ConnectDTO>();
				ConnectDTO dto = null;
				while (rs.next()) {
					dto = new ConnectDTO();
					dto.setLoginDay(rs.getString("loginDay"));
					dto.setIp(rs.getString("ip"));
					dto.setSuccess(rs.getBoolean("success"));
					dto.setLoginerror(rs.getString("loginerror"));
					dto.setRemark(rs.getString("remark"));
					Connectlist.add(dto);
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
		return Connectlist;
	}*/
		public ArrayList<ConnectDTO> Connectlist() {

			ArrayList<ConnectDTO> Connectlist = null;

			try {
				con = DBConnection.getConnect();
				sql = "select * from connect order by loginDay desc limit 0,10";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
					Connectlist = new ArrayList<ConnectDTO>();
					ConnectDTO dto = null;
					while (rs.next()) {
						dto = new ConnectDTO();
						dto.setLoginDay(rs.getString("loginDay"));
						dto.setIp(rs.getString("ip"));
						dto.setSuccess(rs.getBoolean("success"));
						dto.setLoginerror(rs.getString("loginerror"));
						dto.setRemark(rs.getString("remark"));
						Connectlist.add(dto);
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
			return Connectlist;
	}
		
		
}
