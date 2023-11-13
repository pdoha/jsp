<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%-- 
	<jsp:include>    :외부파일을 현재 파일에 포함시킵니다
					(현재 페이지로 불러들이는방식)
 --%> 
 
 
 <%
 	pageContext.setAttribute("attrPate","attrPate");
 	request.setAttribute("attrRequest", "attrRequest");
 	
 	%>
<h2>지시어와 액션태그 동작 방식 비교</h2>
<h3>지시어 방식</h3>

<hr>

<%@include file="inc/OuterPage1.jsp" %>
include지시자 방식에서 선언한 변수 : <%=newVar1 %>
<hr>
<p>페이지영역이 공유된다
include되는 페이지에서 생성한 변수도 공유가됨
페이지가 컴파일되기전에 끼어넣어서 컴파일하는것</p>
page는 한페이지에서만 공유되는데 페이지 지시자를 통해서는 공유가 되더라


<h3>액션태그 방식</h3>
페이지영역이 공유되지 않는다
<jsp:include page="inc/OuterPage2.jsp"></jsp:include>
액션태그 방식에서 선언한 변수  :<%--  <%=newVar2 %> --%>
->각각컴파일되서 사용하는 것
액션 태그 방식은
페이지 영역이 공유가 안되고
외부파일에서 생성된 변수가 공유되지않는다
</body>
</html>