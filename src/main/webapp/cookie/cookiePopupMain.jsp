

<%@page import="java.net.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:#fff;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style> 
<title>Insert title here</title>
</head>
<body>
<h2>쿠키를 이용한 팝업창 제어 ver 01</h2>

<script>
	//화면에 대한 동적인 처리
	//window객체의 onload이벤트가 발생하면 실행
	//html요소들을 모두 생성된 상태에서 실행
	//onload이벤트로 감싸주는 이유- 이 코드가 실행되는시점에서는 없었으므로
	window.onload = function(){
		
	
	
			//팝업클로즈 쿠키의 값이 Y 인지 확인
			//만약 Y이면, 팝업창을 화면에서 숨김처리
			//쿠키값 가져와서 Y인지 확인
			<%
			//requset로부터 쿠키이름을 꺼내와서
//			String popupClose = CookieManager.readCookie(request, "popupClose");
			//변수에저장 (재사용하기 위해)
			//쿠키이ㅔ 저장된 팝업 클로즈의 값이 Y가 아니면 팝업을 보여줘
			//지금 Y여서 밑에 코드가 실행이안된다
//			if("Y".equals(popupClose)){
			//script실행 자바코드가 아니므로 벗어났다가 다시열어준다
			%>
			//이름을 불러준다, 요소를 선택후 화면에서 숨김처리
//			document.querySelector('#popup').style.display = 'none';
	<%
	
		
		
//	}
	%>	
	//버튼에 이벤트 등록
		closeBtn.onclick = function(){//요소를 선택하고 클릭이벤트를 등록	
		
		//if문이 참일때만 실행하는 문장
		//체크박가 체크 되어 있으면 체크박스 선택되었습니다 메세지 출력
		if(document.querySelector('#inactiveToday').checked){
			
			console.log('체크박스가 선택 되었습니다'); //쿠키생성확인
			
			//서버에 요청 방법
			//1. href queryString 이용해서 파라미터 전달
			//2. form submit: form안에 요소들을 가지고 이동
			popupForm.submit();
		}else
			console.log('체크박스가 선택되지 않았습니다')
		//display 
		popup.style.display='none';
		
		}	
	}
		
		
	
</script>

<!--  

1. 닫기 버튼 클릭하면 cookiePopupAction.jsp 파일을 호출 - 팝업닫힘 쿠키생성
2. 팝업 닫힘 쿠키가 생성이 되어 있다면,더이상 팝업창을 보여주지 않도록 처리

-->
<form action="cookiePopupAction.jsp" name="popupForm">
		
		<%
		//requset로부터 쿠키이름을 꺼내와서
		String popupClose = CookieManager.readCookie(request, "popupClose");
		//변수에저장 (재사용하기 위해)
		//쿠키이ㅔ 저장된 팝업 클로즈의 값이 Y가 아니면 팝업을 보여줘
		//지금 Y여서 밑에 코드가 실행이안된다
		if("Y".equals(popupClose)){
			//script실행 자바코드가 아니므로 벗어났다가 다시열어준다
		%>
			<div id="popup" >
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