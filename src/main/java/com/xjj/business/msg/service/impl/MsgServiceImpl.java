/****************************************************
 * Description: ServiceImpl for t_bis_msg
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-10 zhanghejie Create File
**************************************************/

package com.xjj.business.msg.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.xjj.framework.dao.XjjDAO;
import com.xjj.framework.service.XjjServiceSupport;
import com.xjj.business.msg.entity.MsgEntity;
import com.xjj.business.msg.dao.MsgDao;
import com.xjj.business.msg.service.MsgService;

@Service
public class MsgServiceImpl extends XjjServiceSupport<MsgEntity> implements MsgService {

	@Autowired
	private MsgDao msgDao;

	@Override
	public XjjDAO<MsgEntity> getDao() {
		
		return msgDao;
	}
}