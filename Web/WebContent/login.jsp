<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>PKNU IT</title>
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
</head>

<body>
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="lib/sign_up_process.jsp" method="post">
				<h1>Create Account</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
					<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
					<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your email for registration</span> 
				<input name="username" type="text" placeholder="Name" /> 
				<input name="userid" type="text" placeholder="ID" /> 
				<input name="passwd" type="password" placeholder="Password" /> 
				<input style="border-radius: 20px; border: 1px solid #FF4B2B; background-color: #FF4B2B; color: #FFFFFF; font-size: 12px; font-weight: bold; padding: 12px 45px; letter-spacing: 1px; text-transform: uppercase; transition: transform 80ms ease-in; width: 50%"
					type="submit" value="Sign Up" />
			</form>
		</div>
		<div class="form-container sign-in-container">
			<form action="lib/sign_in_process.jsp" method="post">
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
				<div class="overlay-panel overlay-left">
					<h1>Welcome!</h1>
					<p>To keep connected with us please login with your personal info</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>Enter your personal details and start journey with us</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="js/login.js"></script>
</html>

