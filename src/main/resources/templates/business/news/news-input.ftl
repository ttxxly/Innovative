<#--
/****************************************************
 * Description: t_bis_news的输入页面，包括添加和修改
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-07 zhanghejie Create File
**************************************************/
-->
<#include "/templates/xjj-index.ftl"> 

<@input url="${base}/business/news/save" id=tabId>
   <input type="hidden" name="id" value="${news.id}"/>
   
   <@formgroup title='新闻标题'>
	<input type="text" name="title" value="${news.title}" >
   </@formgroup>
   <@formgroup title='发布日期'>
	<input type="text" name="date" value="${news.date}" >
   </@formgroup>
   <@formgroup title='发布者'>
	<input type="text" name="publisher" value="${news.publisher}" >
   </@formgroup>
   <@formgroup title='新闻内容'>
	<input type="text" name="content" value="${news.content}" >
   </@formgroup>
</@input>