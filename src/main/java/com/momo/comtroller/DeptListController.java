package com.momo.comtroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.DeptDao;
import com.momo.dto.DeptDto;


@WebServlet("/DeptListController")
//이 url이 실행이되면 밑에 실행됨
public class DeptListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DeptListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    //controller survelt호출
    //데이터베이스 호출할수있는
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//db에 접근해서 데이터list를 조회
		DeptDao dao = new DeptDao(request.getServletContext());//application
		//getlist로 조회해와서
		List<DeptDto> list = dao.getList();
		//내장객체 request에 저장
		request.setAttribute("list", list);
		//페이지 전환 -> deptList.jsp로
		request.getRequestDispatcher("deptList.jsp").forward(request, response);
//		PrintWriter out  = response.getWriter();
//		out.print("<h2>안녕하세요/h2>");
	}



}
