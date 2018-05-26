package com.crm.delegate;


import java.sql.SQLException;

import com.crm.service.UserService;

public class LoginDelegate
{
	private UserService userService;

	public UserService getUserService()
	{
		return this.userService;
	}

	public void setUserService(UserService userService)
	{
		this.userService = userService;
	}

	public int isValidUser(String username, String password) throws SQLException
	{
	    return userService.isValidUser(username, password);
	}
}
