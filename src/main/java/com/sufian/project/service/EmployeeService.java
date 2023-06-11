package com.sufian.project.service;

import java.util.List;

import com.sufian.project.entity.test.Employee;

/**
 * one service interface for each entity assuming each 
 * entity will have more and distinct methods in the future
 */

public interface EmployeeService {
    List<Employee> getAllEmployees();
    Employee getEmployeeById(Long id);
    Employee createEmployee(Employee employee);
    Employee updateEmployee(Long id, Employee employee);
    void deleteEmployee(Long id);
}
