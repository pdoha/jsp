

<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:#fff;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
    
    .off{
    	    display: none;
    }
</style> 
<body>
<h2>쿠키를 이용한 팝업창 제어 ver 02</h2>
<%
	//쿠키값 가져오기
	String popupClose =
	CookieManager.readCookie(request, "popupClose");

	

	String off = popupClose.equals("Y")? "off" : "";
	//off는 변수가 됐으니까 밑에서 변수 처리 
%>
<!--쿠키를 생성한는 페이지로 요청  -->
<form action="cookiePopupActioin.jsp">

		<div id="popup" class="<%=off%>" >
	        	<h2 align="center">공지사항 팝업입니다.</h2>
	        	<div align="right">
		        
		          <input type="checkbox" id="inactiveToday" value="Y" checked/> 
		           하루 동안 열지 않음
		          <input type="button" value="닫기" id="closeBtn" /> 
		        
	        	</div>
	    	</div> 
</form>
</body>
</html>