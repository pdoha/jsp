
<%@page import="com.momo.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<ul>
	<!-- 요청 객체 request가 갖고 있는 메소드 -->
	<li>데이터 전송 방식 : <%=request.getMethod() %></li>
	<li>URL : <%=request.getRequestURL() %></li>
	<li>프로토콜 : <%=request.getProtocol() %></li>
	<li>서버 이름 : <%=request.getServerName() %></li>
	<li>포트번호 : <%=request.getServerPort() %></li>
	<li>클라이언트 ip주소 : <%=request.getRemoteAddr() %></li>
	<li>쿼리스트링 : <%=request.getQueryString() %></li>
	<!--URL?이름=값&이름=값 뒤에 따라오는거 물음표없으면 null-> nullpointexception주의 -->
	<!-- 태그(요소)가 가지고있는 name 속성
	(서버로 넘어온것은 name속성) -->
	<li>파라미처 : <%=request.getParameter("eng") %></li>
	<li>파라미처 : <%=request.getParameter("han") %></li>


	<%
		UserVO user = new UserVO();
		String age = request.getParameter("age");
		user.setAge(Integer.parseInt(age));
		
		user.setName(request.getParameter("name"));
	%>
</ul>
</body>
</html>