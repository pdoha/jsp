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
<h2>이동완료</h2>
<%	//페이지 영역으로부터 값을 가지고나옴
	//오류 -> object로 형변환 후 오류내용 작성
	Object page_str= pageContext.getAttribute("page");
	//nullpointexcetion 오브젝트값을 받아서 이게 널인지 체크
	Object page_int = pageContext.getAttribute("page_int");
	Object page_p = pageContext.getAttribute("pagePerson");
%>
<br>String : <%= page_str == null ? "값없음" : page_str %>
	<!-- null이면 "", 아니면 값 -->
<br>int : <%= page_int == null ? "값없음" : page_int %>
<br>person : <%= page_p == null ? "값없음" : page_p %>
<!-- 해당 영역은 하나의 페이지에서만 공유됨 그래서 다 값없음으로 뜸 -->
	

</body>
</html>