<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hyunkwanko.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="msg1" class="hyunkwanko.Message" scope="page" /> 
	<jsp:setProperty property="*" name="msg1"/>
	<ul>
		<li> <jsp:getProperty property="code" name="msg1"/> </li>
		<li> <jsp:getProperty property="message" name="msg1"/> </li> 
	</ul>
</body>
</html>