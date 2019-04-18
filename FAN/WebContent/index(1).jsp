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

<table border=1>
<tr> <th> 그룹 번호 <th> 그룹 이름 <th> 소속사 <th> 좋아요</tr>

<% 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection( 
			"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
			"db201312097", 
			"201312097");
	
	PreparedStatement st = conn.prepareStatement("select * from IGRP");
	
	ResultSet rs = st.executeQuery();
	
	while (rs.next()){
		int gno = rs.getInt("GNO"); // 그룹 번호
		String gname = rs.getString("GNAME"); // 그룹 이름
		String company = rs.getString("COMPANY"); // 소속사
		int like_cnt = rs.getInt(4); // 좋아요
%>

		<tr> <td> <%=gno %> <td> <%=gname %> <td> <%=company %> <td> <%=like_cnt %> </tr>
<%
	}
	
	rs.close();
	st.close();
	conn.close();
%>
</table>

</body>
</html>