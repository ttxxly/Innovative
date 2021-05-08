/****************************************************
 * Description: Controller for t_bis_project
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
	*  2021-05-06 zhanghejie Create File
**************************************************/
package com.xjj.business.project.web;
import com.xjj.business.project.entity.ProjectEntity;
import com.xjj.business.project.service.ProjectService;
import com.xjj.framework.json.XjjJson;
import com.xjj.framework.exception.ValidationException;
import com.xjj.framework.utils.Excel2007Util;
import com.xjj.framework.web.SpringControllerSupport;
import com.xjj.framework.web.support.Pagination;
import com.xjj.framework.web.support.QueryParameter;
import com.xjj.framework.web.support.XJJParameter;
import com.xjj.sec.entity.XjjUser;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/business/project")
public class ProjectController extends SpringControllerSupport{
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private XfileDao xfileDao;

	@SecPrivilege(title="项目管理")
	@RequestMapping(value = "/index")
	public String index(Model model) {
		String page = this.getViewPath("index");
		return page;
	}
	
	@SecList
	@RequestMapping(value = "/list")
	public String list(Model model,
			@QueryParameter XJJParameter query,
			@ModelAttribute("page") Pagination page
			) {
		page = projectService.findPage(query,page);
		return getViewPath("list");
	}
	
	@SecCreate
	@RequestMapping("/input")
	public String create(@ModelAttribute("project") ProjectEntity project,Model model){
		return getViewPath("input");
	}
	
	@SecEdit
	@RequestMapping("/input/{id}")
	public String edit(@PathVariable("id") Long id, Model model){
		ProjectEntity project = projectService.getById(id);
		model.addAttribute("project",project);
		return getViewPath("input");
	}
	
	@SecCreate
	@SecEdit
	@RequestMapping("/save")
	public @ResponseBody XjjJson save(@ModelAttribute ProjectEntity project){
		
		validateSave(project);
		if(project.isNew())
		{
			//project.setCreateDate(new Date());
			projectService.save(project);
		}else
		{
			projectService.update(project);
		}
		return XjjJson.success("保存成功");
	}
	
	
	/**
	 * 数据校验
	 **/
	private void validateSave(ProjectEntity project){
		//必填项校验
	}
	
	@SecDelete
	@RequestMapping("/delete/{id}")
	public @ResponseBody XjjJson delete(@PathVariable("id") Long id){
		projectService.delete(id);
		return XjjJson.success("成功删除1条");
	}
	@SecDelete
	@RequestMapping("/delete")
	public @ResponseBody XjjJson delete(@RequestParam("ids") Long[] ids){
		if(ids == null || ids.length == 0){
			return XjjJson.error("没有选择删除记录");
		}
		for(Long id : ids){
			projectService.delete(id);
		}
		return XjjJson.success("成功删除"+ids.length+"条");
	}
	/**
	 * 上传文件
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/import", method = RequestMethod.POST)
	public String importFile(Model model) {

		return getViewPath("import");
	}

	@SecEdit
	@RequestMapping("/import/{id}")
	public String importFile(@PathVariable("id") Long id, Model model){
		ProjectEntity project = projectService.getById(id);
		model.addAttribute("project",project);
		return getViewPath("import");
	}

	/**
	 * 导入用户
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/import/save", method = RequestMethod.POST)
	public @ResponseBody XjjJson importSave(Model model,@RequestParam (value="fileId",required=false) Long fileId,
											@RequestParam (value="id",required=false) Long projectId) {


		System.out.println("上传开始----");

		try {
			ProjectEntity project = projectService.getById(projectId);
			project.setFileId(fileId);
			XfileEntity xfileEntity = xfileDao.getById(fileId);
			project.setFileUrl(xfileEntity.getUrl());
			projectService.update(project);
			return XjjJson.success("上传成功");
		} catch (ValidationException e) {

			return XjjJson.error("上传失败：<br/>"+e.getMessage());
		}

	}

	/**
	 * 上传文件
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/export", method = RequestMethod.POST)
	public String exportFile(Model model) {

		return getViewPath("export");
	}

	@SecEdit
	@RequestMapping("/export/{id}")
	public String exportFile(@PathVariable("id") Long id, Model model){
		ProjectEntity project = projectService.getById(id);
		model.addAttribute("project",project);
		return getViewPath("export");
	}


}

