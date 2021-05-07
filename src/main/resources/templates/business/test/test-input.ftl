<#--
/****************************************************
 * Description: 角色的输入页面，包括添加和修改
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-06 zhanghejie Create File
**************************************************/
-->
<#include "/templates/templates/xjj-index.ftl">

<@input url="${base}/business/test/save" id=tabId>
   <input type="hidden" name="id" value="${test.id}"/>
   
   <@formgroup title='名称'>
	<input type="text" name="title" value="${test.title}" >
   </@formgroup>
   <@formgroup title='编码'>
	<input type="text" name="code" value="${test.code}" >
   </@formgroup>
   <@formgroup title='描述'>
	<input type="text" name="description" value="${test.description}" >
   </@formgroup>
   <@formgroup title='状态'>
	<input type="text" name="status" value="${test.status}" >
   </@formgroup>
</@input>