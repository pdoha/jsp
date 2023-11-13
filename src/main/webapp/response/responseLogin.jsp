<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//요청정보니까 request 내장객체
	//파라미터 수집해야지
	//출력하기 위해 변수에 담자(재사용을 위해) -->
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//id == momo, pw == 1234 로그인 성공
	if("momo".equals(id) && "1234".equals(pw)){ //스트링 객체이므로 equals 사용
		//id가 numll 일때 nullpointexception 발생 가능성있다
		
		//로그인 성공
		//페이지 전환 -> 웹브라우저 -> 웹브라우저가 다시 요청
		//기존 요청정보가 공유되지 않는다
		//아이디를 피라미터로 넘겨주지 않으면 id값이 공유되지 않는다!
		response.sendRedirect("responseWelcom.jsp?id=" + request.getParameter("id"));//내가 준 경로로 웹브라우저야 다시요청해
	}else{
		//로그인 실패했을 때 이전 화면으로 돌아간다
		//기존 요청정보가 공유된다.
		request.getRequestDispatcher("responseMain.jsp?loginErr=1")
				.forward(request, response); //페이지 전환(웹브라우저를 거치지않고 페이지로 바로 간다.)
		//에러 났으니까 에러 코드값도 같이 넘겨준다
		
	}
%>
<h2>페이지를 전환 하는 방법</h2>
<p>sendRedirect</p>
<p>forward</p>
id : <%=id %> <br>
pw : <%=pw %>
	
	


</body>
</html>