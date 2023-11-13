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
자바빈
요청발생시 화면으로부터 입려받은 데이터를 하나의 객체담아 편리하게 사용할 수 있습니다.

jsp 페이지간의 데이터를 전달할 경우 자바빈을 이용합니다.

표쥰 액션태그를 이용해 자바빈을 활용하면 코드가 간결해집니다.

자바빈으로 생성될수 있는 객체(DTO/VO)
	- 자바빈은 기본(default)패키지 이외의 패키지에 속해 있어야 한다.
	- 기본 생성자가 존재해야 한다.
	- 멤버변수의 접근제어자는 private로 선언되어야 한다.
	- 멤버변수에 접근 가능한 getter 와 setter 메서드가 존재해야 한다.
	- getter 와 setter는 접근자가 public으로 선언되어야 한다.
	
	<jsp:useBean> :자바빈 생성
	<jsp:setProperty> : 자바빈 속성을 저장합니다 (setter메소드 호출)
 	<jsp:getProperty> : 자바빈 속성을 추출합니다 (getter메소드 호출)
--%> 

<%--
	id: 자바빈즈 이름
	class : 패키지명을 포함한 클래스명
	scope : 저장될 영역(어디에 저장할건데 page, request applicaioin영역 등등)
  --%>

<%-- 객체생성 (new연산자 이용해서 --%>
<jsp:useBean id="boardDto"
		    class="com.momo.dto.BoardDto"
			scope="request"></jsp:useBean>
		<%-- 단축키	ctrl shif r 찾기 --%>
<%--setProperty메서드를 이용해서 속성값 지정  --%>
<%-- 
	name   : 자바빈즈이름
	property :필드명
	value  : 필드값

 --%>
<jsp:setProperty property="content" name="boardDto" value="내용"/>
<jsp:setProperty property="title" name="boardDto" value="제목"/>

<%
	//request영역에 저장했기에 꺼내올수 있따, 꺼내오고나서 형변환
	if(request.getAttribute("boardDto")!= null){
		BoardDto dto = (BoardDto)request.getAttribute("boardDto");
%>
	제목   : <%=dto.getTitle() %>
	내용   : <%=dto.getContent() %>

<% 		
	}
%>

</body>
</html>