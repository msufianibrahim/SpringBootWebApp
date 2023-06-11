package com.sufian.project.dao.test;

import java.util.List;

import com.sufian.project.entity.test.Employee;

public interface EmployeeDao {
    List<Employee> getAllEmployees();
    Employee getEmployeeById(Long id);
    void createEmployee(Employee employee);
    void updateEmployee(Employee employee);
    void deleteEmployee(Long id);
}
