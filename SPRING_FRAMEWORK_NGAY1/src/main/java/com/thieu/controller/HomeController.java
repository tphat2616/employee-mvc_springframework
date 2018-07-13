package com.thieu.controller;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.thieu.dao.EmployeeDao;
import com.thieu.model.Employee;

@Controller
public class HomeController {
	private static final Logger LOGGER = Logger.getLogger(HomeController.class.getName());
	
	@Autowired
	private EmployeeDao employeeDao;
	
	@RequestMapping("home")
	public String viewHome() {
		return "home";
	}
	
	@RequestMapping(value = "/listEmployee", method = RequestMethod.GET)
	public ModelAndView listEmployee() {
		List<Employee> list = employeeDao.findAll();
		ModelAndView mv = new ModelAndView("listEmployee");
		mv.addObject("listEmployee", list);
		// trả về danh sách với items = "${listEmployee}"
		return mv;
	}
	
	@RequestMapping(value="/addNewEmployee" , method = RequestMethod.POST)
	public String loadFormNewEmployee() {
		return "newEmployee";
	}
	
	@RequestMapping(value ="/editNewEmployee" , method = RequestMethod.POST)
	public ModelAndView editNewEmployee(@RequestParam int id) {
		ModelAndView mv = new ModelAndView("newEmployee");
		mv.addObject("Employee", employeeDao.getById(id));
		return mv;
	}
	
	@RequestMapping(value = "/submitNewEmployee" , method = RequestMethod.POST)
	@ResponseBody
	public String submitNewEmployee(@RequestParam String name, @RequestParam String email, @RequestParam String phone) {
		String message = "Can't add new employee...";
		try {
			Employee e = new Employee();
			e.setName(name);
			e.setEmail(email);
			e.setPhone(phone);
			employeeDao.addEmployee(e);
			message = "Add new successful...";
		} catch (Exception ex) {
			
		};
		return message;
	}
}
