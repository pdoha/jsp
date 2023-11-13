package com.momo.dao;


import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.common.DBConnection;
import com.momo.dto.Job;

public class JobDao extends DBConnection{//application쓰려면 상속받아야지

	//application이용해서 
	//데이터 베이스에 접근하고 싶으면 DBConnection
	//생성자를 통해서
	//데이터베이스 설정 정보를 읽어올 수 있도록 처리
	public JobDao(ServletContext application) {// application의 타입이 ServletContext 이다
		//부모의 생성자를 호출할수 있게해주는 super메서드
		super(application);
		
	}
	
	/**
	 * Job테이블의 내용을 조회 후 리스트에 담아서 변환
	 * @return
	 */
	
	//job에 대한 list조회하고 반환하는 메소드
	//list조회(외부에서 날 조회할 수 있도록)
	public List<Job> getList(){//데이터 담아논 패키지 dto안에 Job
		List<Job> list = new ArrayList<>();
		
		
		try {
			//DBConnection 에 멤버변수로 선언해놔서 타입을 안적어줘도된다
			stmt = con.createStatement();
			//쿼리실행 executeQuery, 재사용하기 위해 변수에 담는다
			rs = stmt.executeQuery("SELECT * FROM JOB");
			
			 //다음행이 있니? 조회된 결과가 있니?
			//rs.next();는 한줄밖에못가져온다 -> 조회된거 다 가져와
			while(rs.next()) {//false가될때까지 가져와
				Job job = new Job(); //객체를 생성하고
				//담아준다(데이터 세팅)
				job.setJobCode(rs.getString(1));
				job.setJobName(rs.getString(2));
				
				//담고 list에 넣어준다 ->job은 목록이 여러개니까 
				list.add(job);
			
			
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
		
		
		
		
//		접근해야 하니까 Connection
//		쿼리 실행 Statement
//		결과집합 받아야하니까 resultset
//		반복문을 돌아 하나씩 꺼내서 job이라는객체에 저장하고
//		저장한 객체를 list에담아둔다
		
	}

}
