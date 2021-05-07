/****************************************************
 * Description: ServiceImpl for t_bis_news
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-07 zhanghejie Create File
**************************************************/

package com.xjj.business.news.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.xjj.framework.dao.XjjDAO;
import com.xjj.framework.service.XjjServiceSupport;
import com.xjj.business.news.entity.NewsEntity;
import com.xjj.business.news.dao.NewsDao;
import com.xjj.business.news.service.NewsService;

@Service
public class NewsServiceImpl extends XjjServiceSupport<NewsEntity> implements NewsService {

	@Autowired
	private NewsDao newsDao;

	@Override
	public XjjDAO<NewsEntity> getDao() {
		
		return newsDao;
	}
}