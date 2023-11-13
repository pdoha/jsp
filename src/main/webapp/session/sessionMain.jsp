<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>세션 설정</h2>

<h2>session 설정 확인</h2>
<%
//	session.setMaxInactiveInterval(300);
	//session.getCreationTime() long타입으로 반환되기때문에
	//날짜 표시 형식 지정
	SimpleDateFormat sdf = new SimpleDateFormat("HH:MM:SS");
	//문자로 변환
	String createTime = sdf.format(new Date(session.getCreationTime()));
	String lastTime = sdf.format(new Date(session.getLastAccessedTime()));
	session.getCreationTime();

%>
	<!-- session에서 알 수 있는 정보 -->
<ul>
	<li>세션 유지 시간 : <%= session.getMaxInactiveInterval() %> </li>
	<li>세션 아이디 : <%= session.getId() %></li>
	<li>최초 요청 시각 : <%=session.getCreationTime() +"/" +createTime %></li>
	<li>마지막 요청 시각 :<%=session.getLastAccessedTime() +"/" + lastTime %></li>
</ul>


</body>
</html>