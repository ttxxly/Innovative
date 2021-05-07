<#--
/****************************************************
 * Description: t_bis_project的输入页面，包括添加和修改
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-06 zhanghejie Create File
**************************************************/
-->
<#include "/templates/xjj-index.ftl"> 

<@input url="${base}/business/project/save" id=tabId>
   <input type="hidden" name="id" value="${project.id}"/>
   
   <@formgroup title='name'>
	<input type="text" name="name" value="${project.name}" >
   </@formgroup>
   <@formgroup title='overview'>
	<input type="text" name="overview" value="${project.overview}" >
   </@formgroup>
   <@formgroup title='cycle'>
	<input type="text" name="cycle" value="${project.cycle}" >
   </@formgroup>
   <@formgroup title='status'>
	<input type="text" name="status" value="${project.status}" >
   </@formgroup>
   <@formgroup title='content'>
	<input type="text" name="content" value="${project.content}" >
   </@formgroup>
</@input>