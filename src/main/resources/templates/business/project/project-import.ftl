<#include "/templates/xjj-index.ftl"> 

<@input url="${base}/business/project/import/save" id=tabId>

 	<@formgroup title='上传文件'>
		<input type="hidden" name="id" value="${project.id}"/>
    	<@upload uploadPath="/files/upload/business/project/" fileInfo=fileInfo multiple='false' sizeLimit="2097152" callBackFunc="" buttonText="请选择文件"/>
    	
    	1、请上传xls格式的excel文件；<br />
    	2、严格按照模版格式填写导入文件；<br />
    	3、点击确定开始导入文件。<br />
    </@formgroup>   
    
</@input>