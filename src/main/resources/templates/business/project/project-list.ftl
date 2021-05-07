<#--
/****************************************************
 * Description: t_bis_project的简单列表页面，没有编辑功能
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-06 zhanghejie Create File
**************************************************/
-->
<#include "/templates/xjj-list.ftl"> 
<@list id=tabId>
	<thead>
		<tr>
			<th><input type="checkbox" class="bscheckall"></th>
	        <th>name</th>
	        <th>overview</th>
	        <th>cycle</th>
	        <th>status</th>
	        <th>content</th>
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
			    ${item.name}
			</td>
			<td>
			    ${item.overview}
			</td>
			<td>
			    ${item.cycle}
			</td>
			<td>
			    ${item.status}
			</td>
			<td>
			    ${item.content}
			</td>
			<td>
            	<@button type="purple" icon="fa fa-pencil" onclick="XJJ.edit('${base}/business/project/input/${item.id}','修改t_bis_project','${tabId}');">修改</@button>
				<@button type="danger" icon=" fa fa-trash-o" onclick="XJJ.del('${base}/business/project/delete/${item.id}','删除t_bis_project？',false,{id:'${tabId}'});">删除</@button>
            </td>
		</tr>
		</#list>
	</tbody>
</@list>