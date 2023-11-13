<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
<!-- 
	웹브라우저에서 서버에 처음 요청할때 서버가 session아이디를 발급
 	-> 응답객체에다가 쿠기에 담아서 웹브라우저로 전송
 	-> 웹브라우저는 응답을 받아서 쿠키에 저장
 	-> 서버에 요청시 쿠키정보를 함께 담아서 요청
 	한번의 요청으로 한번의 응답으로 끊기는데
 	이 관게를 유지하기 위해 id발급
 	
 	
 	
 	session은 회원인증 후 로그인 상태를 유지하는데 사용
 	웹브라우저를 닫고 다시 열게 되면 세션은 유지 되지 않는다.
 
 
 
 
 -->
<%
	//내장 객체 값저장하고 불러오기
	session.setAttribute("person", new Person("momo",30));
	List list = new ArrayList<String>(); //object라서 list도쓸수있음
	list.add("list");
	list.add("set"); //로또만들기 - 새로운 숫자를 추출 -> 담아(중복을 제거)
	
	
	//***비동기통신 map에 데이터를 담아서 전송
	list.add("map");
	
	
	//세션에 문자열 저장
	session.setAttribute("list", list);
	
	
%>
<h2>페이지 전환 후session 영역에 저장된 값을 출력</h2>
<a href="sessionLocation.jsp">sessionLocation.jsp 바로가기</a>

<!--세션무효화  -->
<h2>세션 무효화</h2>
<a href="sessionInvalidate.jsp">sessionInvalidate.jsp 바로가기</a>
</body>
</html>





<!-- session 특징 -->