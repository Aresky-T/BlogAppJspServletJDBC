package com.blog;

// import java.util.List;

import com.blog.controller.ArticleController;
import com.blog.model.Article;

public class Program {
    public static void main(String[] args) {
        Article article = new Article();
        article.setId(1);
        article.setTitle("title 2 updated");
        article.setSummary("summary 2 updated");
        article.setContent("content 2 updated");

        // List<Article> result = ArticleController.getList(100);
        Article result = ArticleController.getById(1);
        // int result = ArticleController.update(article);
        System.out.println(result);
    }
}
