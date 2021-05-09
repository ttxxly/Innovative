<#include "/templates/xjj-index.ftl"> 

<@input url="${base}/business/project/appraise/save" id=tabId>

	<input type="hidden" name="id" value="${project.id}"/>
	<@formgroup title='评价'>
		<input type="text" name="appraise" value="${project.appraise}" >
	</@formgroup>
</@input>