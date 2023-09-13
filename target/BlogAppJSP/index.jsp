<%@page import="com.blog.Config" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.blog.datalayer.Database" %>
<%@page import="com.blog.controller.ArticleController" %>
<%@page import="com.blog.model.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Welcome Page</title>
        <link rel="stylesheet" type="text/css" href="<%=Config.style %>" />
    </head>

    <body>
    <%
        try{
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if(cookie.getName().equals("username") && cookie.getValue() != null) {
                        session.setAttribute("login", "yes");
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    %>
        <div id="container">

            <a href=".">
                <img id="logo2" src="<%=Config.imageSrc %>" alt="My name here" class="app-logo-image">
            </a>
            <ul id="headlines">
                <% List<Article> articles = ArticleController.getList(10);
                    int i = 0;
                    for(i=0; i<articles.size();++i) { int
                        id=articles.get(i).getId();
                        Date date=articles.get(i).getPublicationDate();
                        SimpleDateFormat
                        sdf=new java.text.SimpleDateFormat("dd MMMM ");
                        String dte=sdf.format(date);
                        %>
                    <li>
                        <h2>
                            <span class=" pubDate">
                                <%=dte %>
                            </span>
                            <a href="viewArticle?viewArticleId=<%=id%>">
                                <%=articles.get(i).getTitle()%>
                            </a>
                        </h2>
                        <p class="summary">
                            <%=articles.get(i).getSummary() %>
                        </p>
                    </li>
                    <% } %>
                    </ul>

            <p><a href="archive.jsp">Article Archive</a></p>
            <div id="footer" style="text-align : center">
                <%=Config.footer %><a href="loginForm.jsp">Site Admin</a>
            </div>
         </div>
    </body>

        </html>