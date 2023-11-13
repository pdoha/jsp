<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>응답헤더 정보 출력하기</h2>
	<%
	//헤더 정보를 추가하거나 삭제
	response.addIntHeader("age", 100);
	response.addHeader("id", "momo");//addHeader 추가
	response.setHeader("id", "test");//setHeader 수정
	Collection<String> headerNames
				= response.getHeaderNames();
	
	for(String hName : headerNames){//collection집합에서 한개씩 꺼내
		//headerNames를 name에 담는다
		String hValue = response.getHeader(hName);
		out.print("<br>헤더명 : " + hName);
		out.print("/ 헤더값 : " + hValue);
		//스플립스 내부에서 자바코드 작성중인데 html문장을 그냥 브라우저에 작성하고싶다
		//잠깐 자바코드를 벗어나고싶어
	%>
		
	
	<li><%=hName %>  :  <%=hValue %></li>
	
	<% 
	}
	%>
	

</body>
</html>