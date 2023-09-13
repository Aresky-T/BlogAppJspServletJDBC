package com.blog.datalayer;

import java.sql.Connection;
import java.sql.DriverManager;
import com.blog.Config;

public class Database {
    static final String url = "jdbc:mysql://localhost:3306/blog_test";
    static final String username = Config.username;
    static final String password = Config.password;
    static final String driver = Config.jdbcDriver;

    public static Connection connect() {
        Connection con = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, username, password);
            System.out.println("Connect success!");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Connect failed!");
        }

        return con;
    }

    public static void closeConnection(Connection connect) {
        try {
            if (connect != null) {
                connect.close();
                System.out.println("Connect closed!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Connection close failed!");
        }
    }
}
