<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>예외상황이 발생 하였습니다.</h1>
<p>
	오류명     : <%= exception.getMessage() %>
	오류 메세지 : <%= exception.getMessage() %>
	</p>

</body>
</html>