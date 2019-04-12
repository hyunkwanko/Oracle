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

<table border=1>
<tr> <th> CNO <th> CNAME <th> CREDIT <th> DEPT <th> PROFESSOR</tr>

<% 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection( 
			"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
			"db201312097", 
			"201312097");
	
	PreparedStatement st = conn.prepareStatement("select * from course");
	
	ResultSet rs = st.executeQuery();
	
	while (rs.next()){
		String cno = rs.getString("CNO");
		String cname = rs.getString("CNAME");
		int credit = rs.getInt(3); // YEAR 컬럼
		String dept = rs.getString("DEPT");
		String professor = rs.getString("PROFESSOR");
%>

<tr> <td> <%=cno %> <td> <%=cname %> <td> <%=credit %> <td> <%=dept %> <td> <%=professor %> </tr>
<%		// System.out.format("%d, %s, %d, %s\n", sno, sname, year, dept);
	}
	
	rs.close();
	st.close();
	conn.close();
%>
</table>

</body>
</html>