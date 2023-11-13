

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
<h2>팝업용쿠키 생성하는 페이지</h2>

<%	
	//inactiveToday값을 출력
	//name속성의 value값을 가져온다
	//value속성의 값request.getParameter("name속성의값");
	out.print("inactiveToday :" + request.getParameter("inactiveToday"));
	if("Y".equals(request.getParameter("inactiveToday"))){
		//팝업닫기용(popupClose, Y) 쿠키 생성 
		
		CookieManager.makeCookie(response,"popupClose", "Y", 3600);
		
	}
	

	//끝나면 main페이지로 이동(전환)
	//응답 객체가 가지고있따
	response.sendRedirect("cookiePopupMain.jsp");
	
	
	
	
%>

</body>
</html>