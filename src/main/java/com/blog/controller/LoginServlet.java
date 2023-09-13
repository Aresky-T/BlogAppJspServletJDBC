package com.blog.controller;

import com.blog.Config;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");

        HttpSession session = request.getSession();
        session.setAttribute("isError", "no" );
        session.setAttribute("login","no");

        if(user.equals(Config.username) && pass.equals(Config.password)){
            session.setAttribute("login","yes");
            Cookie cookie = new Cookie("username", Config.username);
            cookie.setMaxAge(24 * 60 * 60);
            response.addCookie(cookie);
            response.sendRedirect("admin/listArticles.jsp");
        } else {
            session.setAttribute("isError","yes");
            response.sendRedirect("loginForm.jsp");
        }
    }

    @Override
    public void init () throws ServletException {
        super.init();
    }
}
