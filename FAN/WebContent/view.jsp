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
<tr> <th> 학번 <th> 이름 <th> 학년 <th> 학과<th> 학과<th> 학과<th> 학과<th> 학과<th> 학과</tr>
<% 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection( 
			"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
			"db201312097", 
			"201312097");
	
	String cno = request.getParameter("sno");
	
	PreparedStatement st;
	ResultSet rs;
	
	st = conn.prepareStatement("select * from enrol natural join course where sno=" + cno);
	rs = st.executeQuery();
	while (rs.next()){
		String cno_ = rs.getString("cno");
		int sno = rs.getInt(2);
		String grade = rs.getString("GRADE");
		int midterm = rs.getInt(4);
		int finterm = rs.getInt(5);
		String cname = rs.getString("CNAME");
		int credit = rs.getInt(7);
		String dept = rs.getString("DEPT");
		String professor = rs.getString("PROFESSOR");
		%>
			<tr> <td> <%=cno_ %> <td> <%=sno %><td> <%=grade %> <td> <%=midterm %> <td> <%=finterm %> <td> <%=cname %><td> <%=credit %><td> <%=dept %><td> <%=professor %> </tr>
		<%
	}
	rs.close();
	st.close();
	conn.close();
%>
</table>

</body>
</html>