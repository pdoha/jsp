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

public class DBConnectionSelf {


	public static void main(String[] args) {
		String url ="jdbc:oracle:thin:@localhost:1521:orcl";
		String id ="test";
		String pw ="1234";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//데이터가져오면 list에담아야한다
		//화면에 출력하려고 list에 담았다
		//-> rs에 담아서 계속다니면안되고 자원을 반납해야한다
		//데이터 양이 많아서 list 배열을 썼다
		//resultset에있는 데이트를 내가 가질수있는 list담에 놓는다-> 화면가서 보여주려고
		List<Job> list = new ArrayList<>();
		
		//반복문 한번돌때마다 job객체가 만들어짐 
		
		//데이터베이스에 접근하기 위해 라이브러리 필요
		//1. 드라이버 로딩 -> 오류가 나서 try/catch 문
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			
			 con = DriverManager.getConnection(url, id, pw);
			
			//3. 쿼리문장준비
			String sql = "SELECT * FROM JOB";
			
			//4. createStatement객체를 이용해서 쿼리 문장 실행 
			 stmt = con.createStatement();
			
			
			//😊😊😊😊.executeUpdate(sql);
			 //SELECT 문장을 실행 할 경우 ResultSet을 반환한다.
			//😊😊😊😊.executeUpdate(sql);
			 //update, insert, delete의 경우 int 타입을 반환
			 //			-> 실행결과 몇건이 처리되었는지
			
			
			 //ResultSet으로부터 getString꺼내온다
			 rs = stmt.executeQuery(sql);
			
			 //다음행이있니를 반복문을 이용 (rs.next() 의 반환타입이 true false이므로
			while(rs.next()){
				Job job = new Job();
				job.setJobCode(rs.getString(1));
				job.setJobName(rs.getString(2));
				//없을때까지 가져와 while문
				System.out.println(rs.getString(1));
				System.out.println(rs.getString(2));
				System.out.println();
				
				list.add(job);
				
			}
			
			System.out.println("================");
			System.out.println(list);
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
