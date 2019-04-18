<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Integer visitCount = null; // session에 객체로 등록해야 하므로
	// int가 아닌 Integer 객체를 사용함에 유의
	synchronized(session) {
	visitCount = (Integer)session.getAttribute("visitCount");
	if (visitCount == null) {
	visitCount = 0;
	}
	visitCount++;
	session.setAttribute("visitCount", visitCount);
	}
%>
Visit Count: <%= visitCount %>
</body>
</html>