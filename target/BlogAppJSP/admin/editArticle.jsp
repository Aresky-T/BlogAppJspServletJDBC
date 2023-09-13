<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="com.blog.model.Article" %>
<%@ page import="com.blog.controller.ArticleController" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Article background</title>
</head>
<body>
<%
		try{
			if(session.getAttribute("login").equals("no"))
				response.sendRedirect("../loginForm.jsp");
		}catch(Exception e){
			response.sendRedirect("/index.jsp");
		}
%>
	<%
		String id2 = request.getParameter("editArticleId").toString();
		int id = Integer.parseInt(id2);
		String title = (String)request.getParameter("title");
		String content = (String)request.getParameter("content");
		String summary = (String)request.getParameter("summary");

		Article article = ArticleController.getById(id);
        assert article != null;
        article.setTitle(title);
		article.setSummary(summary);
		article.setContent(content);
		int res = ArticleController.update(article);
		if(res == -1){
			response.sendRedirect("editArticleForm.jsp?editArticleId="+id);
		}
		else
			response.sendRedirect("listArticles.jsp");
		%>
</body>
</html>