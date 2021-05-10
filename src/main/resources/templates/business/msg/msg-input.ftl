<#--
/****************************************************
 * Description: t_bis_msg的输入页面，包括添加和修改
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-10 zhanghejie Create File
**************************************************/
-->
<#include "/templates/xjj-index.ftl"> 

<@input url="${base}/business/msg/save" id=tabId>
   <input type="hidden" name="id" value="${msg.id}"/>
   
   <@formgroup title='发送人'>
	<input type="text" name="sender" value="${msg.sender}" >
   </@formgroup>
   <@formgroup title='消息内容'>
	<input type="text" name="msg" value="${msg.msg}" >
   </@formgroup>
   <@formgroup title='发送时间'>
	<@date name="sendtime" dateValue=msg.sendtime  default=true/>
   </@formgroup>
   <@formgroup title='接受者'>
	<input type="text" name="receiver" value="${msg.receiver}" >
   </@formgroup>
</@input>