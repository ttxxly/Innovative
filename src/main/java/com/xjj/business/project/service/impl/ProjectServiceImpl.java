/****************************************************
 * Description: ServiceImpl for t_bis_project
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-06 zhanghejie Create File
**************************************************/

package com.xjj.business.project.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.xjj.framework.dao.XjjDAO;
import com.xjj.framework.service.XjjServiceSupport;
import com.xjj.business.project.entity.ProjectEntity;
import com.xjj.business.project.dao.ProjectDao;
import com.xjj.business.project.service.ProjectService;

@Service
public class ProjectServiceImpl extends XjjServiceSupport<ProjectEntity> implements ProjectService {

	@Autowired
	private ProjectDao projectDao;

	@Override
	public XjjDAO<ProjectEntity> getDao() {
		
		return projectDao;
	}
}