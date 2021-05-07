/****************************************************
 * Description: Entity for t_bis_project
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-06 zhanghejie Create File
**************************************************/

package com.xjj.business.project.entity;

import com.xjj.framework.entity.EntitySupport;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ProjectEntity extends EntitySupport {

    private static final long serialVersionUID = 1L;
    public ProjectEntity(){}
    private String name;//name
    private String overview;//overview
    private String cycle;//cycle
    private String status;//status
    private String content;//content
    /**
     * 返回name
     * @return name
     */
    public String getName() {
        return name;
    }
    
    /**
     * 设置name
     * @param name name
     */
    public void setName(String name) {
        this.name = name;
    }
    
    /**
     * 返回overview
     * @return overview
     */
    public String getOverview() {
        return overview;
    }
    
    /**
     * 设置overview
     * @param overview overview
     */
    public void setOverview(String overview) {
        this.overview = overview;
    }
    
    /**
     * 返回cycle
     * @return cycle
     */
    public String getCycle() {
        return cycle;
    }
    
    /**
     * 设置cycle
     * @param cycle cycle
     */
    public void setCycle(String cycle) {
        this.cycle = cycle;
    }
    
    /**
     * 返回status
     * @return status
     */
    public String getStatus() {
        return status;
    }
    
    /**
     * 设置status
     * @param status status
     */
    public void setStatus(String status) {
        this.status = status;
    }
    
    /**
     * 返回content
     * @return content
     */
    public String getContent() {
        return content;
    }
    
    /**
     * 设置content
     * @param content content
     */
    public void setContent(String content) {
        this.content = content;
    }
    

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.SIMPLE_STYLE).append("com.xjj.business.project.entity.ProjectEntity").append("ID="+this.getId()).toString();
    }
}

