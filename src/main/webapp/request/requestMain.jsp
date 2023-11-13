<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
<!--메소드를 지정하지 않은 경우 get방식으로 호출!!!  -->
<!-- 링크걸고 메소드 지정하지않으면 다 get방식 -->
<!-- request로 파라미터를 어떻게 수집할 수있는지 확인 -->
<p>
	<a href = "RequestWebInfo.jsp?eng=Hello&han=안녕">get 방식 요청</a>
	<!-- 파일 위치는 나랑 같은위치 = request폴더 -->
</p>

<h2>2. 클라이언트의 요청 매개변수 읽기</h2>
	<form action="RequestParameter.jsp" method="get">
		아이디 : <input type= "text" name="id" value="momo"> 
		<br>		<!--서버에 넘어가야하니까 name속성 
		value에다 넣어놓으면 자동 로그인됨
		 -->
		성별 : <input type="radio" name="sex" value="man">
		<input type="radio" name="sex" value="woman" checked="checked">
		<br>	
		<!-- radio는 하나만 선택할 수 있음 -->
		관심사항 :<input type="checkbox" name="favo" value="eco" checked ="checked">경제
			   <input type="checkbox" name="favo" value="pol">정치
			   <input type="checkbox" name="favo" value="ent">연예
		<!-- checkbox는 배열로 만든다 같은 이름으로 중복 속성이니까 배열-->
		
		<br>	
		자기소개 :<textarea row ="4" cols="30" name="intro">만나서반갑습니다 잘부탁드려요</textarea>
		<!-- //textarea는 태그에 붙여 쓰는게 좋다 -->
 		<br>
		<button>전송</button>
		<!--form에 버튼이 하나만있을경우 submit버튼 처럼 사용한다. 전송버튼아닐때 전송되면 form에 버튼이 하나 있어서임 -->
	</form>
	
	
	<h2>3. HTTP 요청 헤더 정보 읽기</h2>
	<!-- //연결 -->
	<a href = "requestHeader.jsp">연결</a>

</body>
</html>