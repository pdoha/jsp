<%@page import="com.momo.dto.MemberDto"%>
<%@page import="com.momo.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 프로세스</h2>
<%
	//1.사용자의 요청 파라메터 수집 (user_id, user_pw)
		String id = request.getParameter("user_id");
		String pass = request.getParameter("user_pw");
	//2. DB에 등록된 사용자인지 확인
	// 		-user 테이블생성
	//데이터조회 dao
	
	//dao객체 생성
	MemberDao dao = new MemberDao();
	//로그인 처리
	MemberDto dto = dao.login(id, pass);
	
	//자원 해제
	dao.close();
	//		-사용자 정보 등록
	
	
	//id,pw가 일치하는 사용자 정보를 반환
	if(dto != null){
		//로그인 성공 -> 메인페이지로 이동
		//이동하기 전에 세션에 저장
		session.setAttribute("memberDto", dto); //사용자정보만
		session.setAttribute("userId", id); //id만
		
		response.sendRedirect("loginMain.jsp");
		
	}else{
		//로그인 실패 -> 로그인페이지 이동 후 메세지 출력
		//요청한 나를 기준으로 찾기때문에 session안에있는 loginForm을 찾아감
		request.getRequestDispatcher("loginForm.jsp?isError=1").forward(request, response);
		%>	
	
	
	<script> 
	alert("실패");
	</script>
	<%
	}
	%>


</body>
</html>