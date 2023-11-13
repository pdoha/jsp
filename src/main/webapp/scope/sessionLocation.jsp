<%@page import="java.util.List"%>
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
<h2>session 영역의 속성 읽기</h2>
<%
	
	//person 객체가 null일 수 있으니까
	if(session.getAttribute("person") != null){
		Person p =(Person) session.getAttribute("person");
	}else{
		out.print("session에 저장된person객체가 존재하지 않습니다");
	}


	if(session.getAttribute("list") != null){
		//변수에 담아서 출력
		List<String> list =
			(List)session.getAttribute("list");
		
		out.print("<br>");
		//반복문 돌면서 데이터 출력
		//list에 들어간 문자열을 모두 출력해줘
		for(String str : list){
			out.print(str + "<br>");
		}
				
	}

%>

</body>
</html>