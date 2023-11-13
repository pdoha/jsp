<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>응답 객체</h2>
<%	
	//에러 메세지
	//1. 만약 loginErr가 1이면 아이디/비밀번화 확인해주세요
	String msg = "";
	if("1".equals(request.getParameter("loginErr"))){
		msg = "아이디/비밀번화 확인해주세요";
	}
	out.print(msg);
	//forward를 사용할 경우request요청정보가 공유가 된다 (하나의 정보니까)
	//한번 요청한 정보를 가지고온다
	//2. id입력칸에 사용자가 입력한 아이디를 출력
	String id ="momo";
	if(request.getParameter("id") != null){
		id = request.getParameter("id");
		//value값도 바꿔줘야함  "<%=id">
	}
	
	//실패했을때 나오는 메세지이므로 처음에는 null나옴
	out.print( request.getParameter("loginErr"));
	out.print(request.getParameter("id"));
%>
<form action="responseLogin.jsp" method = "post">
<!-- get방식은 아이디와 비밀번호가 노출되므로 로그인은 post방식이 적절하다 -->
	아이디 :<input type = "text" name="id" value = "<%=id%>">
	비밀번호 :<input type = "password" name="pw" value="1234">
	<button>로그인</button>
</form>

<h2>응답헤더 확인하기</h2>
<form action="responseHeader.jsp" method="get">
	<button>응답헤더</button>
</form>


</body>
</html>

