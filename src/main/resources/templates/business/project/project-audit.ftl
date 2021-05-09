<#include "/templates/xjj-index.ftl"> 

<@input url="${base}/business/project/audit/save" id=tabId>

	<input type="hidden" name="id" value="${project.id}"/>
	<@formgroup title='审核状态'>
		<@select name="auditstatus" value="${project.auditstatus}" list=auditstatusList listKey='statusName' listValue='auditStatus' sortBy='statusName'/>
	</@formgroup>

</@input>