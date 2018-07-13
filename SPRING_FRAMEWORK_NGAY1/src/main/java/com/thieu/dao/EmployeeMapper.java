package com.thieu.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.thieu.model.Employee;

public class EmployeeMapper implements RowMapper<Employee> {
	
	//@Override
	public Employee mapRow(ResultSet rs, int rowNum) throws SQLException{
		Employee e = new Employee();
		e.setId(rs.getInt("id"));
		e.setName(rs.getString("name"));
		e.setEmail(rs.getString("email"));
		e.setPhone(rs.getString("phone"));
		return e;
	}
}
