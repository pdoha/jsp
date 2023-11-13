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
<h2>forward 페이지</h2>
main에서 한 요청을 응답페이지로 나온다
<h3>requesstMain페이지 forward!!</h3>
<%
	//request영역으로부터 값을 꺼내온다
	
	
	
	String request_str = "값없음";
	Person request_person = new Person();
	
	if(request.getAttribute("request_str") != null){
		request_str = request.getAttribute("request_str").toString();
		
	}
	
	if(request.getAttribute("request_person")!= null){
		request_person = (Person)request.getAttribute("request_person");
	}
	//null이아니면 isRedirect 속성이 있다는거니까 값가져올수있음
	String title
		= request.getAttribute("isRedirect") != null ? "redirect" : "forward";
%>
<%= title %> 방식으로 호출됨
<br>
<%= request_str %>
<br>
<%= request_person %>
</body>
</html>