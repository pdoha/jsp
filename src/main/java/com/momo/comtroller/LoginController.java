package com.momo.comtroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Controller의 역할
 * 	-파라미터 수집
 * 	-페이지 전환 (jsp로 요청을 위임)
 * 
 * 사용자의 로그인 요청을 처리
 * 1. 파라미터 수집 (id, pw)
 * 2.DB로 부터 해당 사용자가 있는지확인
 * 		2-1. 사용자가 존재하면 로그인 처리(세션에 사용자정보를 저장)
 * 		2-2. 사용자가 존재하지 않으면 이전페이지로 넘어가서 오류 메세지를 출력
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//servlet에서 세션을 사용하기 위해서 request로 부터 꺼내옵니다
		HttpSession session = request.getSession();
	}

}
