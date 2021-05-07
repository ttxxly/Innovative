<#--
/****************************************************
 * Description: t_bis_project的列表页面
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
<@navList navs=navArr/>

<@content id=tabId>
	<@query queryUrl="${base}/business/project/list" id=tabId>
	
		<@querygroup title='名称'>
			<input type="search" name="query.name@lk@s" class="form-control input-sm" placeholder="请输入名称" aria-controls="dynamic-table">
	    </@querygroup>
	  	    
		<@querygroup title='状态'>
			<@select name="query.status@eq@s" list=XJJConstants.COMMON_STATUS_LIST></@select>
	    </@querygroup>
	    
		<@button type="info" icon="glyphicon glyphicon-search" onclick="XJJ.query({id:'${tabId}'});">查询</@button>
	</@query>
	
	
	<@button type="info" icon="glyphicon glyphicon-plus" onclick="XJJ.add('${base}/business/project/input','添加t_bis_project','${tabId}');">增加</@button>
	<@button type="purple" icon="fa fa-pencil" onclick="XJJ.edit('${base}/business/project/input','修改t_bis_project','${tabId}');">修改</@button>
	<@button type="danger" icon=" fa fa-trash-o" onclick="XJJ.del('${base}/business/project/delete','删除t_bis_project？',true,{id:'${tabId}'});">删除</@button>
	
	<@button type="success" icon="fa fa-cloud-upload" onclick="XJJ.add('${base}/business/project/import','导入文件','${tabId}');">上传</@button>
</@content>