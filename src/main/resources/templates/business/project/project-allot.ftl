<#include "/templates/xjj-index.ftl"> 

<@input url="${base}/business/project/allot/save" id=tabId>

	<input type="hidden" name="id" value="${project.id}"/>
	<@formgroup title='审核专家'>
		<@select name="auditor" value="${project.auditor}" list=auditors listKey='userName' listValue='loginName' sortBy='userName'/>
	</@formgroup>

</@input>