package com.momo;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

public class DBConnectionMain {



	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "test";
		String pw = "1234";
		
		//데이터베이스에 접근하기위해 라이브러리가 필요
		/**
		 * 1. 드라이버 로딩
		 * 			DB에 접근하기 위해 필요한 라이브러리가 있는지확인
		 * 
		 * 2. connection객체를 얻어온다
		 */
		try {
			//1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("오라클드라이버 확인");
			//2. connection 생성, 재사용하기위해 담아준다
			Connection con = DriverManager.getConnection(url
										, id
										, pw);
			
			//3. 쿼리문장준비
			String sql = "SELECT SYSDATE FROM DUAL";
			
			
			//4. 쿼리 문장실행
			Statement stmt = con.createStatement();
			ResultSet rs= stmt.executeQuery(sql);
			rs.next();//조회된 결과가 있어? 다음줄본다
			
			//없을때까지 가져와 while
			//숫자입력시 1부터
			//숫자또는 결과집합의 컬럼명
			System.out.println(rs.getString("sysdate"));
			
			System.out.println(con);
		} catch (ClassNotFoundException e) {//해당 클래스가 존재하지 않아요
			System.out.println("드라이버 로딩실패 - 라이브러리를 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Connection 객체 생성 실패");
			e.printStackTrace();
		}

	}

}
