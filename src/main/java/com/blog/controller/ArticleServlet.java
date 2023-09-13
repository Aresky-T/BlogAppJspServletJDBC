package com.blog.controller;

import com.blog.model.Article;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/viewArticle")
public class ArticleServlet extends HttpServlet {

    @Override
    protected void doGet (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try{
           String param = req.getParameter("viewArticleId");
           int id = Integer.parseInt(param);
           Article article = ArticleController.getById(id);
           req.setAttribute("article", article);
           getServletContext().getRequestDispatcher("/viewArticle.jsp").forward(req, resp);
       } catch (Exception e){
           e.printStackTrace();
       }
    }

    @Override
    public void init () throws ServletException {
        super.init();
    }
}
