<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  

<%
	// request 객체로부터 파라미터를 가져온다.
	String title = request.getParameter("title");
	String subtitle = request.getParameter("subtitle");
	String content = request.getParameter("content");
	String list = request.getParameter("list");
	
	/* System.out.println(title);
	System.out.println(subtitle);
	System.out.println(content);
	System.out.println(list); */
%>


