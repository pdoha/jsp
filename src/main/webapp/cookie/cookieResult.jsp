<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키값 확인</h2>
<%
	//사용자가 쿠키를 request header에 넣어줌
	//우린 request에서 꺼내온다
	//request로 받아온 쿠키객체를 저장
	Cookie[] cookies = request.getCookies();
	//.찍어서 뭘 확인할때는 null체크
	if(cookies != null){
		//사용자가 전송한 쿠키정보에 어떤 값이알고싶은지 알고싶을때
		//반복문 사용
		for(Cookie cookie: cookies){
			String name = cookie.getName();
			String value = cookie.getValue();
			
			out.print("쿠키명:" + name + "/쿠키값 : "+ value + "<br>");
			
			
		}
	}
%>
	


</body>
</html>