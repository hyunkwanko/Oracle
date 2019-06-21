<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
  
<%
	// request 객체로부터 파라미터를 가져온다.
	String userid = request.getParameter("userid");
	String passwd = request.getParameter("passwd");
%>

<% 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection( 
			"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
			"db201312097", 
			"201312097");
	
	PreparedStatement st = null;
	
	if (userid == null || userid.trim().equals("")) { // 인자가 없거나 공백인 경우 
		// redirect 404.html
	} else { // 정상적인 값이 전달된 경우 
		st = conn.prepareStatement("select * from member where id='" + userid + "'");
	}
	
	ResultSet rs = st.executeQuery();
	if (rs.next()){
		String name = rs.getString("name");
		String id = rs.getString("id");
		String password = rs.getString("password");
		if (password.equals(passwd)){
			response.sendRedirect("../index.jsp?id=" + id);
		} else {
			response.sendRedirect("../404.html?");
		}
		
	}
	
	rs.close();
	st.close();
	conn.close();
%>