<#include "/templates/xjj-index.ftl"> 

<@input url="${base}/sec/manager/lock" id=tabId>
    <input type="hidden" name="id" value="${user.id}"/>
    <input type="hidden" name="status" value="valid"/>
    <#--
    <@formgroup title='类型'>
		<@select name="userType" list=XJJConstants.USER_TYPE value=user.userType emptyOption=false></@select>
    </@formgroup>
    -->
    <#--<@formgroup title='账号'><input type="text" name="loginName" value="${user.loginName}" check-type='required'></@formgroup>
    <@formgroup title='姓名'><input type="text" name="userName" value="${user.userName}" ></@formgroup>
    <@formgroup title='手机'><input type="text" name="mobile" value="${user.mobile}" ></@formgroup>
    <@formgroup title='邮箱'><input type="text" name="email" value="${user.email}" ></@formgroup>
    <@formgroup title='生日'>
    	<@date name="birthday" dateValue=user.birthday required="required" default=true/>
    </@formgroup>-->
    <#--<@formgroup title='用户状态'>
		<@swichInForm name="status" val="valid" onTitle="解锁用户" offTitle="锁定用户"></@swichInForm>
    </@formgroup>-->
    解锁用户？
</@input>