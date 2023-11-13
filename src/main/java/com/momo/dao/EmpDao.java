package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.common.DBConnection;
import com.momo.common.DBConnectionPool;
import com.momo.dto.EmpDto;

/**
 * 데이터 베이스에 접근해서
 * 데이터 입력, 출력, 삭제, 조회 작업을 처리하는 객체
 * 
 * Dao
 *  -> mapper
 */

public class EmpDao extends DBConnectionPool{
	//DBConnection 객체 상속
	
	//생성자
//	public EmpDao(ServletContext application) {
//		super(application);
//		//어플리케이션정보를 받아서 db에 호출할수있도록 메서드 생성
//		
//	}

//	public void getList() {//데이터 조회
//		try {
//			//멤버변수선언해놔서 선언없이 사용가능
//			stmt = con.createStatement();
//			//변수로뺄수도있다
//			String sql = "SELECT * FROM EMPLOYEE";
//			rs = stmt.executeQuery(sql);
//			
//			//rs.next가 false일때까지 돌아서 출력해숴
//			//처음에 데이터를 바라보고있지않아서 다음이있니?
//			while(rs.next()) {
//			System.out.print(rs.getString(1));
//			System.out.print(rs.getString(2));
//			System.out.print(rs.getString(3));
//			System.out.println();
//			}
//		} catch (SQLException e) {
//			System.out.println("SQLException 예외사항 발생");
//			e.printStackTrace();
//		}
//	}
	//-----------------------------------------------------------
//	→ 자바에서는 데이터 입출력만 담당해서 데이터 조회했으면 넘겨줘야해
//	넘겨주기위해 list나 map에저장
//	콘솔에 출력하던 데이터(위처럼)를 화면에 출력하기 위해 list에 저장 후 반환합니다
	public List<EmpDto> getList(){
		List<EmpDto> list = new ArrayList<>();
		
		try {
			stmt = con.createStatement();
			String sql = "SELECT * FROM EMPLOYEE";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				EmpDto dto = new EmpDto();
				dto.setEmp_id(rs.getString(1));
				dto.setEmp_name(rs.getString(2));
				dto.setEmp_no(rs.getString(3));
				
				list.add(dto);
			}
			
			close(); //메서드 호출해서 자원반납
			
		}catch(SQLException e) {
			System.out.println("예외발생");
			e.printStackTrace();
		}
		return list; //반환값
	}

	
	public static void main(String[] args) {
		//static붇은애만 쓸 수 있음
		//EmpDao empDao = new EmpDao();
		//empDao.getList();
		//-> 기본생성자도없고 어플리케이션객체도 없어
		//서버가 실행될때 만들어지는데 main메서드느 ㄴ서버랑 상관이없음
	}

}
