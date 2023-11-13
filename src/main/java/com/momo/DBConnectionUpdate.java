package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;
import org.eclipse.jdt.internal.compiler.IDebugRequestor;

import com.momo.dto.Job;

public class DBConnectionUpdate {


	public static void main(String[] args) {
		String url ="jdbc:oracle:thin:@localhost:1521:orcl";
		String id ="test";
		String pw ="1234";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		
		
		//데이터베이스에 접근하기 위해 라이브러리 필요
		//1. 드라이버 로딩 -> 오류가 나서 try/catch 문
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			
			 con = DriverManager.getConnection(url, id, pw);
			
			//3. 쿼리문장준비
			String sql = "UPDATE JOB SET JOB_NAME = '대표이사' WHERE JOB_CODE ='J1'";
			
			//4. createStatement객체를 이용해서 쿼리 문장 실행 
			 stmt = con.createStatement();
			
			
			//😊😊😊😊.executeUpdate(sql);
			 //SELECT 문장을 실행 할 경우 ResultSet을 반환한다.
			//😊😊😊😊.executeUpdate(sql);
			 //update, insert, delete의 경우 int 타입을 반환
			 //			-> 실행결과 몇건이 처리되었는지
			
			
			 //ResultSet으로부터 getString꺼내온다
			 int res = stmt.executeUpdate(sql);
			
			 System.out.println(res + "건 처리되었습니다.");
				
			
			
		
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버로딩 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("connection 객체 생성 실패");
			e.printStackTrace();
		} finally {
			//connection은 자원을 반납해야한다
			//nullpointexception 예방
			try {
				if(rs!= null)rs.close();
				if(stmt!= null)stmt.close();
				if(con!= null)con.close();
			} catch(Exception e) {
				System.out.println("자원 해제중 예외발생");
				e.printStackTrace();
			}
		}
		
		
		

	}

}
