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
<tr> <th> SNO <th> ID <th> TITLE <th> SUBTITLE <th> CONTENT <th> LIST</tr>

<% 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection( 
			"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
			"db201312097", 
			"201312097");
	String cno = "2";
	
	PreparedStatement st = null;
	
	if (cno == null || cno.trim().equals("")) { // 인자가 없거나 공백인 경우 
		
	} else {// 정상적인 값이 전달된 경우 
		st = conn.prepareStatement("select * from study");
	}
	
	ResultSet rs = st.executeQuery();
	while (rs.next()){
		String SNO = rs.getString("SNO");
		String ID = rs.getString("ID");
		String TITLE = rs.getString("TITLE");
		String SUBTITLE = rs.getString("SUBTITLE");
		String CONTENT = rs.getString("CONTENT");
		String LIST = rs.getString("LIST");
%>

<tr> <td> <%=SNO %> <td> <%=ID %> <td> <%=TITLE %> <td> <%=SUBTITLE %> <td> <%=CONTENT %> <td> <%=LIST %></tr>
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