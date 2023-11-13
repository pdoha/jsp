<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--수집한 결과값 출력  -->
</head>
<body>
<%	
	/* 파라미터 수집전 인코딩 정보 설정 */
	//POST방식일때 발생하는 한글깨짐 처리
	//중복코드는 filter를 통해서 요청을 한번 거치고
	//로그인안한사람한테 로그인페이지로 보냈다가 로그인하면 그전페이지로 보내는것
	//필터 : web.xml, 어노테이션
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	String favo = "";
	//다중 체크박스인 경우
	//체크박스는 여러개가 선택될 수 있기 때문에 배열형태로 받아서 처리
	String[] favoArr = request.getParameterValues("favo");
	//1. 반복문을 이용해서 하나씩 출력
	//배열의 처음부터 끝까지 돌면서 값을 저장
	//for(String favoStr : favoArr){
	//	favo += favoStr + "";
	//}
	//인덱스를 이용한 반복 - 범위 지정, 증감조절가능
	for(int i=0; i< favoArr.length; i++){
		favo += favoArr[i] + "\n";
		
	}
	out.print("===============================");
	//2. Arrays.toString()
	//out.print(Arrays.toString(favoArr));
	//배열 object를 넣어준다
	String intro = request.getParameter("intro");
%>
<ul>
	<li>아이디 : <%=id %></li>
	<li>성별 : <%=sex %></li>
	<li>관심사항 : <%=favo %></li>
	<li>자기소개 : <%=intro %></li>
</ul>

</body>
</html>