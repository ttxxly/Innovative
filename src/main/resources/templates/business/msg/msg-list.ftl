<#--
/****************************************************
 * Description: t_bis_msg的简单列表页面，没有编辑功能
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-10 zhanghejie Create File
**************************************************/
-->
<#include "/templates/xjj-list.ftl"> 
<@list id=tabId>
	<thead>
		<tr>
			<th><input type="checkbox" class="bscheckall"></th>
	        <th>发送人</th>
	        <th>消息内容</th>
	        <th>发送时间</th>
	        <th>接受者</th>
		</tr>
	</thead>
	<tbody>
		<#list page.items?if_exists as item>
		<tr>
			<td>
			<input type="checkbox" class="bscheck" data="id:${item.id}">
			</td>
			<td>
			    ${item.sender}
			</td>
			<td>
			    ${item.msg}
			</td>
			<td>
			    ${item.sendtime?string('yyyy-MM-dd HH:mm:ss')}
			</td>
			<td>
			    ${item.receiver}
			</td>
		</tr>
		</#list>
	</tbody>
</@list>