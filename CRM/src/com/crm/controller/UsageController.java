package com.crm.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.crm.dao.UserDao;
import com.crm.delegate.LoginDelegate;
import com.crm.delegate.TranscationDelegate;
import com.crm.viewBean.LoginBean;
import com.crm.viewBean.TranscationBean;


@Controller
public class UsageController
{
	@Autowired
	private TranscationDelegate transcatDelegate;

	
	LoginBean loginBean;
	int accountNo=2;

	
	@RequestMapping(value="/transcat",method=RequestMethod.GET)
	public ModelAndView executeMyUsage(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("loginBean")TranscationBean transcatBean)
	{
		ModelAndView model= null;
			
		try
		{
			System.out.println("hey"+request.getAttribute("accountNo"));
			System.out.println("Account No from Bean"+ accountNo);
				model = new ModelAndView("trascationPage");				 
				 
			}
			
		
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
}
