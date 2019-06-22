<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String subtitle = request.getParameter("subtitle");
	String content = request.getParameter("content");
	String list = request.getParameter("list");
	String id = request.getParameter("id");
%>

<%
	PreparedStatement st = null;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection( 
				"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
				"db201312097", 
				"201312097");
		
		if (id == null || id.trim().equals("")) {
			response.sendRedirect("../404.html");
		} else {
			st = conn.prepareStatement("INSERT INTO STUDY values (STUDY_SEQ.nextval, ?, ?, ?, ?, ?, to_char(sysdate,'YYYY'), to_char(sysdate,'MM'), to_char(sysdate,'DD'), to_char(sysdate,'HH24:MI'))");
			st.setString(1, id);
			st.setString(2, title);
			st.setString(3, subtitle);
			st.setString(4, content);
			st.setString(5, list);
			st.executeUpdate();
			response.sendRedirect("../blog.jsp?list=" + list);
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
