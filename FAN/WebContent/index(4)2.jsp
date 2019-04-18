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

<% 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection( 
			"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
			"db201312097", 
			"201312097");
	
	String cid = request.getParameter("cid");
	String delete_cid = request.getParameter("delete_cid");
	
	PreparedStatement st;
	
	if (delete_cid == null || delete_cid.trim().equals("")) { // 인자가 없거나 공백인 경우 
		st = conn.prepareStatement("select * from CUSTOMER_INFO where cid=" + cid);
		%>
		<table border=1>
		<tr> <th> 고객번호 <th> 고객이름 <th> 출생년 </tr>
		<%
	} else {// 정상적인 값이 전달된 경우 
		st = conn.prepareStatement("delete from CUSTOMER_INFO where cid=" + delete_cid);
		st.executeQuery();
		st = conn.prepareStatement("select * from CUSTOMER_INFO where cid=" + cid);
		%>
		1 개의 고객 정보를 삭제하였습니다
		<table border=1>
		<tr> <th> 고객번호 <th> 고객이름 <th> 출생년 </tr>
		<%
	}
	
	ResultSet rs = st.executeQuery();
	
	while (rs.next()){
		int cid_ = rs.getInt("CID"); // 고객번호
		String name = rs.getString("NAME"); // 고객이름
		int year = rs.getInt(3); // 출생년도
%>
		<tr> <td> <%=cid_ %> <td> <a href="http://localhost:8080/PHONESHOP/customer-info.jsp?cid=<%=cid%>"><%=name %></a> 
		<td> <%=year %> <td> <a href="http://localhost:8080/PHONESHOP/list-customers3.jsp?delete_cid=<%=cid%>">삭제</a></tr>
<%
	}
	
	rs.close();
	st.close();
	conn.close();
%>
</table>

</body>
</html>