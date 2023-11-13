<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>3. 요청 헤더 정보 출력 하기</h2>
	
	<%
	//Enumeration (옛날에 만들어짐): 객체들을 집합체 형태로 관리하게 해주는 인터페이서
	//Iterator (최근에는 많이 씀)
	//컬렉션에서 사용됨
	//list, set, map
	Enumeration<String> headers
					=request.getHeaderNames();
	//headername을 얻어서 Enumeration라는 객체타입의 headers변수로 넣는다
	//집합체 객체들의 타입이 string
	while(headers.hasMoreElements()){
	//니가 가지고있는 요소가 있으면 반복문을 실행해
		String headerName = headers.nextElement();
		//nextElement :이름을 하나 가지고와
		String headerValue = request.getHeader(headerName);
		//출력
		out.println("<br>헤더명 : " + headerName);
		out.print("/ 헤더값 :" + headerValue);
	}
	%>

</body>
</html>