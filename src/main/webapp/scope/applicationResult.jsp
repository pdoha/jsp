<%@page import="java.util.Set"%>
<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//반환타입 형변환
	if(application.getAttribute("map") != null){
		//map에서 변수 꺼내오기
		//브라우저를 닫았따가 다시열어도 값이 유지된다
		//서버 종류 후 다시 실행시 제거되는것 확인
		Map<String, Person> map=//변수선언 : 타입, 변수이름
				(Map<String, Person>)application.getAttribute("map");
		//모든걸 출력하고싶어 
		//keySet() : 키의 목록을 set타입으로 반환 (어떤게 들어가 있는지 확인할때 사용))
		//받아야지 재사용 가능하다다
		Set<String> keys =  map.keySet();
		
		//map은 key, value가 쌍으로 저장되는 컬렉션 타입입니다
		//get(key) : 키값을 이용하여 value값을 반환 받습니다.
		//키의 목록을알고 있으므로 반목문 이용해서 출력
		//set집합을 돌면서 하나씩꺼내서 key에 넣어줘
		for(String key : keys){
			//저장한 person객체들이 반환
			Person p = map.get(key);
			//tostring을 재정의했기때문에 출력할 수있음(오버라이딩 안해놨으면 주소로나옴)
			out.print(p + "<br>");
		}
	}else{
		out.print("map이 존재하지 않습니다.");
	}


	
	
%>

</body>
</html>