package com.crm.dao.impl;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import TeamRepository.LoginRepository;

import com.crm.dao.UserDao;
import com.crm.viewBean.LoginBean;

/**
* @author CENTAUR
*
*/
public class UserDaoImpl implements UserDao
{

	DataSource dataSource ;

	public DataSource getDataSource()
	{
		return this.dataSource;
	}

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public int isValidUser(String username, String password) throws SQLException
	{
		String query = "Select * from users where username = ? and password = ?";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, username);
		pstmt.setString(2, password);
		ResultSet resultSet = pstmt.executeQuery();
		if(resultSet.next())
		    return resultSet.getInt(3);
        else
           return 0;
       }

	
}