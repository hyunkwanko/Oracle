<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>고객상세정보</h1>
<% 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection( 
			"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
			"db201312097", 
			"201312097");
	
	String cid = request.getParameter("cid");
	
	PreparedStatement st;
	ResultSet rs;
	
	st = conn.prepareStatement("select * from CUSTOMER_INFO where cid=" + cid);
	rs = st.executeQuery();
	
	int number = rs.getInt("NUMBER"); // 고객 번호
	String name = rs.getString("NAME"); // 고객 이름
	int year = rs.getInt("YEAR"); // 출생 년도
	String city = rs.getString("CITY"); // 거주 도시
%>

<ul>
	<li>고객번호: <%=number %></li>
	<li>고객이름: <%=name %></li>
	<li>출생년도: <%=year %></li>
	<li>거주도시: <%=city %></li>
	<li>사용중인 휴대폰</li>
</ul>

<table border=1>
<tr> <th> 휴대폰 모델명 <th> 통신사 <th> 전화번호 </tr>
<%
	st = conn.prepareStatement("select * from PHONE_INFO where cid=" + cid);
	rs = st.executeQuery();

	while (rs.next()){
		String model = rs.getString("MODEL");
		String call = rs.getString("CALL");
		String num = rs.getString("NUM");
		%>
			<tr> <td> <%=model %> <td> <%=call %> <td> <%=num %> </tr>
		<%
	}
	rs.close();
	st.close();
	conn.close();
%>
</table>

</body>
</html>