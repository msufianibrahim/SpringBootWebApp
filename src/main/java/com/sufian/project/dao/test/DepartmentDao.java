package com.sufian.project.dao.test;

import java.util.List;

import com.sufian.project.entity.test.Department;

public interface DepartmentDao {
    List<Department> getAllDepartments();
    Department getDepartmentById(Long id);
    void createDepartment(Department department);
    void updateDepartment(Department department);
    void deleteDepartment(Long id);
}
