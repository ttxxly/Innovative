<#--
/****************************************************
 * Description: t_bis_news的简单列表页面，没有编辑功能
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-07 zhanghejie Create File
**************************************************/
-->
<#include "/templates/xjj-list.ftl"> 
<@list id=tabId>
	<thead>
		<tr>
			<th><input type="checkbox" class="bscheckall"></th>
	        <th>新闻标题</th>
	        <th>发布日期</th>
	        <th>发布者</th>
	        <th>新闻内容</th>
	        <th>操作</th>
		</tr>
	</thead>
	<tbody>
		<#list page.items?if_exists as item>
		<tr>
			<td>
			<input type="checkbox" class="bscheck" data="id:${item.id}">
			</td>
			<td>
			    ${item.title}
			</td>
			<td>
			    ${item.date}
			</td>
			<td>
			    ${item.publisher}
			</td>
			<td>
			    ${item.content}
			</td>
			<td>
            	<@button type="purple" icon="fa fa-pencil" onclick="XJJ.edit('${base}/business/news/input/${item.id}','修改新闻资讯','${tabId}');">修改</@button>
				<@button type="danger" icon=" fa fa-trash-o" onclick="XJJ.del('${base}/business/news/delete/${item.id}','删除新闻资讯？',false,{id:'${tabId}'});">删除</@button>
            </td>
		</tr>
		</#list>
	</tbody>
</@list>