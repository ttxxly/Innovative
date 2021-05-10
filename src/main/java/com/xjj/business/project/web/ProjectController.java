/****************************************************
 * Description: Controller for 项目管理
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author zhanghejie
 * @version 1.0
 * @see
HISTORY
 *  2021-05-09 zhanghejie Create File
 **************************************************/
package com.xjj.business.project.web;

import com.xjj.business.msg.entity.MsgEntity;
import com.xjj.business.msg.service.MsgService;
import com.xjj.business.project.entity.ProjectEntity;
import com.xjj.business.project.service.ProjectService;
import com.xjj.common.XJJConstants;
import com.xjj.framework.json.XjjJson;
import com.xjj.framework.exception.ValidationException;
import com.xjj.framework.web.ManagerInfo;
import com.xjj.framework.web.SpringControllerSupport;
import com.xjj.framework.web.support.Pagination;
import com.xjj.framework.web.support.QueryParameter;
import com.xjj.framework.web.support.XJJParameter;
import com.xjj.sec.entity.AuditStatus;
import com.xjj.sec.entity.UserRoleEntity;
import com.xjj.sec.entity.XjjUser;
import com.xjj.sec.service.UserRoleService;
import com.xjj.sec.service.UserService;
import com.xjj.sys.xfile.dao.XfileDao;
import com.xjj.sys.xfile.entity.XfileEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.xjj.framework.security.annotations.SecCreate;
import com.xjj.framework.security.annotations.SecDelete;
import com.xjj.framework.security.annotations.SecEdit;
import com.xjj.framework.security.annotations.SecList;
import com.xjj.framework.security.annotations.SecPrivilege;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/business/project")
public class ProjectController extends SpringControllerSupport {
    @Autowired
    private ProjectService projectService;
    @Autowired
    private UserRoleService userRoleService;
    @Autowired
    private UserService userService;
    @Autowired
    private MsgService msgService;
    @Autowired
    private XfileDao xfileDao;

    @SecPrivilege(title = "项目管理")
    @RequestMapping(value = "/index")
    public String index(Model model) {
        //获取当前登录用户
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        ManagerInfo info = (ManagerInfo)request.getSession().getAttribute(XJJConstants.SESSION_MANAGER_INFO_KEY);

        //查询角色集合
        XJJParameter roleParam = new XJJParameter();
        roleParam.addQuery("query.userId@eq@s", info.getUserId());
        List<UserRoleEntity> list = userRoleService.findList(roleParam);
        List<String> roles = new ArrayList<>();
        if (list != null && list.size() > 0) {
            for (UserRoleEntity userRole: list) {
                roles.add(userRole.getRoleId().toString());
            }
        }
        model.addAttribute("roles", roles);
        String page = this.getViewPath("index");
        return page;
    }

    @SecList
    @RequestMapping(value = "/list")
    public String list(Model model,
                       @QueryParameter XJJParameter query,
                       @ModelAttribute("page") Pagination page
    ) {
        page = projectService.findPage(query, page);
        //获取当前登录用户
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        ManagerInfo info = (ManagerInfo)request.getSession().getAttribute(XJJConstants.SESSION_MANAGER_INFO_KEY);

        //查询角色集合
        XJJParameter roleParam = new XJJParameter();
        roleParam.addQuery("query.userId@eq@s", info.getUserId());
        List<UserRoleEntity> list = userRoleService.findList(roleParam);
        List<String> roles = new ArrayList<>();
        if (list != null && list.size() > 0) {
            for (UserRoleEntity userRole: list) {
                roles.add(userRole.getRoleId().toString());
            }
        }
        model.addAttribute("roles", roles);
        return getViewPath("list");
    }

    @SecCreate
    @RequestMapping("/input")
    public String create(@ModelAttribute("project") ProjectEntity project, Model model) {
        return getViewPath("input");
    }

    @SecEdit
    @RequestMapping("/input/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        ProjectEntity project = projectService.getById(id);
        model.addAttribute("project", project);
        return getViewPath("input");
    }

    @SecCreate
    @SecEdit
    @RequestMapping("/save")
    public @ResponseBody
    XjjJson save(@ModelAttribute ProjectEntity project) {

        validateSave(project);
        try {
            if (project.isNew()) {
                //查询是否有相同用户
                XJJParameter param = new XJJParameter();
                param.addQuery("query.name@eq@s", project.getName());
                ProjectEntity projectEntity = projectService.getByParam(param);

                if (projectEntity != null) {
                    return XjjJson.error("保存失败，此项目已被申报过!!!");
                }else {
                    //project.setCreateDate(new Date());
                    project.setStatus(XJJConstants.AUDIT_STATUS_WAITING);
                    project.setAuditstatus(XJJConstants.AUDIT_STATUS_WAITING);
                    project.setDeclarestatus(XJJConstants.AUDIT_STATUS_WAITING);
                    projectService.save(project);
                }

            } else {
                projectService.update(project);
            }
        }catch (Exception e) {
            return XjjJson.error("保存失败，请联系管理员");
        }

        return XjjJson.success("保存成功");
    }


    /**
     * 数据校验
     **/
    private void validateSave(ProjectEntity project) {
        //必填项校验
    }

    @SecDelete
    @RequestMapping("/delete/{id}")
    public @ResponseBody
    XjjJson delete(@PathVariable("id") Long id) {
        projectService.delete(id);
        return XjjJson.success("成功删除1条");
    }

    @SecDelete
    @RequestMapping("/delete")
    public @ResponseBody
    XjjJson delete(@RequestParam("ids") Long[] ids) {
        if (ids == null || ids.length == 0) {
            return XjjJson.error("没有选择删除记录");
        }
        for (Long id : ids) {
            projectService.delete(id);
        }
        return XjjJson.success("成功删除" + ids.length + "条");
    }

    /**
     * 上传文件
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/import", method = RequestMethod.POST)
    public String importFile(Model model) {

        return getViewPath("import");
    }

    @SecEdit
    @RequestMapping("/import/{id}")
    public String importFile(@PathVariable("id") Long id, Model model) {
        ProjectEntity project = projectService.getById(id);
        model.addAttribute("project", project);
        return getViewPath("import");
    }

    /**
     * 导入用户
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/import/save", method = RequestMethod.POST)
    public @ResponseBody
    XjjJson importSave(Model model, @RequestParam(value = "fileId", required = false) Long fileId,
                       @RequestParam(value = "id", required = false) Long projectId) {


        System.out.println("上传开始----");

        try {
            ProjectEntity project = projectService.getById(projectId);
            project.setFileid(fileId);
            ;
            XfileEntity xfileEntity = xfileDao.getById(fileId);
            project.setFileurl(xfileEntity.getUrl());
            projectService.update(project);
            return XjjJson.success("上传成功");
        } catch (ValidationException e) {

            return XjjJson.error("上传失败：<br/>" + e.getMessage());
        }

    }

    /**
     * 上传文件
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/export", method = RequestMethod.POST)
    public String exportFile(Model model) {

        return getViewPath("export");
    }

    @SecEdit
    @RequestMapping("/export/{id}")
    public String exportFile(@PathVariable("id") Long id, Model model) {
        ProjectEntity project = projectService.getById(id);
        model.addAttribute("project", project);
        return getViewPath("export");
    }

    /**
     * 分配评审老师
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/allot", method = RequestMethod.POST)
    public String allot(Model model) {

        return getViewPath("allot");
    }

    @SecEdit
    @RequestMapping("/allot/{id}")
    public String allot(@PathVariable("id") Long id, Model model) {
        Collection<XjjUser> auditors = new ArrayList<>();
        ProjectEntity project = projectService.getById(id);
        model.addAttribute("project", project);
        //查询所有的评审专家 role_id = 5 表示角色为评审专家
        XJJParameter roleParam = new XJJParameter();
        roleParam.addQuery("query.roleId@eq@s", "5");
        List<UserRoleEntity> list = userRoleService.findList(roleParam);
        if (list != null && list.size() > 0) {
            for (UserRoleEntity userRole: list) {
                //查询用户集合
                XjjUser byId = userService.getById(userRole.getUserId());
                auditors.add(byId);
            }
        }
        model.addAttribute("auditors", auditors);

        return getViewPath("allot");
    }

    /**
     * 导入用户
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/allot/save", method = RequestMethod.POST)
    public @ResponseBody
    XjjJson allotSave(Model model, @RequestParam(value = "auditor", required = false) String auditor,
                      @RequestParam(value = "id", required = false) Long projectId) {


        System.out.println("分配评审专家开始----");

        try {
            ProjectEntity project = projectService.getById(projectId);
            project.setAuditor(auditor);
            project.setAuditstatus("待审核");
            projectService.update(project);
            return XjjJson.success("分配评审专家成功");
        } catch (ValidationException e) {

            return XjjJson.error("分配评审专家失败：<br/>" + e.getMessage());
        }

    }

    /**
     * 分配评审老师
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/audit", method = RequestMethod.POST)
    public String audit(Model model) {

        return getViewPath("audit");
    }

    @SecEdit
    @RequestMapping("/audit/{id}")
    public String audit(@PathVariable("id") Long id, Model model) {
        AuditStatus auditStatus;
        Collection<AuditStatus> auditstatusList = new ArrayList<>();

        auditStatus = new AuditStatus();
        auditStatus.setAuditStatus("succeed");
        auditStatus.setStatusName("通过");
        auditstatusList.add(auditStatus);
        auditStatus = new AuditStatus();
        auditStatus.setAuditStatus("failure");
        auditStatus.setStatusName("未通过");
        auditstatusList.add(auditStatus);
        auditStatus = new AuditStatus();
        auditStatus.setAuditStatus("wait");
        auditStatus.setStatusName("待审核（申报）");
        auditstatusList.add(auditStatus);
        model.addAttribute("auditstatusList", auditstatusList);
        ProjectEntity project = projectService.getById(id);
        model.addAttribute("project", project);
        return getViewPath("audit");
    }

    /**
     * 导入用户
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/audit/save", method = RequestMethod.POST)
    public @ResponseBody
    XjjJson auditSave(Model model, @RequestParam(value = "auditstatus", required = false) String auditstatus,
                      @RequestParam(value = "id", required = false) Long projectId) {


        System.out.println("审核项目开始----");
        //获取当前登录用户
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        ManagerInfo info = (ManagerInfo)request.getSession().getAttribute(XJJConstants.SESSION_MANAGER_INFO_KEY);


        try {
            ProjectEntity project = projectService.getById(projectId);
            project.setAuditstatus(auditstatus);
            if ("succeed".equals(auditstatus)) {
                project.setStatus("succeed");
                //保存消息
                MsgEntity msg = new MsgEntity();
                msg.setSender(info.getLoginName());
                msg.setSendtime(new Date());
                msg.setMsg("祝贺，该项目审核成功！！！");
                msg.setReceiver(project.getDeclarant());
                msgService.save(msg);
            }
            if ("failure".equals(auditstatus)) {
                project.setStatus("failure");
            }
            projectService.update(project);
            return XjjJson.success("审核项目成功");
        } catch (ValidationException e) {

            return XjjJson.error("审核项目失败：<br/>" + e.getMessage());
        }

    }

    /**
     * 分配评审老师
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/appraise", method = RequestMethod.POST)
    public String appraise(Model model) {

        return getViewPath("appraise");
    }

    @SecEdit
    @RequestMapping("/appraise/{id}")
    public String appraise(@PathVariable("id") Long id, Model model) {
        ProjectEntity project = projectService.getById(id);
        model.addAttribute("project", project);

        return getViewPath("appraise");
    }

    /**
     * 导入用户
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/appraise/save", method = RequestMethod.POST)
    public @ResponseBody
    XjjJson appraiseSave(Model model, @RequestParam(value = "appraise", required = false) String appraise,
                         @RequestParam(value = "id", required = false) Long projectId) {


        System.out.println("评价项目开始----");

        try {
            ProjectEntity project = projectService.getById(projectId);
            project.setAppraise(appraise);
            projectService.update(project);
            return XjjJson.success("评价项目成功");
        } catch (ValidationException e) {

            return XjjJson.error("评价项目失败：<br/>" + e.getMessage());
        }

    }
}