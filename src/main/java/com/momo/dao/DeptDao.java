package com.momo.dao;



import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;
import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

import com.momo.common.DBConnection;

import com.momo.dto.DeptDto;

public class DeptDao extends DBConnection{

	
		public DeptDao(ServletContext application) {
			super(application);
		}
		
		public List<DeptDto> getList() {
			List<DeptDto> list = new ArrayList<>();
			
			String sql = "SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID, LOCAL\r\n"
					+ "FROM DEPARTMENT D, LOCATION L\r\n"
					+ "WHERE D.LOCATION_ID = L.LOCAL_CODE";
			try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				DeptDto dto = new DeptDto();
				dto.setDept_id(rs.getString("dept_id"));
				dto.setDept_title(rs.getString("dept_title"));
				dto.setLocation_id(rs.getString("location_id"));
				dto.setLocal_code(rs.getString("local_code"));
				dto.setNatioinal_code(rs.getString("natioinal_code"));
				dto.setLocal_name(rs.getString("local_name"));
				
				
				
				list.add(dto);
			}
			}catch (SQLException e) {
				System.out.println("SQLException예외발생");
				e.printStackTrace();
			}
			return list;
		}
		//만든 리스트 화면에 전달
		
		
		
		
	

}
