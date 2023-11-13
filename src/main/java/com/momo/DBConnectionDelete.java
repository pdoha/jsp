package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnectionDelete {


	public static void main(String[] args) {
		//데이터베이스에 접근할 수 있는 정보 생성
		String url ="jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "test";
		String pw = "1234";
		
		Connection conn= null;
		
		try {
			//1. 드라이버로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//2. 커넥션 생성
			conn = DriverManager.getConnection(url, id, pw);
			
			//3. 쿼리 생성
//			String sql = "INSERT INTO JOB VALUES('99','값99')";
			//변경되는 값 ?
			String sql = "DELETE JOB WHERE JOB_CODE = ?";
			
			//4. pstmt 객체 생성
			//쿼리 문장이 변해(동적인 쿼리 생성)
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			//5. 인파라미터 세팅
			//쿼리상에 ?값 몇번째에 어떤값을 넣을건데
			pstmt.setString(1, "97"); //첫번째 99
			
			
			//6. 쿼리실행 (insesrt는 executeUpdate , 반환타입 int)
			int res = pstmt.executeUpdate();
			System.out.println(res + "건 삭제 되었습니다.");
			
		} catch (ClassNotFoundException e) {
			System.out.println("라이브러리를 확인해주세요");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
