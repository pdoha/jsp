<%@page import="com.momo.utils.CookieManager"%>
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

	//팝업용 쿠키를 생성하고 cookieMain 페이지로 전환 popupCookie
	
	//서버는 response응답객체에 저장해주면 브라우저가 확인 후 쿠키저장
	
	
	//브라우저가 확인후 쿠키가 있으면 쿠키에 저장
	CookieManager.makeCookie(response, "popupCookie", "Y", 3600);


	//페이지 전환
	//1. sendRedirect
	response.sendRedirect("cookieMain.jsp");
	
	//2.forward
	//request.getRequestDispatcher("cookieMain.jsp").forward(request, response);

	%>

</body>
</html>