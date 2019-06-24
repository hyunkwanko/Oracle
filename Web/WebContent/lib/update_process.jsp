<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String sno = request.getParameter("sno");
	String title = request.getParameter("title");
	String subtitle = request.getParameter("subtitle");
	String content = request.getParameter("content");
	String list = request.getParameter("list");
%>

<%
	PreparedStatement st = null;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection( 
				"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
				"db201312097", 
				"201312097");
		
		st = conn.prepareStatement("UPDATE STUDY SET TITLE = ?, SUBTITLE = ?, CONTENT = ?, LIST = ?, YEAR = to_char(sysdate,'YY'), MONTH = to_char(sysdate,'MM'), DAY = to_char(sysdate,'DD'), TIME = to_char(sysdate,'HH24:MI') WHERE sno = ?");
		st.setString(1, title);
		st.setString(2, subtitle);
		st.setString(3, content);
		st.setString(4, list);
		st.setString(5, sno);
		st.executeUpdate();
		response.sendRedirect("../blog.jsp?list=" + list + "&id=" + id);
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
