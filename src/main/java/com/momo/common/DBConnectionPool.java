package com.momo.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnectionPool {

	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public DBConnectionPool() {
		//생성자 안에 톰캣 홈페이지에서 가져온거 복붙
		
		try {
			//JNDI를 통해 커넥션풀 얻어오기
			//톰캣이 만들어논 자원을 얻어온다
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			
			
			
			//커넥션풀을 통해 연결 객체얻기
			//객체를 멤버변수 con에 담아줍니다 -> 자원을 한꺼번에 해결하기 위해
			 con = ds.getConnection();
			 
			 System.out.println("JNDI를 통해 커넨ㄱ션풀에서 커넥션을 얻어오기");
		} catch (NamingException e) {
			System.out.println("=====DBConnection NamingException");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("=====DBConnection SQLException");
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 연결해제 (자원반납)
	 */
	
	public void close() {//여는 순서와 반대로
		try {
			if(rs != null)rs.close(); //위에 멤버변수로 선언해놈
			if(pstmt != null)pstmt.close();
			if(stmt != null)stmt.close();
			if(con != null)con.close();
			
			System.out.println("자원반납 성공");
		}catch (Exception e) {
			System.out.println("자원반납중 오류가발생하였습니다.");
			e.printStackTrace();
		}
		
	}

}
