package com.momo.comtroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.eclipse.jdt.internal.compiler.IDebugRequestor;

import com.momo.dao.MemberDao;
import com.momo.dto.MemberDto;


@WebServlet("/ex/LoginProcess")
public class LoginProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
  

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 요청 파라미터 수집
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		 
		//Dao를 사용하려면 객체생성
		MemberDao dao = new MemberDao();
		
		//2. 사용자 인증 (id,pw이 일치하는 사용자가 있다면 member 객체를 반환하고 아니면 null 반환
		MemberDto dto = dao.login(id, pw);
		
		
			
		//4. 페이지 전환
		if(dto !=null) {
			//dto가 널이아니면 = 로그인 성공
			//3. session영역을 불러와서 memberDto를 session영역에 저장
			HttpSession session = request.getSession();
			//웹브라우저를 닫을때까지 세션 정보가 서버에 유지
			//또는 세션 만료기간이 남아 있을때
			session.setAttribute("memberDto", session);
			session.setAttribute("userId", id);
			
			//페이지 전환
			response.sendRedirect("main.jsp");
			
		}else {
			//로그인 실패
			//4.페이지 전환
			request.getRequestDispatcher("loginForm.jsp?isError=1").forward(request, response);
		}
		
	}

}
