package com.momo;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

public class DBConnectionEmp {



	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "test";
		String pw = "1234";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//데이터베이스에 접근하기위해 라이브러리가 필요
		/**
		 * 1. 드라이버 로딩
		 * 			DB에 접근하기 위해 필요한 라이브러리가 있는지확인
		 * 
		 * 2. connection객체를 얻어온다
		 */
		try {
			//1. 드라이버 로딩(라이브러리있는지 확인)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("오라클드라이버 확인");
			//2. connection 생성, 재사용하기위해 담아준다
			 con = DriverManager.getConnection(url
										, id
										, pw);
			 
			int empId = 210;
			
			//3. 쿼리문장준비
			String sql = "SELECT EMP_ID, EMP_NAME, EMP_NO FROM EMPLOYEE WHERE EMP_ID >" + empId;
			
			
			//4. 쿼리 문장실행 createStatement객체를 이용
			stmt = con.createStatement();
			 
			//😊😊😊😊.executeUpdate(sql);
			 //SELECT 문장을 실행 할 경우 ResultSet을 반환한다.
			//😊😊😊😊.executeUpdate(sql);
			 //update, insert, delete의 경우 int 타입을 반환
			 //			-> 실행결과 몇건이 처리되었는지
			 //ResultSet으로부터 getString꺼내온다
			rs = stmt.executeQuery(sql);
			 
			//rs.next();//조회된 결과가 있어? 다음줄본다
			//전체를 출력하고싶을 경우while문으로 루프돈다
			while(rs.next()) {//rs가 다음행이 없을떄까지(true가 아닐떄까지) 반복
			
			//없을때까지 가져와 while
			//숫자입력시 1부터
			//숫자또는 결과집합의 컬럼명
			System.out.print(rs.getString("EMP_ID"));
			System.out.print("\n"+rs.getString("EMP_NAME"));
			System.out.println(rs.getString("EMP_NO"));
			/*
			 * System.out.println(rs.getString(1)); System.out.println(rs.getString(2));
			 * System.out.println(rs.getString(3));
			 */
			}
			
			
			
			
			System.out.println(con);
		} catch (ClassNotFoundException e) {//해당 클래스가 존재하지 않아요
			System.out.println("드라이버 로딩실패 - 라이브러리를 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Connection 객체 생성 실패");
			e.printStackTrace();
		} finally {
			//nullpointexception 예방
			//마지막에 실행한것부터 닫는다
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(con!=null)con.close();
			} catch(Exception e) {
				System.out.println("자원 해제중 예외사항이 발생하였습니다.");
				e.printStackTrace();
			}
			
			
		}

	}

}
