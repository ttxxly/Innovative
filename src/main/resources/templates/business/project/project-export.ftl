<#include "/templates/xjj-index.ftl"> 

<@input  id=tabId>

	<#if project.fileurl?exists>
		&nbsp;&nbsp;&nbsp;&nbsp;<a href='${base}${project.fileurl}' download="test"><font  style='font-size:16px;' color='red'><b>资源文件已经准备好，点击下载</b></font></a>
	<#else>
		&nbsp;&nbsp;&nbsp;&nbsp;<font  style='font-size:16px;' color='red'><b>未找到资源文件，稍等片刻，或者试试上传文件</b></font>
	</#if>

</@input>