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
<%
	
	String str = "";
	Person person = new Person();
	
	//request영역에담긴 속성 꺼내오기
	//만약에 NULL이 아니면 값을 저장해줘
	
	if(request.getAttribute("request_str") != null){
		// 변수에담아서 저장, 문자열이니까 형변환
		str = request.getAttribute("request_str").toString();
	}

	
	
	
	if(request.getAttribute("request_person") != null){
		person = (Person)request.getAttribute("request_person");
		//object 타입으로 반환되기 때문에 Person으로 형변환 주의
	}
	;
%>
<!-- 변수저장끝 -->
<h2>getAttribute 결과 출력</h2>
<p>리다이렉트시 request영ㅇ역은 공유되지 않으므로 값이 출력되지않음</p>
<br>
str : <%= str%>
<br>
person : <%= person%>
<h2>querystring 출력</h2>
<p>쿼리스트링으로 전달한 데이터는 getParameter메소드를 이용해서 수집할 수 있따</p>
isRedirect :<%= request.getParameter("isRedirect") %>

<h3>session을 이용한 값출력</h3>test
<!-- 값 가져오기(session에 저장된 문자열 가져오기) -->
session_str : <%=session.getAttribute("session_str") %>

<%
	//세션에 저장된 속성을 제거합니다
	session.removeAttribute("session_str");
%>
<h3>세션 제거</h3>
<br>session_str: <%=session.getAttribute("session_str") %>


</body>
</html>