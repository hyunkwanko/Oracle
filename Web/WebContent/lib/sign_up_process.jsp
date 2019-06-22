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
		st = conn.prepareStatement("INSERT INTO MEMBER values(contact_id.nextval,?,?,?)"); // PreparedStatement 객체 생성(쿼리 생성)
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

<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<title>PKNU IT</title>
	<link rel="stylesheet" href="../css/login.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
</head>

<body>
	<div class="container" id="container">
		<div class="form-container sign-in-container">
			<form action="sign_in_process.jsp" method="post">
				<h1>Sign in</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> 
					<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
					<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your account</span>
				<input name="userid" type="text" placeholder="ID" />
				<input name="passwd" type="password" placeholder="Password" /> 
				<a href="#">Forgot your password?</a>
				<input style="border-radius: 20px; border: 1px solid #FF4B2B; background-color: #FF4B2B; color: #FFFFFF; font-size: 12px; font-weight: bold; padding: 12px 45px; letter-spacing: 1px; text-transform: uppercase; transition: transform 80ms ease-in; width: 50%"
					type="submit" value="Sign In" />
			</form>
		</div>
		
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-right">
					<h1>Hello, <%=username %>!</h1>
					<p>Enter your personal details and start journey with us</p>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="../js/login.js"></script>
</html>

