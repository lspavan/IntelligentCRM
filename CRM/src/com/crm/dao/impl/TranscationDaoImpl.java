package com.crm.dao.impl;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.crm.dao.TranscationDao;

import com.crm.viewBean.*;

/**
* @author CENTAUR
*
*/
public class TranscationDaoImpl implements TranscationDao
{

	DataSource dataSource ;
	TranscationBean transBean;

	public DataSource getDataSource()
	{
		return this.dataSource;
	}

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}



	@Override
	public TranscationBean getTranscation(int accountNo) throws SQLException {
		String query = "Select * from transcations where accountno = ?";
		System.out.println("query is "+query);
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setInt(1, accountNo);
		
		ResultSet resultSet = pstmt.executeQuery();
		if(resultSet.next()){
			System.out.println("date" +resultSet.getString(1));
			System.out.println(resultSet.getString(1));
			System.out.println(resultSet.getString(2));
			System.out.println(resultSet.getLong(3));
			System.out.println(resultSet.getLong(4));
			System.out.println(resultSet.getLong(5));
			System.out.println(resultSet.getInt(6));
       
       }
		return transBean;

}
	
}