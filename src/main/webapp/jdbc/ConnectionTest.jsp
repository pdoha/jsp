
<%@page import="java.util.List"%>
<%@page import="com.momo.dao.EmpDao"%>
<%@page import="com.momo.dto.EmpDto"%>
<%@page import="com.momo.common.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JDBC 테스트1</h2>
<!-- //DB간단 접속 -->
<%

	//connection 객체 생성
	DBConnection dbcon = new DBConnection();
	//connection 어디있어? dbcon에
	//재사용하기 위해
	dbcon.stmt = dbcon.con.createStatement();
	
	dbcon.rs= dbcon.stmt.executeQuery("SELECT SYSDATE FROM DUAL");
	
	dbcon.rs.next();
	out.print("데이터베이스 시간 :" + dbcon.rs.getString(1));
	
	//자원반납
	dbcon.close(); //연결해제
	
	out.print("<br>init param :" + application.getInitParameter("INIT_PARAM"));
	out.print("<br>init param :" + application.getInitParameter("driver"));
	out.print("<br>init param :" + application.getInitParameter("url"));
	out.print("<br>init param :" + application.getInitParameter("id"));
	out.print("<br>init param :" + application.getInitParameter("pw"));
	//EmpDao dao = new EmpDao();
	//dao.getList();
%>

<h2>JDBC 테스트2</h2>
<%
//기본생성자가 아닌 값을 넣어준다
	DBConnection dbcon2 = new DBConnection(
			application.getInitParameter("driver")
			,application.getInitParameter("url")
			,application.getInitParameter("id")
			,application.getInitParameter("pw")
			
			);
	dbcon2.close();

%>

<h2>JDBC 테스트  3</h2>
<%
	//application만 달랑 넣어주기
	DBConnection dbcon3 = new DBConnection(application);
	dbcon3.close();
	//객체를 만들어서 데이터베이스의 입출력을 담당하는 객체 dbcon을 상속받아서 쓴ㄴ
%>

<h2>empDao.getList()</h2>
<%
//	EmpDao empDao = new EmpDao(application);
//기본생성자가 없어서 넣어줘야한다 -> application객체 넣어주기

//만들어 놓은 메서드 호출
//	empDao.getList(); //console창에 나오므로
//화면에 출력하고싶으면 list에 담는다
	
	EmpDao empDao = new EmpDao(application);
	List<EmpDto>list = empDao.getList();
	empDao.close();
	//out.print(list);
	
	
%>

<table border="1">
	<tr>
		<td>사원id</td>
		<td>사원명</td>
		<td>주민번호</td>
	</tr>
	<%
	for(EmpDto dto : list){//dto를 list로 부터 꺼내올꺼예요
	%>
	<tr>
		<td><%=dto.getEmp_id() %></td>
		<td><%=dto.getEmp_name() %></td>
		<td><%=dto.getEmp_no() %></td>
	
	</tr>
		<!-- //이 데이터를 화면에 출력할꺼니까 끝나느 괄호를 외부에다가 둔다
	 -->
	<%} %>
</table>

</body>
</html>