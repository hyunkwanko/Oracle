<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request 객체로부터 파라미터를 가져옴.
	String email = request.getParameter("a");
	String password = request.getParameter("b");
	String name = request.getParameter("c");
	
	System.out.println(email);
	System.out.println(password);
	System.out.println(name);
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
			<form action="#">
				<h1>Sign in</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your account</span> <input type="text" placeholder="ID" />
				<input type="password" placeholder="Password" /> 
				<a href="#">Forgot your password?</a>
				<input
					style="border-radius: 20px; border: 1px solid #FF4B2B; background-color: #FF4B2B; color: #FFFFFF; font-size: 12px; font-weight: bold; padding: 12px 45px; letter-spacing: 1px; text-transform: uppercase; transition: transform 80ms ease-in; width: 50%"
					type="submit" value="Sign In" />
			</form>
		</div>
		
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-right">
					<h1>Hello, <%=name %>!</h1>
					<p>Enter your personal details and start journey with us</p>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="../js/login.js"></script>
</html>

