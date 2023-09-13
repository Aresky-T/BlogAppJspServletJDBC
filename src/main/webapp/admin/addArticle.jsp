<%@page import="java.util.Date"%>
<%@ page import="com.blog.model.Article" %>
<%@ page import="com.blog.controller.ArticleController" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add article background</title>
</head>
<body>
<%
		try{
			if(((String) session.getAttribute("login")).equals("no"))
				response.sendRedirect("../loginForm.jsp");
		}catch(Exception e){
			response.sendRedirect("../index.jsp");
		}
	%>
	<%
		String title = (String)request.getParameter("title");
		String content = (String)request.getParameter("content");
		String summary = (String)request.getParameter("summary");
		Date date = new Date();
		Article article = new Article(1, title, summary, content, date);
		int res = ArticleController.insert(article);
		if(res==-1){
			response.sendRedirect("addArticleForm.jsp");
		} else {
			response.sendRedirect("listArticles.jsp");
		}
	%>
</body>
</html>