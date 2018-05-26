package com.crm.service;


import java.sql.SQLException;

/**
 * @author CENTAUR
 *
 */
public interface UserService
{
	public int isValidUser(String username, String password) throws SQLException;
}
