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
	//userId 값을 request의 헤더에서 쿠키를 찾아요
	//요청객체로 부터 쿠키정보를 꺼내서(쿠키 배열로 나옴) 유저 아이디값을 변수에 저장합니다
	//만약 쿠키이름이 그 이름이라면 value값을 가져와라
	
	String userId ="";
	String checked = "";
	
	//CookieManager이용해서 다꺼내오기,userid가 값이 있으면 체크해줘
	userId = CookieManager.readCookie(request, "userId");
	//빈 문자열이 아니면 체크해줘 빈 문자열이면 비워줘
	checked = !"".equals(userId) ? "checked" : "";
		
	
	/* Cookie[] cookies = request.getCookies();// 배열에서 쿠키꺼내기
	//브라우저에 처음접근했을때 세션아이디가 만들어지지만 저장된쿠키가 없을수있으니까 null체크
	if(cookies != null){
	
		//반복문 이용해서 원하는 쿠키이름 찾기
		for(Cookie cookie : cookies){//배열 cookies안에 요소들을 하나씩 돌려서 cookie이름사용
			if("userId".equals(cookie.getName())){
				out.print("userId를 찾았어요!!");
				userId = cookie.getValue();
				//아이디값이 있으면 체크박스 체크될수 있게
				checked = "checked";
				break;
				
			}
			
		}
	} */
	//값 출력해서 실행되는지 확인
	out.print("checked값 : " + checked);
	
	
%>
<form action="loginAction.jsp" method="post">
	<div class='loginbox'>
        <div id='login'>
            <input type="text" name="id" id="userpw" placeholder='ID를 입력해주세요.' 
                        required="required" value="<%=userId%>"><br> 
                        
            <input type="password" name="pw" id="userpw" placeholder='PW를 입력해주세요.'
            		    required="required" value="1234"><br>
            <input type="checkbox" name="save_check" value="<%=checked%>">아이디 저장하기<br>
        </div>
        <div id='button'>
        <input type="submit" value="로그인">
        </div>
    </div>
    <div id='info'>
        <a href="">회원가입</a>
        <a href="">ID찾기</a>
        <a href="">PW찾기</a>
    </div> 
</form>

</body>
</html>