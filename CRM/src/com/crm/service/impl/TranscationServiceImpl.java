package com.crm.service.impl;



import java.sql.SQLException;

import com.crm.dao.TranscationDao;
import com.crm.dao.UserDao;
import com.crm.service.TranscationService;
import com.crm.service.UserService;
import com.crm.viewBean.TranscationBean;

public class TranscationServiceImpl implements TranscationService
{

	private TranscationDao transDao;

	public TranscationDao getTranscationDao()
	{
		return this.transDao;
	}

	public void setTranscationDao(TranscationDao transDao)
	{
		this.transDao = transDao;
	}

	@Override
	public TranscationBean getTranscation(int accountNo) throws SQLException 
	{
		return transDao.getTranscation(accountNo);
	}

	}

