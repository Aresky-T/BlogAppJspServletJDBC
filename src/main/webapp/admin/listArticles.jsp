<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page import="com.blog.Config" %>
<%@ page import="com.blog.model.Article" %>
<%@ page import="com.blog.controller.ArticleController" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>All Articles</title>
  
    <script>
    // to send article id from javascript. When a row is clicked, send client to editArticle page
    function edit(id){
    	window.location.href = "editArticleForm.jsp?editArticleId="+id;
    	}
  	</script>
    <link rel="stylesheet" type="text/css" href="<%=Config.styleAdmin %>" />
  </head>
  
  <body>
    <div id="container">

      <a href=".."><img id="logo2" src="<%=Config.imageSrcAdmin %>" alt="My name here" class="app-logo-image"></a>
     <%	
     	try{
             Object login = session.getAttribute("login");
             if(login == null || ((String) login).equals("no")){
                 response.sendRedirect("../loginForm.jsp");
             }
		} catch (Exception e){
			response.sendRedirect("../index.jsp");
		}
	%>
       <div id="adminHeader">
        <h2>Admin's place</h2>
        <p>You are logged in as <b>Aresky</b>. <a href="../logout">Log out</a></p>
      </div>

      <h1 class="list-articles-title">All Articles</h1>

      <table>
        <tr>
          <th>Article</th>
           <th>Publication Date</th>
        </tr>
		<% 
			List<Article> articles = ArticleController.getList(10000);
			int i = 0;
			for(i=0;i<articles.size();++i)
			{
				int id = articles.get(i).getId();
				Date date = articles.get(i).getPublicationDate();
				java.text.SimpleDateFormat sdf = 
					     new java.text.SimpleDateFormat("dd-MMM-yyyy");
				String dte = sdf.format(date);
		%>

        <tr onclick="edit(<%=id%>)">
          <td>
            <%=articles.get(i).getTitle() %>
          </td>
           <td><%=dte %></td>
        </tr>

<%} %>

      </table>

      <p><%=articles.size() %> row(s) in total</p>
      <p><a href="addArticleForm.jsp" class="add-new-article-btn">Add a New Article</a></p>
</body>
</html>