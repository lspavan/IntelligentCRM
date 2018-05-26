package com.crm.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.crm.dao.UserDao;
import com.crm.delegate.LoginDelegate;
import com.crm.viewBean.LoginBean;


@Controller
public class LoginController
{
	@Autowired
	private LoginDelegate loginDelegate;
	
	@Autowired
	private UserDao userDao;

	@RequestMapping(value="/login",method=RequestMethod.GET)
	public ModelAndView displayLogin(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model = new ModelAndView("login");
		LoginBean loginBean = new LoginBean();
		model.addObject("loginBean", loginBean);
		return model;
	}
	
	
	@RequestMapping(value="/logins/{accountNo}/{topping}",method=RequestMethod.GET)
	public ModelAndView displayLogins(HttpServletRequest request, HttpServletResponse response, @PathVariable(value = "accountNo") int accountNo, @PathVariable(value = "topping") String topping)
	{
		System.out.println(accountNo);
		ModelAndView model = new ModelAndView("statement");
		request.setAttribute("accountNo", accountNo);
		request.setAttribute("topping", topping);
		return model;
	}
	
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView executeLogin(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("loginBean")LoginBean loginBean)
	{
		ModelAndView model= null;
		try
		{
			int isValidUser = loginDelegate.isValidUser(loginBean.getUsername(), loginBean.getPassword());
			if(isValidUser!=0)
			{
				System.out.println("User Login Successful");
				request.setAttribute("loggedInUser", loginBean.getUsername());
				request.setAttribute("accountNo", isValidUser);
				loginBean.setAccountNo(isValidUser);
				
				System.out.println(loginBean.getAccountNo());
				model = new ModelAndView("welcome");
			}
			else
			{
				model = new ModelAndView("login");
model.addObject("loginBean", loginBean);
				request.setAttribute("message", "Invalid credentials!!");
			}

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
}
