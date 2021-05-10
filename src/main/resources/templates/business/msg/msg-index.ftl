<#--
/****************************************************
 * Description: t_bis_msg的列表页面
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
<@navList navs=navArr/>

<@content id=tabId>
	<@query queryUrl="${base}/business/msg/list" id=tabId>
	
		<@querygroup title='发送人'>
			<input type="search" name="query.sender@lk@s" class="form-control input-sm" placeholder="请输入发送者" aria-controls="dynamic-table">
	    </@querygroup>

	    
		<@button type="info" icon="glyphicon glyphicon-search" onclick="XJJ.query({id:'${tabId}'});">查询</@button>
	</@query>
</@content>