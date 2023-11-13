<%@page import="com.momo.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인성공</h2>
<%=session.getAttribute("userId") %> 님 환영합니다. 
<a href="logoutProcess.jsp">로그아웃</a>
<hr>
<%
//로그인 정보 확인하기전에 세션엥 값이 없을경우에 대비해서 오류발생 하지않도록 null처리
if(session.getAttribute("memberDto")!= null){//session에서 꺼내온게 널이아니면
	MemberDto dto =(MemberDto)session.getAttribute("memberDto");


%>

아이디 :<%=dto.getId() %><br>
비밀번호 :<%=dto.getName() %><br>
등록일 :<%=dto.getRegidate() %>
<%} %>

</body>
</html>