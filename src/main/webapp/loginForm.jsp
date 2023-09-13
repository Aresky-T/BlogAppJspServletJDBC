<%@ page import="com.blog.Config" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: aresky-t
  Date: 9/13/2023
  Time: 5:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login form</title>
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
                    response.sendRedirect("admin/listArticles.jsp");
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
    <form action="login" method="post" style="width: 50%;">
        <h1 style="text-align: center; width: 100%">Login Admin</h1>
        <ul>
            <li>
                <label for="username">Username</label>
                <input type="text" name="user" id="username" placeholder="Hey Admin.." required autofocus maxlength="20" />
            </li>

            <li>
                <label for="password">Password</label>
                <input type="password" name="pass" id="password" placeholder="Keep it a secret.." required maxlength="20" />
            </li>
        </ul>

        <div class="buttons">
            <input type="submit" name="login" value="Login" />
        </div>

    </form>
    <div id="footer" style="text-align : center">
        <%=Config.footer %><a href="loginForm.jsp">Site Admin</a>
    </div>
</div>
</body>
</html>