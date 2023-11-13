<%@page import="com.momo.dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>sendRedirect</h2>
<p>request영역은 하나의 요청에 의한 응답이 완료될때 소멸된다.</p>
<%
	//공유가되는지 안되는 확인하기 위해 request영역에 2개의 값을 저장
	//request영역을 이용시 값이 유지 되지 않으므로 다른방법을 이용해야 함
	request.setAttribute("request_str", "request_str");
	//객체 저장
	request.setAttribute("request_person", new Person("momo", 30));
	
	
	//그래서 2가지 방법을 이용해서 데이터를 넘길 수 있다
	//1. queryString을 통해 파람미터를 전달
	//다른페이지를 요청할수 있게 처리하고 , 데이터를 넣어줌?isRedirect=1
	response.sendRedirect("requestRedirect2.jsp?isRedirect=1");
	
	//2. session 내장객체 이용해서 session영역에 값을(문자열) 저장
	session.setAttribute("session_str", "session_str");
%>

</body>
</html>