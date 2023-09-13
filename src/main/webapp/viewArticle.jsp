<%@ page import="com.blog.Config" %>
<%@ page import="com.blog.model.Article" %>
<%@ page import="com.blog.controller.ArticleController" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%--
Created by IntelliJ IDEA.
User: aresky-t
Date: 9/13/2023
Time: 5:52 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Article Page</title>
        <link rel="stylesheet" type="text/css" href="styles/style2.css" />
    </head>
    <body>
        <%
            Article article = (Article) request.getAttribute("article");
            assert article != null;
            Date date = article.getPublicationDate();
            SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy");
            String dte = sdf.format(date);
        %>
        <div id="container">
            <a href=".">
                <img id="logo2" src="<%=Config.imageSrc %>" alt="My name here" class="app-logo-image">
            </a>
            <h1 style="width: 75%;"><%=article.getTitle() %></h1>
            <br>
            <div style="width: 75%; font-style: italic;"><%=article.getSummary()
                %></div>
            <p class="pubDate"><b><i>Published on <%=dte %></i></b></p>
            <br>
            <div style="width: 75%;"><%=article.getContent() %></div>
            <br>
            <p><a href="./">Return to Homepage</a></p>
            <p><a href="archive.jsp">Article Archive</a></p>
            <div id="footer" style="text-align : center">
                <%=Config.footer %><a href="loginForm.jsp">Site Admin</a>
            </div>
        </div>
    </body>
</html>
