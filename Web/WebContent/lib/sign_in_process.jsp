<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  

<%
	// request 객체로부터 파라미터를 가져온다.
	String username = request.getParameter("username");
	String userid = request.getParameter("userid");
	String passwd = request.getParameter("passwd");
%>

<%
	PreparedStatement st = null;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection( 
				"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
				"db201312097", 
				"201312097");
		st = conn.prepareStatement("insert into member values(?,?,?)"); // PreparedStatement 객체 생성(쿼리 생성)
		st.setString(1, userid);
		st.setString(2, passwd);
		st.setString(3, username);
		st.executeUpdate(); // 쿼리(sql) 실행
	}catch(Exception e){
		e.getStackTrace();
	}finally{
		try{ // 연결된 DB를 종료
			if(st != null)
				st.close();
		}catch(Exception e1){
			e1.getStackTrace();
		}
	}
%>