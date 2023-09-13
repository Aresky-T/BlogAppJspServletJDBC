<%@ page import="com.blog.Config" %>
<%@ page import="com.blog.model.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="com.blog.controller.ArticleController" %><%--
Created by IntelliJ IDEA.
User: aresky-t
Date: 9/13/2023
Time: 5:59 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Archive Page</title>
        <link rel="stylesheet" type="text/css" href="<%=Config.style%>" />
    </head>
    <body>
        <div id="container">

            <a href=".">
                <img id="logo2" src="<%=Config.imageSrc%>"
                    alt="My name here" class="app-logo-image">
            </a>
            <ul id="headlines" class="archive">
                <%
                List<Article> articles = ArticleController.getList(100000);
                    int i = 0;
                    for(i=0; i<articles.size();++i) {
                        int id=articles.get(i).getId();
                        %>
                        <li>
                            <h2>
                                <a href="viewArticle?viewArticleId=<%=id%>"><%=articles.get(i).getTitle()%></a>
                            </h2>
                            <p class="summary"><%=articles.get(i).getSummary()%></p>
                        </li>
                        <%
                        }
                        %>
                    </ul>
                    <div id="footer" style="text-align : center">
                        <%=Config.footer %><a href="loginForm.jsp">Site Admin</a>
                    </div>
                </div>
            </body>
        </html>
