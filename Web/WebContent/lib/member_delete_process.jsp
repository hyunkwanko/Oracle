<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");

	String MNO = request.getParameter("mno");
%>

<%
	PreparedStatement st = null;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection( 
				"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
				"db201312097", 
				"201312097");
		
		if (MNO == null || MNO.trim().equals("")) {
			response.sendRedirect("../404.html");
		} else {
			st = conn.prepareStatement("DELETE FROM MEMBER WHERE MNO = " + MNO);
			st.executeUpdate();
			response.sendRedirect("../admin_member.jsp");
		}
	} catch(Exception e) {
		e.getStackTrace();
	} finally {
		try {
			if(st != null)
				st.close();
		} catch(Exception e1) {
			e1.getStackTrace();
		}
	}
%>
