package com.sufian.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sufian.project.dao.test.EmployeeDao;
import com.sufian.project.entity.test.Employee;
import com.sufian.project.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    private final EmployeeDao employeeDao;

    @Autowired
    public EmployeeServiceImpl(EmployeeDao employeeDao) {
        this.employeeDao = employeeDao;
    }

    @Override
    public List<Employee> getAllEmployees() {
        return employeeDao.getAllEmployees();
    }

    @Override
    public Employee getEmployeeById(Long id) {
        return employeeDao.getEmployeeById(id);
    }

    @Override
    public Employee createEmployee(Employee employee) {
    	employeeDao.createEmployee(employee);
        return employee;
    }

    @Override
    public Employee updateEmployee(Long id, Employee employee) {
    	employeeDao.updateEmployee(employee);
        return employee;
    }

    @Override
    public void deleteEmployee(Long id) {
        employeeDao.deleteEmployee(id);
    }
}
