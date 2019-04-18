<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>example_1</title>
</head>
<body>

<h1>고객 목록</h1>
<table border=1>
<tr> <th> 고객번호 <th> 고객이름 <th> 출생년 </tr>

<% 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection( 
			"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
			"db201312097", 
			"201312097");
	
	PreparedStatement st = conn.prepareStatement("select * from CUSTOMER");
	
	ResultSet rs = st.executeQuery();
	
	while (rs.next()){
		int cid = rs.getInt("CID"); // 고객번호
		String name = rs.getString("NAME"); // 고객이름
		int year = rs.getInt(3); // 출생년도
%>
		<tr> <td> <%=cid %> <td> <a href="http://localhost:8080/PHONESHOP/customer-info.jsp?cid=<%=cid%>"><%=name %></a> <td> <%=year %> </tr>
<%
	}
	
	rs.close();
	st.close();
	conn.close();
%>
</table>

</body>
</html>