package org.easybooks.test.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class lyTable implements Serializable{
    //属性
    private Integer id;
    private Integer userId;
    private java.sql.Date date;
    private String title;
    private String content;

    public Integer getId(){
        return this.id;
    }
    public void setId(Integer id){
        this.id = id;
    }
    public Integer getUserId(){
        return this.userId;
    }
    public void setUserId(Integer userId){
        this.userId = userId;
    }
    public Date getDate(){
        return date;
    }
    public void setDate(Date date){
        this.date = date;
    }
    public void setTitle(String titlt){
        this.title = title;
    }
    public String getTitle(){
        return title;
    }
    public void setContent(String content){
        this.content = content;
    }
    public String getContent(){
        return content;
    }


}
