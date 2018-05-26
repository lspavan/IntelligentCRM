package com.crm.dao;



	import java.sql.SQLException;

import com.crm.viewBean.TranscationBean;

	/**
	 * @author CENTAUR
	 * This interface will be used to communicate with the
	 * Database
	 */
	public interface TranscationDao
	{
		public TranscationBean getTranscation(int accountNo) throws SQLException;
	}

