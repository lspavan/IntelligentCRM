package com.crm.delegate;


import java.sql.SQLException;

import com.crm.service.TranscationService;
import com.crm.viewBean.TranscationBean;

public class TranscationDelegate
{
	private TranscationService TranscationService;

	public TranscationService getTranscationService()
	{
		return this.TranscationService;
	}

	public void setTranscationService(TranscationService TranscationService)
	{
		this.TranscationService = TranscationService;
	}

	public TranscationBean getTranscation(int accountNo) throws SQLException 
	{
		return TranscationService.getTranscation(accountNo);
	}
}
