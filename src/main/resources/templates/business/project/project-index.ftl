<#--
/****************************************************
 * Description: 项目管理的列表页面
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
<@navList navs=navArr/>

<@content id=tabId>
	<@query queryUrl="${base}/business/project/list" id=tabId>
	
		<@querygroup title='年份'>
			<input type="search" name="query.projectyear@lk@s" class="form-control input-sm" placeholder="请输入年份" aria-controls="dynamic-table">
	    </@querygroup>

		<@querygroup title='申报者'>
			<input type="search" name="query.declarant@lk@s" class="form-control input-sm" placeholder="请输入申报者" aria-controls="dynamic-table">
		</@querygroup>
	  	    
		<@querygroup title='审核状态'>
			<@select name="query.auditstatus@eq@s" list=XJJConstants.AUDIT_STATUS_LIST></@select>
	    </@querygroup>
	    
		<@button type="info" icon="glyphicon glyphicon-search" onclick="XJJ.query({id:'${tabId}'});">查询</@button>
	</@query>
	
	


	<#if roles?exists && (roles?size>0)>
		<#list roles as item>
			<#--管理员-->
			<#if (item) == "4">
				<@button type="info" icon="glyphicon glyphicon-plus" onclick="XJJ.add('${base}/business/project/input','添加项目管理','${tabId}');">增加</@button>
				<@button type="purple" icon="fa fa-pencil" onclick="XJJ.edit('${base}/business/project/input','修改项目管理','${tabId}');">修改</@button>
				<@button type="danger" icon=" fa fa-trash-o" onclick="XJJ.del('${base}/business/project/delete','删除项目管理？',true,{id:'${tabId}'});">删除</@button>
				<@button type="success" icon="fa fa-cloud-upload" onclick="XJJ.edit('${base}/business/project/allot','分配评审老师','${tabId}');">分配评审老师</@button>
			</#if>
		<#--评审专家-->
			<#if (item) == "5">
				<@button type="success" icon="fa fa-cloud-upload" onclick="XJJ.edit('${base}/business/project/audit','审核项目','${tabId}');">审核项目</@button>
				<@button type="success" icon="fa fa-cloud-upload" onclick="XJJ.edit('${base}/business/project/appraise','添加评价','${tabId}');">添加评价</@button>
			</#if>
		<#--指导老师-->
			<#if (item) == "6">
				<@button type="success" icon="fa fa-cloud-upload" onclick="XJJ.edit('${base}/business/project/audit','审核项目','${tabId}');">审核项目</@button>
			</#if>
		<#--学生-->
			<#if (item) == "8">
				<@button type="info" icon="glyphicon glyphicon-plus" onclick="XJJ.add('${base}/business/project/input','添加项目管理','${tabId}');">增加</@button>
				<@button type="purple" icon="fa fa-pencil" onclick="XJJ.edit('${base}/business/project/input','修改项目管理','${tabId}');">修改</@button>
				<@button type="danger" icon=" fa fa-trash-o" onclick="XJJ.del('${base}/business/project/delete','删除项目管理？',true,{id:'${tabId}'});">删除</@button>
			</#if>
		</#list>
	</#if>
	<@button type="success" icon="fa fa-cloud-upload" onclick="XJJ.edit('${base}/business/project/import','导入文件','${tabId}');">上传项目文档</@button>
	<@button type="success" icon="fa fa-cloud-upload" onclick="XJJ.edit('${base}/business/project/export','下载文件','${tabId}');">下载项目文档</@button>

</@content>