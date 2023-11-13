package com.momo.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.tomcat.util.descriptor.web.LoginConfig;

import com.momo.common.DBConnectionPool;
import com.momo.dto.MemberDto;

public class MemberDao extends DBConnectionPool {
	public MemberDto login(String id, String pass) {
		//->데이터담을dto 와 dao작성
		MemberDto memberDto = new MemberDto();
		String sql = "select  *\r\n"
	               + "from    member\r\n"
	               + "where   id = ?\r\n"
	               + "and     pass = ?";
		
		//입력받은 사용자 정보를 DB에서 조회
		//사용자 정보를 MemberDto객체에서 담아서 반환
		try {
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, id); //첫번째를 id로
			pstmt.setString(2, pass);
			
			//쿼리 실행
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				//로그인 성공
				
				memberDto.setId(rs.getString(1));
				memberDto.setName(rs.getString(2));
				memberDto.setRegidate(rs.getString(4));
				
				//사용자 정보를 Dto에 담아서 반환
				return memberDto;
			}else {
				//로그인실패
				return null;
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//멤버객체 생성못했으니까 null값 반한
			return null;
		}
		
		 
	
		
	}

	
}
