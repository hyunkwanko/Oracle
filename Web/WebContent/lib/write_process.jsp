<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  

<%
	// request 객체로부터 파라미터를 가져온다.
	String title = request.getParameter("title");
	String subtitle = request.getParameter("subtitle");
	String content = request.getParameter("content");
	String list = request.getParameter("list");
	String id = request.getParameter("id");
	
	System.out.println(title);
	System.out.println(subtitle);
	System.out.println(content);
	System.out.println(list);
	System.out.println(id);
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
			st = conn.prepareStatement("INSERT INTO STUDY values (STUDY_SEQ.nextval, ?, ?, ?, ?, ?);");
			st.setString(1, id);
			st.setString(2, title);
			st.setString(3, subtitle);
			st.setString(4, content);
			st.setString(5, list);
			st.executeUpdate();
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
