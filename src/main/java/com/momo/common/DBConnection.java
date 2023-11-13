package com.momo.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class DBConnection {

		//공통으로 쓰는 객체;
		//내가상단으로 지정한걸로써야함
		public Connection con;
		public Statement stmt;
		public PreparedStatement pstmt;
		public ResultSet rs;
		

		/**
		 * 생성자 - Connection객체 생성
		 */
		public DBConnection(){//패키지를 벗어나도 접근할 수있게
			
			try {
				
				//1. 드라이버로딩
				Class.forName("oracle.jdbc.OracleDriver");
			
				//2. DB에 연결하기 위해 필요한 정보
				
				String url ="jdbc:oracle:thin:@localhost:1521:orcl";
				String id = "test";
				String pw = "1234";
				
				con = DriverManager.getConnection(url, id, pw);	
				
				System.out.println("DB 연결 성공(기본생성자)");
				
			} catch (ClassNotFoundException e) {
				System.out.println("드라이버 로딩 실패");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("Connection 객체 생성 실패");
				e.printStackTrace();
			}
		}
			
		//매개변수로 세팅
		public DBConnection(String driver, String url, String id, String pw) {
			try {
					
					//1. 드라이버 로딩
					Class.forName(driver);
				
					//2. DB Connection 객체 생성
					//멤버변수통에 저장
					con = DriverManager.getConnection(url, id, pw);
					System.out.println("DB 연결성공(인수 생성자");
					
			} catch (ClassNotFoundException e) {
					System.out.println("드라이버 로딩 실패");
					e.printStackTrace();
			} catch (SQLException e) {
					System.out.println("Connection 생성 실패");
					e.printStackTrace();
			}
	}
		//어플리케이션을 매개로받는다 타입이ServletContext
		public DBConnection(ServletContext application) {
			String driver = application.getInitParameter("driver");
			String url = application.getInitParameter("url");
			String id= application.getInitParameter("id");
			String pw = application.getInitParameter("pw");
			
			//어플리케이션객체에서 가져온 driver
			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url, id, pw);
				System.out.println("application 내장객체를 활용한 connection생성");
			} catch (ClassNotFoundException e) {
				System.out.println("드라이버 로딩 실패 - 라이브러리를 확인");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("connection 객체 생성");
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
