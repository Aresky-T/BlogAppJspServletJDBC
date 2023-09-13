package com.blog.model;

import java.util.Date;

import lombok.Data;

@Data
public class Article {
    private int id;
    private String title;
    private String summary;
    private String content;
    private Date publicationDate;

    public Article(){

    }

    public Article(int id, String title, String summary, String content, Date publicationDate){
        this.id = id;
        this.title = title;
        this.summary = summary;
        this.content = content;
        this.publicationDate = publicationDate;
    }
}
