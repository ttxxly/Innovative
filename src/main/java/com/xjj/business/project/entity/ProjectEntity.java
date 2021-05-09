/****************************************************
 * Description: Entity for 项目管理
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-09 zhanghejie Create File
**************************************************/

package com.xjj.business.project.entity;

import com.xjj.framework.entity.EntitySupport;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ProjectEntity extends EntitySupport {

    private static final long serialVersionUID = 1L;
    public ProjectEntity(){}
    private String name;//项目名
    private String overview;//项目概述
    private String projectyear;//项目年份
    private String status;//项目状态
    private String content;//项目内容
    private Long fileid;//项目文档id
    private String fileurl;//项目文档url
    private String declarant;//申报者
    private String declarestatus;//申报状态
    private String auditor;//审核专家
    private String auditstatus;//审核状态
    private String appraise;//评价
    private String adviser;//指导老师

    public String getAdviser() {
        return adviser;
    }

    public void setAdviser(String adviser) {
        this.adviser = adviser;
    }

    /**
     * 返回项目名
     * @return 项目名
     */
    public String getName() {
        return name;
    }
    
    /**
     * 设置项目名
     * @param name 项目名
     */
    public void setName(String name) {
        this.name = name;
    }
    
    /**
     * 返回项目概述
     * @return 项目概述
     */
    public String getOverview() {
        return overview;
    }
    
    /**
     * 设置项目概述
     * @param overview 项目概述
     */
    public void setOverview(String overview) {
        this.overview = overview;
    }
    
    /**
     * 返回项目年份
     * @return 项目年份
     */
    public String getProjectyear() {
        return projectyear;
    }
    
    /**
     * 设置项目年份
     * @param projectyear 项目年份
     */
    public void setProjectyear(String projectyear) {
        this.projectyear = projectyear;
    }
    
    /**
     * 返回项目状态
     * @return 项目状态
     */
    public String getStatus() {
        return status;
    }
    
    /**
     * 设置项目状态
     * @param status 项目状态
     */
    public void setStatus(String status) {
        this.status = status;
    }
    
    /**
     * 返回项目内容
     * @return 项目内容
     */
    public String getContent() {
        return content;
    }
    
    /**
     * 设置项目内容
     * @param content 项目内容
     */
    public void setContent(String content) {
        this.content = content;
    }
    
    /**
     * 返回项目文档id
     * @return 项目文档id
     */
    public Long getFileid() {
        return fileid;
    }
    
    /**
     * 设置项目文档id
     * @param fileid 项目文档id
     */
    public void setFileid(Long fileid) {
        this.fileid = fileid;
    }
    
    /**
     * 返回项目文档url
     * @return 项目文档url
     */
    public String getFileurl() {
        return fileurl;
    }
    
    /**
     * 设置项目文档url
     * @param fileurl 项目文档url
     */
    public void setFileurl(String fileurl) {
        this.fileurl = fileurl;
    }
    
    /**
     * 返回申报者
     * @return 申报者
     */
    public String getDeclarant() {
        return declarant;
    }
    
    /**
     * 设置申报者
     * @param declarant 申报者
     */
    public void setDeclarant(String declarant) {
        this.declarant = declarant;
    }
    
    /**
     * 返回申报状态
     * @return 申报状态
     */
    public String getDeclarestatus() {
        return declarestatus;
    }
    
    /**
     * 设置申报状态
     * @param declarestatus 申报状态
     */
    public void setDeclarestatus(String declarestatus) {
        this.declarestatus = declarestatus;
    }
    
    /**
     * 返回审核专家
     * @return 审核专家
     */
    public String getAuditor() {
        return auditor;
    }
    
    /**
     * 设置审核专家
     * @param auditor 审核专家
     */
    public void setAuditor(String auditor) {
        this.auditor = auditor;
    }
    
    /**
     * 返回审核状态
     * @return 审核状态
     */
    public String getAuditstatus() {
        return auditstatus;
    }
    
    /**
     * 设置审核状态
     * @param auditstatus 审核状态
     */
    public void setAuditstatus(String auditstatus) {
        this.auditstatus = auditstatus;
    }
    
    /**
     * 返回评价
     * @return 评价
     */
    public String getAppraise() {
        return appraise;
    }
    
    /**
     * 设置评价
     * @param appraise 评价
     */
    public void setAppraise(String appraise) {
        this.appraise = appraise;
    }
    

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.SIMPLE_STYLE).append("com.xjj.business.project.entity.ProjectEntity").append("ID="+this.getId()).toString();
    }
}

