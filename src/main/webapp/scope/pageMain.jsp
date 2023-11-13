<%@page import="com.momo.dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h2>페이지에 저장하고 값이 얼만큼 유지되는지 확인</h2>
<body>
<!--
	내장객체의 영역
		웹에서는 페이지(page)들이 모여 하나의 요청(request)을 처리하면
		요청들이 모여 하나의 세션(session)을,
		세션이 모여 하나의 application을 이룹니다.
		
	page영역: 동일한 페이지에서만 공유
	request영역 :하나의 요청에의해 호출된 페이지 및 포워드 페이지
	session영역 : 클라이언트가 처음 웹브라우저로 접속한 후 웹브라우저를 닫을때까지
	application영역 : 웹어플리케이션(웹서버)가 종료될때까지
	 변수가 언제까지살아 있는지 유효범위가 있다.
  
  -->
<% 
//page라고하는 내장객체의 영역을 이용해서 데이터 저장
	//setAttributed 해당 내장 객체의 영역에 값을 저장
	pageContext.setAttribute("page", "페이지 영역(scope)");//데이터를저장하기위해 사용하는 공간
	pageContext.setAttribute("page_int", 10000); //object를 받고있기때문에 모든 객체를 넣을 수 있따
	
	//person 객체생성
	Person p = new Person("momo", 23);//이름 나이 생성자 만들어놈
	//생성한 변수 저장하고싶면 내장객체 불러와야지
	pageContext.setAttribute("pagePerson", p);
	
	
	//저장했으면 꺼내서 값 출력 -> set썼으니까 get써야지
	//변수에도 담아주자
	//getAttribute메서드의 반환 타입은 object이므로 형변환이 필요
	String page_str = pageContext.getAttribute("page").toString();
	//object를 string에 담지못하니까 형변환 필요
	int page_int = (Integer)pageContext.getAttributesScope("page_int");
	Person page_p = (Person)pageContext.getAttribute("pagePerson");
%>

<!-- 출력 -->
<ul>
	<li>String : <%=page_str %></li>
	<li>int : <%=page_int %></li>
	<li>person : <%=page_p.getAge() %>/<%=page_p.getName() %></li>
	
<!-- object를 호출하면 toString이 발생한다 -->
	

</ul>



<h2>include된 파일에서 page영역 읽어오기</h2>
<p>include지시어로 감싼 jsp파일은 포함관계를 가지므로 같은페이지</p>
<p>페이지 영역이나 변수등이 공유됩니다.</p>
<!-- 공유되는지 보기 -->	
<%@include file="pageInclude.jsp" %>

<h2>페이지 이동 후 페이지 영역 읽어오기</h2>
<!-- 페이지 요청 -->
<!-- 링크또는 form을 이용해서 페이지를 다시 요청하게되면 페이지 영역이초기화 됩니다
(새로운 요청이발생) -->
<a href = "pageLocation.jsp">pageLocation 바로가기</a>

<!-- remove -->
<%
	pageContext.removeAttribute("page");
%>
<h2>영역에 저장된 속성을 삭제</h2>
<!-- 
removeAttribute 메소드는 값이 없는경우 오류를 발생하지 않는다
getAttribute 메소드는 값이 없는경우 null을 반환한다 -->
page : <%= pageContext.getAttribute("page") %>

</body>
</html>