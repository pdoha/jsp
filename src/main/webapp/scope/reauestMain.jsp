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
<%
	/* 저장되어있는 속성 읽어오는것
	저장할때는 오브젝트타입으로 모든객체로 읽어올수있고
	꺼내올때는오 오브젝트 타입이라서 형변환해야하는데 ,값이 없을수 없으니까 null체크가 필요하다 */
	request.setAttribute("request_str", "request영역에 문자열저장");
	request.setAttribute("request_person",new Person("momo",30));
	
	String request_str = "값없음";
	Person request_person = new Person();
	
	//반환타입이 object 여서 형변환이 필요한데.. 값이 비어있을수있어서 널체크
	if(request.getAttribute("request_str") != null){
		 request_str=  request.getAttribute("request_str").toString();
	}
	
	if(request.getAttribute("request_person")!= null){
		request_person =(Person)request.getAttribute("request_person");
	}
	/*  request_str = 
		request.getAttribute("request_str") != null ?
			request.getAttribute("request_str").toString() : "값없음";
 */
%>
<!-- 객체 출력 하면 객체가 갖고있는 toString메소드가 호출이된다 -->
<%= request_str %>
<br>
<%= request_person %>

<%
	//foward : request 영역공유
	//sendredirect : request 영역 공유 안됨
	
	//foward로 페이지 넘겨보기

%>
<h2>foward된 페이지에서 request 영역 속성 값 읽기</h2>

<%
	if(request.getParameter("isRedirect") != null){
	//redirect 방식
	response.sendRedirect("requestForward.jsp?isRedirect=1");
	//isRedirect null이 아니면 Redirect 아니면 forward
	}else{
	
		
		
	//RequestDispatcher를꺼내서 forward를 씀	
	//forward 방식
		RequestDispatcher d =  request.getRequestDispatcher("requestForward.jsp");
		d.forward(request, response);
	}

	
	//처음에는 값을안넣어줘서 forward방식으로 호출되고 주소창에 값을 넣어주면  ?isRedirect=1
	//?값을넣어주면 둘다 확인 가능 -> 값을넣어주기위해 request.getParameter("isRedirect") 이값을 넣어줘야한다 forward페이제에
%>

</body>
</html>