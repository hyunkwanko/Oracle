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

발표곡<br></br>
<table border=1>
<tr> <th> 곡명 <th> 발표년도 </tr>
<% 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection( 
			"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
			"db201312097", 
			"201312097");
	
	String gno = request.getParameter("gno");
	
	PreparedStatement st;
	ResultSet rs;
	
	st = conn.prepareStatement("select * from song where gno=" + gno);
	rs = st.executeQuery();
	while (rs.next()){
		String song_name = rs.getString("song_name");
		int year = rs.getInt(2);
		%>
			<tr> <td> <%=song_name %> <td> <%=year %> </tr>
		<%
	}
%>
</table>

소속 멤버<br></br>
<table border=1>
<tr> <th> 이름 <th> 성별 <th> 출생년도 </tr>
<% 
	st = conn.prepareStatement("select * from member where gno=" + gno);
	rs = st.executeQuery();
	while (rs.next()){
		String song_name = rs.getString("song_name");
		String gender = rs.getString("gender");
		int year = rs.getInt(3);
		%>
			<tr> <td> <%=song_name %> <td> <%=gender %> <td> <%=year %> </tr>
		<%
	}
	rs.close();
	st.close();
	conn.close();
%>
</table>


</body>
</html>