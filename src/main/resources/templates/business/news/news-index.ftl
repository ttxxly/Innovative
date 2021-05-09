<#--
/****************************************************
 * Description: t_bis_news的列表页面
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
<@navList navs=navArr/>

<@content id=tabId>
	<@query queryUrl="${base}/business/news/list" id=tabId>
	
		<@querygroup title='标题'>
			<input type="search" name="query.title@lk@s" class="form-control input-sm" placeholder="请输入标题" aria-controls="dynamic-table">
	    </@querygroup>
	    
		<@button type="info" icon="glyphicon glyphicon-search" onclick="XJJ.query({id:'${tabId}'});">查询</@button>
	</@query>
	
	
	<@button type="info" icon="glyphicon glyphicon-plus" onclick="XJJ.add('${base}/business/news/input','添加t_bis_news','${tabId}');">增加</@button>
	<@button type="purple" icon="fa fa-pencil" onclick="XJJ.edit('${base}/business/news/input','修改t_bis_news','${tabId}');">修改</@button>
	<@button type="danger" icon=" fa fa-trash-o" onclick="XJJ.del('${base}/business/news/delete','删除t_bis_news？',true,{id:'${tabId}'});">删除</@button>
	
</@content>