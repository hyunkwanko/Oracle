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
	<jsp:useBean id="msg1" class="hyunkwanko.Message" />
	<jsp:getProperty name="msg1" property="message"/> <!-- 출력 -->
	<jsp:setProperty name="msg1" property="message" value="Hello"/> <!-- value값으로 set -->
	<jsp:getProperty name="msg1" property="message"/> <!-- 재출력 -->
	
	${msg1.message} <!-- Expression Language -->
	
	
</body>
</html>