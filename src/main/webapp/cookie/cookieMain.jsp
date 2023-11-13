<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Cookie</h2>
<!-- 
cookie
	클라이언트의 상태 정보를 클라이언트 pc에 저장한다.
	로그인아이디를 저장하거나, 팝업창을 제어하는데 주로 사용 됩니다.
 -->
 <h3>1. 쿠키 설정</h3>
 

 <%	
 	//객체이기 때문에 new연산자로 생성하고 response 객체에 의해서 사용자에게 전달
 	//응답헤더에 담아준다
 	Cookie cookie = new Cookie("myCookie", "value");
 	//기본 생성자가 없어서 값을 넣어준다
 	
 	//쿠키가 유지될 시간을 초단위로 지정
 	cookie.setMaxAge(3600);
 	
 	//생성한 쿠키를 응답객체를 통한 브라우저로 전달
 	response.addCookie(cookie);
 %>
 
 <h3>2. 페이지 이동 후 쿠키값 확인</h3>
 <a href="cookieResult.jsp">쿠키값 확인</a>
</body>
</html>