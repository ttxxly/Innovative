/****************************************************
 * Description: ServiceImpl for 角色
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-06 zhanghejie Create File
**************************************************/

package com.xjj.business.test.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.xjj.framework.dao.XjjDAO;
import com.xjj.framework.service.XjjServiceSupport;
import com.xjj.business.test.entity.TestEntity;
import com.xjj.business.test.dao.TestDao;
import com.xjj.business.test.service.TestService;

@Service
public class TestServiceImpl extends XjjServiceSupport<TestEntity> implements TestService {

	@Autowired
	private TestDao testDao;

	@Override
	public XjjDAO<TestEntity> getDao() {
		
		return testDao;
	}
}