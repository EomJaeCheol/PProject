package com.member.jdbc;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnection {
	//데이터 처리 객체 (DAO)
	//데이터베이스(mysql)
	public static Connection getConnect() throws Exception{
				Connection con =null;
				// Context 객체 생성
				Context init = new InitialContext();
				//  디비연동 정보를 불러오는 메서드 
				//java:comp/env/jdbc/
				DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Work");
				// ds 객체를 사용하여 디비 연결
				con=ds.getConnection();
				return con;
		}
}
