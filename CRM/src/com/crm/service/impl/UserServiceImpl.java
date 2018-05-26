package com.crm.service.impl;



import java.sql.SQLException;

import com.crm.dao.UserDao;
import com.crm.service.UserService;

public class UserServiceImpl implements UserService
{

	private UserDao userDao;

	public UserDao getUserDao()
	{
		return this.userDao;
	}

	public void setUserDao(UserDao userDao)
	{
		this.userDao = userDao;
	}

	@Override
	public int isValidUser(String username, String password) throws SQLException
	{
		return userDao.isValidUser(username, password);
	}

}

