package com.thieu.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.thieu.model.Employee;

public class EmployeeDao {
	private JdbcTemplate jdbcTemplate;


	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public void addEmployee(Employee e) {
		String query = "insert into employee (name,email,phone) values (?,?,?)";
		jdbcTemplate.update(query,e.getName(),e.getEmail(),e.getPhone());
	}
	
	public List<Employee> findAll(){
		String query ="select * from employee";
		List<Employee> list = jdbcTemplate.query(query,new EmployeeMapper());
		return list;
	}
	
	public Employee getById(Integer id) {
		String query ="select * from employee where id =?";
		return jdbcTemplate.queryForObject(query,new Object[] {id},new EmployeeMapper());
	}
}
