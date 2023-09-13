package com.blog.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns = "/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            session.setAttribute("login", "no");
            Cookie[] cookies = req.getCookies();
            if(cookies != null){
                for(Cookie cookie : cookies){
                    if(cookie.getName().equals("username")){
                        cookie.setMaxAge(0);
                        resp.addCookie(cookie);
                    }
                }
            }
            resp.sendRedirect("index.jsp");
        } catch (Exception e) {
          e.printStackTrace();
        }
    }
}
