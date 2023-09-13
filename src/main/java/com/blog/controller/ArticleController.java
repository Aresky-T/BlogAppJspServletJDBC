package com.blog.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.blog.datalayer.Database;
import com.blog.model.Article;

public class ArticleController {

    public static Article getById(int id) {
        try {
            Connection con = Database.connect();
            Statement st = con.createStatement();
            String query = "Select * from articles where id = " + id;
            ResultSet rs = st.executeQuery(query);
            rs.next();
            Article result = new Article(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("summary"),
                    rs.getString("content"),
                    rs.getDate("publicationDate"));
            rs.close();
            st.close();
            Database.closeConnection(con);
            return result;
        } catch (Exception e) {
            System.out.println("Couldn't connect to database!");
            return null;
        }
    }

    public static List<Article> getList(int numRows) {
        List<Article> result = new ArrayList<Article>(numRows);
        try {
            Connection con = Database.connect();
            Statement st = con.createStatement();
            String query = "SELECT* FROM articles ORDER BY publicationDate DESC LIMIT " + numRows;
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                result.add(new Article(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("summary"),
                        rs.getString("content"),
                        rs.getDate("publicationDate")));
            }
            rs.close();
            st.close();
            Database.closeConnection(con);
        } catch (Exception e) {
            System.out.println("Couldn't connect to database!");
        }

        return result;
    }

    public static int insert(Article article) { // returns the id of last inserted article
        if (article.getId() == 0)
            return -1;
        try {
            Connection con = Database.connect();
            Statement st = con.createStatement();
            Date date = new Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String dte = sdf.format(date);
            // because the datetime type in sql for publicationDate accepts date in sdf
            // format.
            String sql = "INSERT INTO articles ( title, summary, content, publicationDate ) VALUES ('" +
                    article.getTitle() + "','" +
                    article.getSummary() + "','" +
                    article.getContent() + "','" +
                    dte + "')";
            // System.out.println(sql);
            st.execute(sql); // No result is expected in return, do not use ResultSet here.
            st.close();
            Database.closeConnection(con);
            System.out.println("Insert new article success!");
            return 1;
        } catch (Exception e2) {
            System.out.println("Couldn't connect to database");
            return -1;
        }
    }

    public static int update(Article article) {
        if (article.getId() == 0) // if no article with this id exists
            return -1;
        try {
            Connection con = Database.connect();
            Statement st = con.createStatement();
            Date date = new Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String dte = sdf.format(date);
            String sql = "UPDATE articles SET publicationDate='" + dte + "', title = '" + article.getTitle()
                    + "', summary= '" + article.getSummary() + "', content= '" + article.getContent() + "'  WHERE id = "
                    + article.getId();
            // System.out.println(sql);
            st.execute(sql);
            st.close();
            Database.closeConnection(con);
            return 1;
        } catch (Exception e2) {
            System.out.println("Couldn't connect to database");
            return -1;
        }
    }

    public static int delete(int id) {
        if (id == 0) // no such article
            return -1;
        try {
            Connection con = Database.connect();
            Statement st = con.createStatement();
            String sql = "DELETE FROM articles WHERE id = " + id;
            // System.out.println(sql);
            st.execute(sql);
            st.close();
            Database.closeConnection(con);
            return 1;
        } catch (Exception e2) {
            System.out.println("Couldn't connect to database");
            return -1;
        }
    }
}
