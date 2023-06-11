package com.sufian.project.service;

import java.util.List;

import com.sufian.project.entity.test.Department;

/**
 * one service interface for each entity assuming each entity will have more and distinct methods in the future
 */

public interface DepartmentService {
    List<Department> getAllDepartments();
    Department getDepartmentById(Long id);
    Department createDepartment(Department department);
    Department updateDepartment(Long id, Department department);
    void deleteDepartment(Long id);
}
