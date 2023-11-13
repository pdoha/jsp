<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 로그인 여부를 체크 
	로그인 했을때 = 세션에 userid가 저장되어 있다
		-로그아웃 버튼을 출력
		
	없으면
		-로그인 버튼을 출력
		
	**화면에 버튼은 한개만 나옴!!
-->
<script type="text/javascript">
	//화면에서 동적인 처리
	window.onload = function(){
		console.log('onload event==================================')
		let logoutBtn = document.querySelector("#logoutBtn");
		let loginBtn = document.querySelector("#loginBtn");
		if(logoutBtn!= null){//로그아웃이 클릭됐을때 다녀와
			logoutBtn.addEventListener("click",function(){
			//로그아웃
			loginForm.action= "/logout";
			loginForm.submit();
			})
			
		}
		if(loginBtn!=null){
			loginBtn.addEventListener("click",function(){
			//로그인 페이지로 이동
			loginForm.action="loginForm.jsp";
			loginForm.submit();//서버에 갔다와
			})
		}
		
	}

</script>
<!-- 
	submit: form의 요소들을 파라미터로 가지고 서버에 요청
 	action : 서버에 요청할 url 주소
 	method : 요청방식 
 				get: 조회용 파라미터
 				post: 등록, 수정용 파라미터
 	* 버튼 생성했더라고 form안에 버튼이 하나밖에 없다면 해당 버튼은 submit버튼이 된다.
 -->

<form method="get" name="loginForm">
<%
	
	//로그인 버튼이 나오려면 -> 로그인이 되지않은 상태
	//로그아웃 버튼이 나오려면 -> 로그인이 되서 세션아이디가 만들어진 상태

//	========================================================

	//session으로부터 정보를가져옴
	//유저아이디가 session에 저장되어 있으면 판단
	//->getAttribute의 반환타입이 오브젝트여서 형변환 
	//-> 널체크진행, 널이아니여도 빈값일 수도 있으니까 함께 체크
	if(session.getAttribute("userId")!= null 
		&& "".equals(session.getAttribute("userId"))){
		//로그인한 사용자 -> 로그아웃 버튼 출력 -> 세션을 만료 시키고 로그인페이지 이동
%>
	<%=session.getAttribute("userId") %> 님 환영합니다.
	<button id="logoutBtn">로그아웃</button>
<% 		
	}else{
		//로그인하지 않은 사용자 -> 로그인 버튼 출력해서 -> 로그인페이지로 이동
%>
	<button id=loginBtn>로그인</button>
<% 	
	}	
			
%>

</form>

</body>
</html>