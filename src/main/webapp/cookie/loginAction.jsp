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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	//체크박스 이름 save_check값이 null이 아니라면
	//체크박스는 값이 선택된 경우 에만 넘어옵니다!
	
	//체크박스 체크되어있는지 확인하기위해 값을 가져오고 save_check에 저장해서 수집
	String save_check = request.getParameter("save_check");
	out.print("save_check: " + save_check);
	//null이 아니면 checkbox 체크된거니까 아이디를 쿠키에 저장한다
	if(save_check != null){ //save_check== y
	
		//어디에서든 사용할 수있는 쿠키 메서드
		CookieManager.makeCookie(response, "userId", id, 3600);

		// 아이디를 쿠키객체를 생성해서 넣어준다
		//넘어온 값을 이미id에 저장했으니까 넣어준다
		Cookie cookie= new Cookie("userId",id); //기본생성자가없어서 이름과 값을정한다
		//만료시간  정해주기
		cookie.setMaxAge(3600);
		//클라이언트 pc에 전송을해서 쿠키저장
		response.addCookie(cookie);
		out.print("아이디를 쿠키에 저장 했습니다.");
		
	}
	if(true){
//	if("momo".equals(id) && "1234".equals(pw)){
		out.print("<h2>로그인 성공</h2>");
	}else{
		String script =
				//script 문자열로 바꾸기
		"script type='text/javascript'>"
		+ "alert('id/pw를 확인해주세요');"
		+ "history.go(-1);"
		+"</script>";
		out.print(script);
	
%>
<!--이렇게도 가능  -->
<!-- <script type="text/javascript">
	alert('id/pw를 확인해주세요');
	history.go(-1);
	
	//history 객체의 go 나 back을 이용해서 페이지를 이동시킬수 있다
	//앞으로도갈 수 있고 뒤로도 갈 수 있음
</script> -->
<%
}	
%>
</body>
</html>