<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hyunkwanko.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Variables</title>
</head>
<body>
<ul>
	<%-- <li> ${msg1.code} ${msg1.message} --%>
	<li> Employee : ${emp.name.firstName} ${emp.name.lastName}
</ul>

</body>
</html>