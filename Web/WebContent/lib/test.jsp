<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
</head>
<body>

<table border=1>
<tr> <th> username <th> userid <th> password</tr>

<% 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection( 
			"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
			"db201312097", 
			"201312097");
	String cno = "2";
	
	PreparedStatement st;
	
	if (cno == null || cno.trim().equals("")) { // 인자가 없거나 공백인 경우 
		st = conn.prepareStatement("select * from student");
	
	} else {// 정상적인 값이 전달된 경우 
		st = conn.prepareStatement("select * from member");
	}
	
	ResultSet rs = st.executeQuery();
	while (rs.next()){
		String MNO = rs.getString("MNO");
		String ID = rs.getString("ID");
		String PASSWORD = rs.getString("PASSWORD");
		String NAME = rs.getString("NAME");
%>

<tr> <td> <%=MNO %> <td> <%=ID %> <td> <%=PASSWORD %> <td> <%=NAME %></tr>
<%
		// System.out.format("%d, %s, %d, %s\n", sno, sname, year, dept);
	}
	
	rs.close();
	st.close();
	conn.close();
%>
</table>

</body>
</html>