/****************************************************
 * Description: Controller for t_bis_news
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
	*  2021-05-07 zhanghejie Create File
**************************************************/
package com.xjj.business.news.web;
import com.xjj.business.news.entity.NewsEntity;
import com.xjj.business.news.service.NewsService;
import com.xjj.framework.json.XjjJson;
import com.xjj.framework.exception.ValidationException;
import com.xjj.framework.web.SpringControllerSupport;
import com.xjj.framework.web.support.Pagination;
import com.xjj.framework.web.support.QueryParameter;
import com.xjj.framework.web.support.XJJParameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xjj.framework.security.annotations.SecCreate;
import com.xjj.framework.security.annotations.SecDelete;
import com.xjj.framework.security.annotations.SecEdit;
import com.xjj.framework.security.annotations.SecList;
import com.xjj.framework.security.annotations.SecPrivilege;

@Controller
@RequestMapping("/business/news")
public class NewsController extends SpringControllerSupport{
	@Autowired
	private NewsService newsService;
	
	
	@SecPrivilege(title="新闻资讯管理")
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
		page = newsService.findPage(query,page);
		return getViewPath("list");
	}
	
	@SecCreate
	@RequestMapping("/input")
	public String create(@ModelAttribute("news") NewsEntity news,Model model){
		return getViewPath("input");
	}
	
	@SecEdit
	@RequestMapping("/input/{id}")
	public String edit(@PathVariable("id") Long id, Model model){
		NewsEntity news = newsService.getById(id);
		model.addAttribute("news",news);
		return getViewPath("input");
	}
	
	@SecCreate
	@SecEdit
	@RequestMapping("/save")
	public @ResponseBody XjjJson save(@ModelAttribute NewsEntity news){
		
		validateSave(news);
		if(news.isNew())
		{
			//news.setCreateDate(new Date());
			newsService.save(news);
		}else
		{
			newsService.update(news);
		}
		return XjjJson.success("保存成功");
	}
	
	
	/**
	 * 数据校验
	 **/
	private void validateSave(NewsEntity news){
		//必填项校验
	}
	
	@SecDelete
	@RequestMapping("/delete/{id}")
	public @ResponseBody XjjJson delete(@PathVariable("id") Long id){
		newsService.delete(id);
		return XjjJson.success("成功删除1条");
	}
	@SecDelete
	@RequestMapping("/delete")
	public @ResponseBody XjjJson delete(@RequestParam("ids") Long[] ids){
		if(ids == null || ids.length == 0){
			return XjjJson.error("没有选择删除记录");
		}
		for(Long id : ids){
			newsService.delete(id);
		}
		return XjjJson.success("成功删除"+ids.length+"条");
	}
}

