<#--
/****************************************************
 * Description: 项目管理的输入页面，包括添加和修改
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-09 zhanghejie Create File
**************************************************/
-->
<#include "/templates/xjj-index.ftl"> 

<@input url="${base}/business/project/save" id=tabId>
   <input type="hidden" name="id" value="${project.id}"/>
   
   <@formgroup title='项目名'>
	<input type="text" name="name" value="${project.name}" >
   </@formgroup>
   <@formgroup title='项目概述'>
	<input type="text" name="overview" value="${project.overview}" >
   </@formgroup>
   <@formgroup title='项目年份'>
	<input type="text" name="projectyear" value="${project.projectyear}" >
   </@formgroup>
   <@formgroup title='项目内容'>
	<input type="text" name="content" value="${project.content}" >
   </@formgroup>
   <@formgroup title='申报者'>
	<input type="text" name="declarant" value="${project.declarant}" >
   </@formgroup>
    <@formgroup title='指导老师'>
	<input type="text" name="adviser" value="${project.adviser}" >
   </@formgroup>
</@input>