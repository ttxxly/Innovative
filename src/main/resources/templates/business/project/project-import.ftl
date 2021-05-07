<#include "/templates/xjj-index.ftl"> 

<@input url="${base}/business/project/import/save" id=tabId>

 	<@formgroup title='上传文件'>
    	<@upload uploadPath="/user" fileInfo=fileInfo multiple='false' sizeLimit="2097152" callBackFunc="" allowedExtensions="['xls']" buttonText="请选择文件"/>
    	
    	1、请上传xls格式的excel文件；<br />
    	2、严格按照模版格式填写导入文件；<br />
    	3、点击确定开始导入用户。<br />
    </@formgroup>   
    
</@input>