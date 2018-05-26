package com.crm.service;


import java.sql.SQLException;

import com.crm.viewBean.TranscationBean;

/**
 * @author CENTAUR
 *
 */
public interface TranscationService
{
	public TranscationBean getTranscation(int accountNo) throws SQLException;
}
