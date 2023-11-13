<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 쿠키가 없으면 팝업이안뜸 -->
<style>
//
	.none{
		 display:none}

	
</style>

</head>
<body>

<script type="text/javascript">
<%-- 	
	alert("none");
	alert("<%=none%>");
	alert('<%="none"%>');
	
	alert("안녕하세요");
	//변수출력
	alert("<%=str%>"); --%>
	
	//요소선택
	
	window.onload = function(){
		//popupCookie가 없으면 팝업을 화면에 출력
		<%
		String display ="none";
		//CookieManager는 static메서드여서 서버에 실행되는 동시에 미리 만들어줘서 생성하지않고쓸수있다
		//만약에 팝업쿠키를 읽어와서 그값이 Y가 아니면(쿠키가 없으면) 값을 block으로 변경해줘
			if(!CookieManager.readCookie(request, "popupCookie").equals("Y")){
			display="block";
		};
		
		
		%>
		//일단 화면에 출력
		document.querySelector("#popup").style.display='<%=display%>';
		
		//버튼이 클릭외어잇을때
		//check박스에 체크가 되어있으면
		
		
			//닫기 버튼을 클릭하면 form전송
			document.querySelector("#closeBtn").onclick = function(){
				//닫기 버튼이 클릭되었을때 체크박스가 체크되어있는지 확인
				if(document.querySelector("input[id=inactiveToday]").checked==true){
					//서버에 다른페이지 요청
					//popupForm.submit();
					
					fetch('cookieAction.jsp');//fetch로 서버에 요청
					.then((data) => data.json );//받아온 데이터를 object로 만들기
					.then((json) => {
						console.log("data.json", json);
					});
					//문자열을 가져오기 위해 객체를만들어 object로 만든다
					console.log('fetch를 이용하여 서버에 cookieAction.jsp페이지를 요청');
					
				}
					//체크박스에 체크가 되어있든 안되어있든 팝업창 닫기
					document.querySelector("#popup").style.display ='none';
				
			}
			
		
		
	}
</script>

<%-- 
	<%=none%>변수 선언 후에 사용
	<%="none"%>
	태그에 속성을 정의할때, 홑따옴표 또는 쌍따옴표로 감싸주는 것은 
	해당 속성의 값이 어디까지인지를 정의하는ㄱ ㅅ
	
	class속성에 값을 정의 필수, 여러개값을 정의힌,ㄴ 갓
	
	class속성에 값을 저장할 수 있는데, 여러개을 정의 할 수 있음
	class="none w30""
	
	--%>
	

<h2 class="none">쿠키 - 팝업 연습</h2>

<form action="cookieAction.jsp" name="popupForm">
		<div id="popup" class="none">
		
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