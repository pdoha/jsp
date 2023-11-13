<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer= "8kb" autoFlush ="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
버퍼
	응답 결과를 웹 브라우저의 즉시 전송하지 안혹,
	출력할 내용을 버퍼에 저장해 두었다가
	일정량 차면 클라이언트로 전송
	-> 사용하는 이유
	   - 컴퓨터에는 여러장치가 있는데 cpu나 메모리는 속도가 빠른데
	   IO(입출력장치) 는 속도가 좀느리다
	   이런 속도 차이를 극복하기 위해서 모았다가 한번에 전송
  	   - 버퍼상자에 저장해 두었다가 일괄적으로 한번에 전송
  	   
  -->
<%
	for(int i=0; i<100; i++){
		out.println("abcde12345");
	}

	//buffer사이즈
	out.print("<br>test");
	out.println(out.getBufferSize());
	out.println(out.isAutoFlush());


%>

</body>
</html>