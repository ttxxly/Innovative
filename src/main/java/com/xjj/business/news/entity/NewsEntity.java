/****************************************************
 * Description: Entity for t_bis_news
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-07 zhanghejie Create File
**************************************************/

package com.xjj.business.news.entity;

import com.xjj.framework.entity.EntitySupport;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class NewsEntity extends EntitySupport {

    private static final long serialVersionUID = 1L;
    public NewsEntity(){}
    private String title;//新闻标题
    private String date;//发布日期
    private String publisher;//发布者
    private String content;//新闻内容
    /**
     * 返回新闻标题
     * @return 新闻标题
     */
    public String getTitle() {
        return title;
    }
    
    /**
     * 设置新闻标题
     * @param title 新闻标题
     */
    public void setTitle(String title) {
        this.title = title;
    }
    
    /**
     * 返回发布日期
     * @return 发布日期
     */
    public String getDate() {
        return date;
    }
    
    /**
     * 设置发布日期
     * @param date 发布日期
     */
    public void setDate(String date) {
        this.date = date;
    }
    
    /**
     * 返回发布者
     * @return 发布者
     */
    public String getPublisher() {
        return publisher;
    }
    
    /**
     * 设置发布者
     * @param publisher 发布者
     */
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
    
    /**
     * 返回新闻内容
     * @return 新闻内容
     */
    public String getContent() {
        return content;
    }
    
    /**
     * 设置新闻内容
     * @param content 新闻内容
     */
    public void setContent(String content) {
        this.content = content;
    }
    

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.SIMPLE_STYLE).append("com.xjj.business.news.entity.NewsEntity").append("ID="+this.getId()).toString();
    }
}

