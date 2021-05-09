<#--
/****************************************************
 * Description: 项目管理的简单列表页面，没有编辑功能
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-09 zhanghejie Create File
**************************************************/
-->
<#include "/templates/xjj-list.ftl">
<@list id=tabId>
    <thead>
    <tr>
        <th><input type="checkbox" class="bscheckall"></th>
        <th>项目名</th>
        <th>项目概述</th>
        <th>项目年份</th>
        <th>项目状态</th>
        <th>项目内容</th>
        <th>申报者</th>
        <th>申报状态</th>
        <th>审核专家</th>
        <th>审核状态</th>
        <th>评价</th>
        <th>指导老师</th>
        <#if roles?exists && (roles?size>0)>
            <#list roles as item>
            <#--管理员-->
                <#if (item) == "4">
                    <th>操作</th>
                </#if>
            </#list>
        </#if>

    </tr>
    </thead>
    <tbody>
    <#list page.items?if_exists as item>
        <tr>
            <td>
                <input type="checkbox" class="bscheck" data="id:${item.id}">
            </td>
            <td>
                ${item.name}
            </td>
            <td>
                ${item.overview}
            </td>
            <td>
                ${item.projectyear}
            </td>
            <td>
                ${item.status}
            </td>
            <td>
                ${item.content}
            </td>
            <td>
                ${item.declarant}
            </td>
            <td>
                ${item.declarestatus}
            </td>
            <td>
                ${item.auditor}
            </td>
            <td>
                ${item.auditstatus}
            </td>
            <td>
                ${item.appraise}
            </td>
            <td>
                ${item.adviser}
            </td>
            <#if roles?exists && (roles?size>0)>
                <#list roles as role>
                <#--管理员-->
                    <#if (role) == "4">
                        <td>
                            <@button type="purple" icon="fa fa-pencil" onclick="XJJ.edit('${base}/null/project/input/${item.id}','修改项目管理','${tabId}');">修改</@button>
                            <@button type="danger" icon=" fa fa-trash-o" onclick="XJJ.del('${base}/null/project/delete/${item.id}','删除项目管理？',false,{id:'${tabId}'});">删除</@button>
                        </td>
                    </#if>
                </#list>
            </#if>

        </tr>
    </#list>
    </tbody>
</@list>